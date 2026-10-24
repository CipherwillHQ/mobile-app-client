// Verifies owner revocation requires confirmation and backend success.
// Owns cancellation, pending writes, failed responses and dashboard updates.
// Does not send live revoke mutations or use personal beneficiary data.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../core/api/json_values.dart';
import '../../testing/navigation_harness.dart';
import 'access_test_fixtures.dart';

void main() {
  late AccessScenario scenario;
  late NavigationHarness harness;
  setUp(() {
    scenario = AccessScenario()..released = [releasedGrant];
    harness = NavigationHarness(hasFactors: false, respond: scenario.respond);
  });
  tearDown(() => harness.dispose());
  testWidgets('cancel keeps access and sends no mutation', (tester) async {
    await harness.mount(tester);
    await tester.tap(find.text('Review access'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Revoke access'));
    await tester.pumpAndSettle();
    expect(
      find.text('Revoke Casey Taylor’s access to your will?'),
      findsOneWidget,
    );
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(
      harness.api.calls.where((call) => call.$1 == 'REVOKE_ACCESS_TO_MY_WILL'),
      isEmpty,
    );
    expect(find.text('Revoke access'), findsOneWidget);
    expect(find.text('Access revoked.'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
    'pending revoke stays visible and updates even after closing review',
    (tester) async {
      final result = Completer<Json>();
      scenario.revocation = result;
      scenario.received = [receivedWill];
      await harness.mount(tester);
      await tester.tap(find.text('Review access'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Revoke access'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm'));
      await tester.pumpAndSettle();
      final control = find.widgetWithText(TextButton, 'Revoking…');
      expect(tester.widget<TextButton>(control).onPressed, isNull);
      await tester.tap(control);
      await tester.pump();
      expect(
        harness.api.calls
            .where((call) => call.$1 == 'REVOKE_ACCESS_TO_MY_WILL')
            .length,
        1,
      );
      expect(scenario.released, isNotEmpty);
      expect(find.text('Access revoked.'), findsNothing);
      await tester.tap(find.byTooltip('Close access review'));
      await tester.pumpAndSettle();
      expect(find.text('Your will is currently shared'), findsOneWidget);
      result.complete({'revokeAccessToMyWill': true});
      await tester.pumpAndSettle();
      expect(find.text('Your will is currently shared'), findsNothing);
      expect(find.text('Wills shared with you'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  for (final networkFailure in [false, true]) {
    testWidgets(
      '${networkFailure ? 'network failure' : 'false mutation'} keeps access',
      (tester) async {
        scenario.failRevocation = networkFailure;
        if (!networkFailure) {
          scenario.revocation = Completer<Json>()
            ..complete({'revokeAccessToMyWill': false});
        }
        await harness.mount(tester);
        await tester.tap(find.text('Review access'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Revoke access'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();
        expect(scenario.released, hasLength(1));
        expect(find.text('Revoke access'), findsOneWidget);
        expect(find.text('Access revoked.'), findsNothing);
        await tester.tap(find.byTooltip('Close access review'));
        await tester.pumpAndSettle();
        expect(find.text('Your will is currently shared'), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
  testWidgets('revocation removes only the selected beneficiary grant', (
    tester,
  ) async {
    scenario.released = [
      releasedGrant,
      {...releasedGrant, 'id': 'released-two', 'user': 'donor-two'},
    ];
    await harness.mount(tester);
    await tester.tap(find.text('Review access'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Revoke access').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
    expect(scenario.released.single['id'], 'released-two');
    expect(find.text('Casey Taylor'), findsNothing);
    expect(find.text('Morgan Taylor'), findsOneWidget);
    await tester.tap(find.byTooltip('Close access review'));
    await tester.pumpAndSettle();
    expect(find.text('1 beneficiary has access to your will.'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
