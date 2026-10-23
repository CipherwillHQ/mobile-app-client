// Controls unlocked factors and account-bound asynchronous work
// Owns vault leases and verified biometric retrieval.
// Does not authenticate Firebase accounts or store passwords.

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/crypto/factor_key.dart';
import '../../core/api/json_values.dart';
import 'return_authentication.dart';

class VaultLease {
  final FactorKey? key;
  final void Function() check;
  const VaultLease(this.key, this.check);
}

class SessionController extends Notifier<FactorKey?> {
  int generation = 0;
  String? factorId;
  @override
  FactorKey? build() => null;
  void unlock(Json factor, FactorKey key) {
    if (factor['publicKey'] != key.publicKey) {
      throw StateError('This security factor does not match.');
    }
    generation++;
    factorId = factor['id'].toString();
    state = key;
    ref.read(returnAuthenticationProvider.notifier).require(false);
  }

  void lock({bool requireAuthentication = true}) {
    ref
        .read(returnAuthenticationProvider.notifier)
        .require(requireAuthentication);
    generation++;
    factorId = null;
    state = null;
  }

  VaultLease lease() {
    final epoch = generation;
    final keyless = state == null;
    final uid = ref.read(firebaseProvider).currentUser?.uid;
    return VaultLease(state, () {
      if (ref.read(returnAuthenticationProvider) && keyless ||
          generation != epoch ||
          ref.read(firebaseProvider).currentUser?.uid != uid) {
        throw StateError('Vault locked. Unlock and retry.');
      }
    });
  }

  String alias(Json factor) =>
      ref.read(firebaseProvider).currentUser!.uid +
      ':' +
      factor['id'].toString() +
      ':' +
      factor['publicKey'].toString();
  Future<void> verify(Json factor, String uid) async {
    if (ref.read(firebaseProvider).currentUser?.uid != uid) {
      throw StateError('Account changed. Sign in again.');
    }
    await ref.read(apiProvider).account();
    final current = jsonList(
      (await ref.read(apiProvider).run('GET_FACTORS'))['getFactors'],
    );
    if (ref.read(firebaseProvider).currentUser?.uid != uid) {
      throw StateError('Account changed. Sign in again.');
    }
    if (!current.any(
      (f) => f['id'] == factor['id'] && f['publicKey'] == factor['publicKey'],
    )) {
      await ref
          .read(securityProvider)
          .delete(
            uid +
                ':' +
                factor['id'].toString() +
                ':' +
                factor['publicKey'].toString(),
          );
      throw StateError('This factor was removed or changed.');
    }
  }

  Future<void> accept(
    Json factor,
    FactorKey key,
    String uid, {
    required int epoch,
  }) async {
    await verify(factor, uid);
    if (generation != epoch) {
      throw StateError('Vault locked. Authenticate again.');
    }
    unlock(factor, key);
  }

  Future<void> enableBiometrics(Json factor) async {
    final active = lease();
    final uid = ref.read(firebaseProvider).currentUser!.uid;
    final id = alias(factor);
    if (active.key == null || factor['publicKey'] != active.key!.publicKey) {
      throw StateError('Unlock this factor before enabling biometrics.');
    }
    await verify(factor, uid);
    active.check();
    await ref
        .read(securityProvider)
        .save(
          id,
          jsonEncode({
            'publicKey': active.key!.publicKey,
            'privateKey': active.key!.privateKey,
          }),
        );
    try {
      await verify(factor, uid);
      active.check();
    } catch (_) {
      await ref.read(securityProvider).delete(id);
      rethrow;
    }
  }

  Future<void> biometricUnlock(Json factor) async {
    final epoch = generation;
    final uid = ref.read(firebaseProvider).currentUser!.uid;
    final id = alias(factor);
    await verify(factor, uid);
    final value = await ref.read(securityProvider).read(id);
    if (value == null) {
      throw StateError(
        'Unlock with your factor to enable biometrics on this device.',
      );
    }
    final saved = asJson(jsonDecode(value));
    final key = FactorKey.fromPrivate(saved['privateKey'] as String);
    if (saved['publicKey'] != factor['publicKey']) {
      throw StateError('Saved factor changed. Authenticate it again.');
    }
    await accept(factor, key, uid, epoch: epoch);
  }
}

final sessionProvider = NotifierProvider<SessionController, FactorKey?>(
  SessionController.new,
);
