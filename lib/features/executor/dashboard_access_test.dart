// Exercises the four owner dashboard access scenarios through real routes.
// Owns conditional widgets, priority, resume refresh and menu regressions.
// Does not access real accounts or make live permission changes.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/app_sidebar.dart';
import '../../testing/navigation_harness.dart';
import 'access_test_fixtures.dart';
import 'released_access_review.dart';

void main() {
  late AccessScenario scenario;
  late NavigationHarness harness;
  setUp(() {
    scenario = AccessScenario();
    harness = NavigationHarness(hasFactors: false, respond: scenario.respond);
  });
  tearDown(() => harness.dispose());
  for (final received in [false, true]) {
    for (final released in [false, true]) {
      testWidgets('dashboard received=$received released=$released', (
        tester,
      ) async {
        if (received) scenario.received = [receivedWill];
        if (released) scenario.released = [releasedGrant];
        await harness.mount(tester);
        expect(
          find.text('Wills shared with you'),
          received ? findsOneWidget : findsNothing,
        );
        expect(
          find.text('Your will is currently shared'),
          released ? findsOneWidget : findsNothing,
        );
        if (received && released) {
          expect(
            tester.getTopLeft(find.text('Your will is currently shared')).dy,
            lessThan(tester.getTopLeft(find.text('Wills shared with you')).dy),
          );
        }
        expect(harness.router.state.uri.path, '/home');
        expect(find.text('Executor workspace'), findsNothing);
        expect(find.text('Granted beneficiary access'), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      });
    }
  }
  testWidgets('owner menu and Network have no permanent access destinations', (
    tester,
  ) async {
    scenario.received = [receivedWill];
    scenario.released = [releasedGrant];
    await harness.mount(tester);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    expect(find.byType(AppSidebar), findsOneWidget);
    expect(find.text('Executor workspace'), findsNothing);
    expect(find.text('Granted access'), findsNothing);
    await tester.tap(find.byTooltip('Close menu'));
    await tester.pumpAndSettle();
    harness.router.go('/people');
    await tester.pumpAndSettle();
    expect(find.text('Executor workspace'), findsNothing);
    expect(find.text('Wills shared with you'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('review opens a sheet in the owner dashboard', (tester) async {
    scenario.released = [releasedGrant];
    await harness.mount(tester);
    await tester.tap(find.text('Review access'));
    await tester.pumpAndSettle();
    expect(find.byType(ReleasedAccessReview), findsOneWidget);
    expect(find.text('Casey Taylor'), findsOneWidget);
    expect(harness.router.state.uri.path, '/home');
    expect(
      harness.api.calls.any(
        (call) =>
            call.$1 == 'GET_PERSON' && call.$2['id'] == 'beneficiary-person',
      ),
      isTrue,
    );
    await tester.tap(find.byTooltip('Close access review'));
    await tester.pumpAndSettle();
    expect(find.byType(ReleasedAccessReview), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('return from background refreshes both independent grants', (
    tester,
  ) async {
    await harness.mount(tester);
    scenario.received = [receivedWill];
    scenario.released = [releasedGrant];
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    await tester.pump();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.text('Wills shared with you'), findsOneWidget);
    expect(find.text('Your will is currently shared'), findsOneWidget);
    expect(harness.router.state.uri.path, '/home');
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('failed received-access check remains recoverable', (
    tester,
  ) async {
    scenario.failReceived = true;
    await harness.mount(tester);
    expect(find.text('Unable to check wills shared with you.'), findsOneWidget);
    scenario.failReceived = false;
    scenario.received = [receivedWill];
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(find.text('Wills shared with you'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
