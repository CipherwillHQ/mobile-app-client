// Verifies route access rechecks and removal of unavailable will contents.
// Owns invalid grants, connection recovery, expiry and stale-response cases.
// Does not grant live permissions or create native decrypted file previews.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../core/api/json_values.dart';
import '../../testing/navigation_harness.dart';
import '../storage/file_screen.dart';
import 'access_test_fixtures.dart';

void main() {
  late AccessScenario scenario;
  late NavigationHarness harness;
  setUp(() {
    scenario = AccessScenario()..received = [receivedWill];
    harness = NavigationHarness(hasFactors: false, respond: scenario.respond);
  });
  tearDown(() => harness.dispose());
  for (final destination in [
    '/executor/grant/item/private',
    '/file/private?access=grant',
  ]) {
    testWidgets('denied direct link $destination reads no protected content', (
      tester,
    ) async {
      await harness.mount(tester);
      scenario.denied.add('grant');
      scenario.received = [];
      harness.router.go(destination);
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor');
      expect(find.text('This will is unavailable'), findsOneWidget);
      expect(find.byType(FileScreen), findsNothing);
      expect(
        harness.api.calls.any(
          (call) => [
            'GET_POD',
            'GET_GRANTED_METAMODEL',
            'GET_BENEFICIARY_ENCRYPTION_KEY',
          ].contains(call.$1),
        ),
        isFalse,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
  testWidgets(
    'connection failure hides contents and retries without reporting revocation',
    (tester) async {
      await harness.mount(tester);
      scenario.failAccess = true;
      harness.router.go('/executor/grant');
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor/grant');
      expect(
        find.text('Unable to check will access. Please retry.'),
        findsOneWidget,
      );
      expect(find.text('This will is unavailable'), findsNothing);
      expect(find.text('Alex Taylor'), findsNothing);
      scenario.failAccess = false;
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(find.text('Will overview'), findsOneWidget);
      expect(find.text('Alex Taylor'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'revocation during pagination returns to refreshed shared wills',
    (tester) async {
      await harness.mount(tester);
      scenario.failModels = true;
      harness.router.go('/executor/grant/category/NOTE');
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor');
      expect(find.text('This will is unavailable'), findsOneWidget);
      expect(find.text('Important family details'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets('resuming checks a revoked grant before restoring its pages', (
    tester,
  ) async {
    await harness.mount(tester);
    harness.router.go('/executor/grant/category/NOTE');
    await tester.pumpAndSettle();
    expect(find.text('Important family details'), findsOneWidget);
    scenario.denied.add('grant');
    scenario.received = [];
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/executor');
    expect(find.text('Important family details'), findsNothing);
    expect(find.text('This will is unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
    'late permission response cannot replace a newly selected donor',
    (tester) async {
      scenario.received = [receivedWill, secondWill];
      await harness.mount(tester);
      final first = Completer<Json>();
      scenario.pendingChecks['grant'] = first;
      harness.router.go('/executor/grant');
      await tester.pump();
      harness.router.go('/executor/grant-two');
      await tester.pumpAndSettle();
      expect(find.text('Morgan Taylor'), findsOneWidget);
      first.complete({'getAccessDetails': receivedWill});
      await tester.pumpAndSettle();
      expect(find.text('Morgan Taylor'), findsOneWidget);
      expect(find.text('Alex Taylor'), findsNothing);
      expect(harness.router.state.uri.path, '/executor/grant-two');
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'expired received grants are unavailable and direct links explain why',
    (tester) async {
      scenario.received = [
        receivedWill,
        {...secondWill, 'expire_at': '1'},
      ];
      await harness.mount(tester);
      harness.router.go('/executor');
      await tester.pumpAndSettle();
      expect(find.text('Open will'), findsOneWidget);
      expect(find.text('Access ended'), findsOneWidget);
      harness.router.go('/executor/grant-two');
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor');
      expect(harness.router.state.uri.queryParameters['notice'], 'expired');
      expect(find.text('Will overview'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
