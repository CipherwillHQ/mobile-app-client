// Exercises the persistent bar through edits, route changes and foregrounding.
// Owns editor lifetime, draft blocking, cancellations and timer regressions.
// Does not open native stores or install test releases.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_app_update.dart';
import 'app_update_host.dart';
import 'update_bar.dart';
import 'update_controller.dart';
import 'update_test_app.dart';

void main() {
  testWidgets('unknown and current stores leave the app usable without a bar', (
    tester,
  ) async {
    for (final service in [
      FakeAppUpdates()..offer = null,
      FakeAppUpdates()..failCheck = true,
    ]) {
      await tester.pumpWidget(UpdateTestApp(service: service));
      await tester.pumpAndSettle();
      expect(find.byType(UpdateBar), findsNothing);
      expect(find.text('Save').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    }
  });
  testWidgets(
    'appearing and disappearing bar keeps the same editor and draft',
    (tester) async {
      final pending = Completer<void>();
      final service = FakeAppUpdates()..pendingCheck = pending.future;
      await tester.pumpWidget(UpdateTestApp(service: service));
      await tester.pump();
      final editor = tester.state(find.byType(UpdateDraftPage));
      await tester.enterText(find.byType(TextField), 'My unsaved note');
      pending.complete();
      await tester.pumpAndSettle();
      expect(find.byType(UpdateBar), findsOneWidget);
      expect(tester.state(find.byType(UpdateDraftPage)), same(editor));
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'My unsaved note',
      );
      final container = ProviderScope.containerOf(
        tester.element(find.byType(AppUpdateHost)),
      );
      service.offer = null;
      await container.read(appUpdateProvider.notifier).check(force: true);
      await tester.pumpAndSettle();
      expect(find.byType(UpdateBar), findsNothing);
      expect(tester.state(find.byType(UpdateDraftPage)), same(editor));
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        'My unsaved note',
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'bar remains across routes, cancellation and failed store launches',
    (tester) async {
      final service = FakeAppUpdates();
      await tester.pumpWidget(UpdateTestApp(service: service));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next page'));
      await tester.pumpAndSettle();
      expect(find.text('Executor details'), findsOneWidget);
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      expect(service.starts, 1);
      expect(find.byType(UpdateBar), findsOneWidget);
      service.failStart = true;
      await tester.tap(find.text('Update'));
      await tester.pumpAndSettle();
      expect(
        find.text('Unable to open the update. Please try again.'),
        findsOneWidget,
      );
      expect(find.byType(UpdateBar), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets('unsaved note blocks updating and remains editable until Save', (
    tester,
  ) async {
    final service = FakeAppUpdates();
    await tester.pumpWidget(UpdateTestApp(service: service));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Do not lose this note');
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(service.starts, 0);
    expect(find.text('Save your changes before updating.'), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(service.starts, 1);
    expect(
      tester.widget<TextField>(find.byType(TextField)).controller!.text,
      'Do not lose this note',
    );
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('pending store action prevents duplicate taps and new edits', (
    tester,
  ) async {
    final pending = Completer<void>();
    final service = FakeAppUpdates()..pendingStart = pending.future;
    await tester.pumpWidget(UpdateTestApp(service: service));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(service.starts, 1);
    expect(find.text('Opening…'), findsOneWidget);
    expect(
      tester.widget<AbsorbPointer>(find.byType(AbsorbPointer).first).absorbing,
      true,
    );
    pending.complete();
    await tester.pumpAndSettle();
    expect(find.text('Update'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('background skips polling and return refreshes a known offer', (
    tester,
  ) async {
    final service = FakeAppUpdates();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpWidget(UpdateTestApp(service: service));
    await tester.pumpAndSettle();
    final checks = service.checks;
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump(const Duration(minutes: 31));
    expect(service.checks, checks);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(service.checks, checks + 1);
    await tester.pumpWidget(const SizedBox());
  });
}
