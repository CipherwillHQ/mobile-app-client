// Verifies the global update bar remains inside real application privacy gates.
// Owns background shielding, vault locking and return-to-app update checks.
// Does not use native handoff exceptions to preserve an unlocked session.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../features/security/lock_screen.dart';
import '../../features/security/session_controller.dart';
import '../../testing/fake_app_update.dart';
import '../../testing/navigation_harness.dart';
import 'update_bar.dart';

void main() {
  testWidgets(
    'store handoff shields the bar and locks the vault on background',
    (tester) async {
      final service = FakeAppUpdates();
      final harness = NavigationHarness(updater: service);
      addTearDown(harness.dispose);
      await harness.mount(tester);
      final lease = harness.container.read(sessionProvider.notifier).lease();
      expect(find.byType(UpdateBar).hitTestable(), findsOneWidget);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
      await tester.pumpAndSettle();
      expect(lease.check, throwsStateError);
      expect(find.byType(UpdateBar).hitTestable(), findsNothing);
      expect(harness.container.read(sessionProvider), isNull);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      await tester.pumpAndSettle();
      expect(find.byType(UpdateBar).hitTestable(), findsOneWidget);
      expect(find.byType(LockScreen), findsOneWidget);
      expect(service.checks, 2);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
