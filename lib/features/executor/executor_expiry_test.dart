// Checks expiry of a selected will while the app remains in the foreground.
// Owns automatic permission revalidation and the ended-access return.
// Does not change a live donor's release period.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/navigation_harness.dart';
import 'access_test_fixtures.dart';

void main() {
  testWidgets('foreground expiry clears the will and returns to shared wills', (
    tester,
  ) async {
    final scenario = AccessScenario()
      ..received = [
        {
          ...receivedWill,
          'expire_at': '${DateTime.now().millisecondsSinceEpoch + 60000}',
        },
      ];
    final harness = NavigationHarness(
      hasFactors: false,
      respond: scenario.respond,
    );
    addTearDown(harness.dispose);
    await harness.mount(tester);
    harness.router.go('/executor/grant');
    await tester.pumpAndSettle();
    expect(find.text('Will overview'), findsOneWidget);
    scenario.received = [
      {...receivedWill, 'expire_at': '1'},
    ];
    await tester.pump(const Duration(seconds: 61));
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/executor');
    expect(harness.router.state.uri.queryParameters['notice'], 'expired');
    expect(find.text('Will overview'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
