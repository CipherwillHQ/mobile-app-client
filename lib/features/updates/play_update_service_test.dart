// Exercises Google Play eligibility and user-triggered native update flows.
// Owns build ordering, fresh retries, cancellation and store fallback tests.
// Does not install packages or depend on a Play Store test account.
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../testing/fake_app_update.dart';
import '../../testing/fake_url_launcher.dart';
import 'play_update_service.dart';
import 'store_update.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('de.ffuf.in_app_update/methods');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Map<String, Object?> info;
  late PlayUpdateService service;
  late FakeUrlLauncher launcher;
  late List<String> calls;
  PlatformException? nativeFailure;
  setUp(() {
    nativeFailure = null;
    calls = [];
    info = {
      'updateAvailability': UpdateAvailability.updateAvailable.value,
      'immediateAllowed': true,
      'flexibleAllowed': true,
      'availableVersionCode': 4,
      'installStatus': InstallStatus.unknown.value,
      'packageName': 'com.cipherwill.app',
      'updatePriority': 0,
    };
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call.method);
      if (call.method == 'checkForUpdate') return info;
      if (nativeFailure != null) throw nativeFailure!;
      return null;
    });
    launcher = FakeUrlLauncher(messenger);
    service = PlayUpdateService(Future.value(updatePackage()));
  });
  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
    launcher.dispose();
  });

  test('newer eligible build offers the correct Play package', () async {
    expect((await service.check())?.url, testStoreUpdate.url);
    for (final build in [3, 2]) {
      info['availableVersionCode'] = build;
      expect(await service.check(), isNull);
    }
    info['availableVersionCode'] = 4;
    info['packageName'] = 'another.app';
    expect(await service.check(), isNull);
  });
  test('current/unknown builds do not offer an update', () async {
    info['updateAvailability'] = 0;
    await expectLater(service.check(), throwsStateError);
    info['updateAvailability'] = 1;
    expect(await service.check(), isNull);
    info['updateAvailability'] = 3;
    expect(await service.check(), isNotNull);
  });
  test('every Update tap obtains fresh Play information', () async {
    final offer = (await service.check())!;
    expect(await service.start(offer), UpdateAction.opened);
    expect(calls, [
      'checkForUpdate',
      'checkForUpdate',
      'performImmediateUpdate',
    ]);
    expect(launcher.calls, isEmpty);
  });
  test(
    'native cancellation keeps the offer without opening the store',
    () async {
      nativeFailure = PlatformException(code: 'USER_DENIED_UPDATE');
      expect(await service.start(testStoreUpdate), UpdateAction.cancelled);
      expect(launcher.calls, isEmpty);
    },
  );
  test(
    'failed immediate flow falls back to the external Play listing',
    () async {
      nativeFailure = PlatformException(code: 'IN_APP_UPDATE_FAILED');
      expect(await service.start(testStoreUpdate), UpdateAction.opened);
      expect(
        launcher.calls.single.arguments['url'],
        testStoreUpdate.url.toString(),
      );
      expect(launcher.calls.single.arguments['useWebView'], false);
    },
  );
  test('disallowed immediate flow opens the listing directly', () async {
    info['immediateAllowed'] = false;
    expect(await service.start(testStoreUpdate), UpdateAction.opened);
    expect(calls, ['checkForUpdate']);
    expect(launcher.calls, hasLength(1));
  });
  test('withdrawn update does not start a stale native flow', () async {
    info['updateAvailability'] = 1;
    expect(await service.start(testStoreUpdate), UpdateAction.unavailable);
    expect(launcher.calls, isEmpty);
  });
  test('check failures surface to the quiet controller', () async {
    messenger.setMockMethodCallHandler(channel, (_) async {
      throw PlatformException(code: 'ERROR_API_NOT_AVAILABLE');
    });
    await expectLater(service.check(), throwsA(isA<PlatformException>()));
    expect(await service.start(testStoreUpdate), UpdateAction.opened);
  });
}
