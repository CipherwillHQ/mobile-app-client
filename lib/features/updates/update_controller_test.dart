// Verifies update persistence and serialized checks/actions.
// Owns quiet failures, cancellation, release withdrawal and disposal coverage.
// Does not run native stores or use account providers.
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_app_update.dart';
import 'store_update.dart';
import 'update_controller.dart';
import 'update_providers.dart';

void main() {
  late FakeAppUpdates service;
  late ProviderContainer container;
  late UpdateController controller;
  setUp(() {
    service = FakeAppUpdates();
    container = ProviderContainer(
      overrides: [appUpdateServiceProvider.overrideWithValue(service)],
    );
    controller = container.read(appUpdateProvider.notifier);
  });
  tearDown(() => container.dispose());
  test('checks quietly ignore failures, preserving the known offer', () async {
    service.failCheck = true;
    await controller.check();
    expect(container.read(appUpdateProvider).available, isNull);
    service.failCheck = false;
    await controller.check(force: true);
    service.failCheck = true;
    await controller.check(force: true);
    expect(container.read(appUpdateProvider).available, same(testStoreUpdate));
  });
  test('duplicate checks are throttled, force checks are serialized', () async {
    final pending = Completer<void>();
    service.pendingCheck = pending.future;
    final first = controller.check();
    final second = controller.check(force: true);
    expect(service.checks, 1);
    pending.complete();
    await Future.wait([first, second]);
    await controller.check();
    expect(service.checks, 1);
    await controller.check(force: true);
    expect(service.checks, 2);
  });
  test('cancellation and launch failure retain the persistent offer', () async {
    await controller.check();
    expect(await controller.update(), true);
    expect(container.read(appUpdateProvider).available, isNotNull);
    service.failStart = true;
    expect(await controller.update(), false);
    expect(container.read(appUpdateProvider).busy, false);
    expect(container.read(appUpdateProvider).available, isNotNull);
  });
  test('updates wait for the pending check and cannot run twice', () async {
    await controller.check();
    final check = Completer<void>();
    final start = Completer<void>();
    service.pendingCheck = check.future;
    service.pendingStart = start.future;
    final checking = controller.check(force: true);
    final updating = controller.update();
    await controller.update();
    expect(service.starts, 0);
    expect(container.read(appUpdateProvider).busy, true);
    check.complete();
    await checking;
    await Future<void>.delayed(Duration.zero);
    expect(service.starts, 1);
    start.complete();
    await updating;
    expect(container.read(appUpdateProvider).busy, false);
  });
  test(
    'confirmed current builds and withdrawn releases clear the bar',
    () async {
      await controller.check();
      service.offer = null;
      await controller.check(force: true);
      expect(container.read(appUpdateProvider).available, isNull);
      service.offer = testStoreUpdate;
      await controller.check(force: true);
      service.action = UpdateAction.unavailable;
      await controller.update();
      expect(container.read(appUpdateProvider).available, isNull);
    },
  );
  test(
    'returning from an opened update flow rechecks installed eligibility',
    () async {
      await controller.check();
      service.action = UpdateAction.opened;
      service.offer = null;
      await controller.update();
      expect(service.checks, 2);
      expect(container.read(appUpdateProvider).available, isNull);
    },
  );
  test(
    'disposed startup check does not write to destroyed providers',
    () async {
      final pending = Completer<void>();
      service.pendingCheck = pending.future;
      final checking = controller.check();
      container.dispose();
      pending.complete();
      await checking;
    },
  );
}
