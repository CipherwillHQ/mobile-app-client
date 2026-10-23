// Verifies factorless accounts enter and return without password unlocking.
// Owns production-gate and background-return regressions.
// Does not bypass sign-in, onboarding or online account checks.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../testing/navigation_harness.dart';
import '../features/security/lock_screen.dart';
import '../features/security/session_controller.dart';

void main() {
  testWidgets('factorless account opens and resumes without a factor prompt', (
    tester,
  ) async {
    final harness = NavigationHarness(hasFactors: false);
    addTearDown(harness.dispose);
    await harness.mount(tester);
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.byType(LockScreen), findsNothing);
    final lease = harness.container.read(sessionProvider.notifier).lease();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    await tester.pumpAndSettle();
    expect(lease.check, throwsStateError);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Use account password'), findsNothing);
    expect(find.byType(LockScreen), findsNothing);
    harness.container.read(sessionProvider.notifier).lease().check();
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
