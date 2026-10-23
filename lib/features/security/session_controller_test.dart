// Verifies biometric approval cannot bypass online factor/account validation.
// Owns prompt races, cancellation and derived-key storage tests.
// Does not simulate actual biometric hardware approval.
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_auth.dart';
import '../../app/providers.dart';
import '../../core/crypto/factor_key.dart';
import '../../core/security/device_security.dart';
import 'session_controller.dart';

class TestSecurity extends DeviceSecurity {
  final records = <String, String>{};
  final deleted = <String>[];
  Future<String?> Function(String)? retrieval;
  @override
  Future<void> save(String id, String secret) async {
    records[id] = secret;
  }

  @override
  Future<String?> read(String id) async =>
      retrieval == null ? records[id] : retrieval!(id);
  @override
  Future<void> delete(String id) async {
    deleted.add(id);
    records.remove(id);
  }
}

void main() {
  final key = FactorKey.master('master-password', '1234');
  final factor = {'id': 'factor1', 'publicKey': key.publicKey};
  late TestSecurity device;
  late FakeAuth auth;
  late FakeApi api;
  late ProviderContainer container;
  late bool removed;
  setUp(() {
    removed = false;
    device = TestSecurity();
    auth = FakeAuth();
    api = FakeApi(
      (name, args) async => {
        'getFactors': removed ? [] : [factor],
      },
    );
    container = ProviderContainer(
      overrides: [
        apiProvider.overrideWithValue(api),
        firebaseProvider.overrideWithValue(auth),
        securityProvider.overrideWithValue(device),
      ],
    );
  });
  tearDown(() {
    container.dispose();
    api.dispose();
  });
  test('only a derived private key is saved after factor unlock', () async {
    final controller = container.read(sessionProvider.notifier);
    controller.unlock(factor, key);
    await controller.enableBiometrics(factor);
    final record = jsonDecode(device.records.values.single);
    expect(record['privateKey'], key.privateKey);
    expect(record['publicKey'], key.publicKey);
    expect(device.records.values.single, isNot(contains('master-password')));
  });
  test(
    'factor removed during biometric approval prevents secret acceptance',
    () async {
      final approval = Completer<String?>();
      device.retrieval = (_) => approval.future;
      final controller = container.read(sessionProvider.notifier);
      final future = controller.biometricUnlock(factor);
      await Future<void>.delayed(Duration.zero);
      removed = true;
      approval.complete(
        jsonEncode({'privateKey': key.privateKey, 'publicKey': key.publicKey}),
      );
      await expectLater(future, throwsStateError);
      expect(container.read(sessionProvider), isNull);
      expect(device.deleted, isNotEmpty);
    },
  );
  test(
    'account switch during biometric approval leaves vault locked',
    () async {
      final approval = Completer<String?>();
      device.retrieval = (_) => approval.future;
      final future = container
          .read(sessionProvider.notifier)
          .biometricUnlock(factor);
      await Future<void>.delayed(Duration.zero);
      auth.user = FakeUser('other_account');
      approval.complete(
        jsonEncode({'privateKey': key.privateKey, 'publicKey': key.publicKey}),
      );
      await expectLater(future, throwsStateError);
      expect(container.read(sessionProvider), isNull);
    },
  );
  test('cancelled and missing biometric secrets cannot unlock', () async {
    device.retrieval = (_) async =>
        throw PlatformException(code: 'BIOMETRIC_CANCELLED');
    await expectLater(
      container.read(sessionProvider.notifier).biometricUnlock(factor),
      throwsA(isA<PlatformException>()),
    );
    expect(container.read(sessionProvider), isNull);
    device.retrieval = (_) async => null;
    await expectLater(
      container.read(sessionProvider.notifier).biometricUnlock(factor),
      throwsStateError,
    );
  });
  test('locking invalidates previously issued vault leases', () {
    final controller = container.read(sessionProvider.notifier);
    controller.unlock(factor, key);
    final lease = controller.lease();
    controller.lock();
    expect(lease.check, throwsStateError);
  });
}
