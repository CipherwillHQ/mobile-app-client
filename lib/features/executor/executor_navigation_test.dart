// Exercises distinct execution navigation through the production router.
// Owns donor switching, shared categories, folder context and owner return.
// Does not decrypt live donor records or invoke native file sharing.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/app_sidebar.dart';
import '../../testing/navigation_harness.dart';
import '../storage/storage_screen.dart';
import '../vault/categories.dart';
import 'access_test_fixtures.dart';
import 'executor_sidebar.dart';

void main() {
  late AccessScenario scenario;
  late NavigationHarness harness;
  setUp(() {
    scenario = AccessScenario()..received = [receivedWill];
    harness = NavigationHarness(hasFactors: false, respond: scenario.respond);
  });
  tearDown(() => harness.dispose());
  testWidgets('received will opens a distinct drawer with shared categories', (
    tester,
  ) async {
    await harness.mount(tester);
    await tester.tap(find.text('Open will'));
    await tester.pumpAndSettle();
    expect(find.text('Will overview'), findsOneWidget);
    expect(find.text('Alex Taylor'), findsOneWidget);
    expect(find.textContaining('Read-only · Available until'), findsOneWidget);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    expect(find.byType(ExecutorSidebar), findsOneWidget);
    expect(find.byType(AppSidebar), findsNothing);
    expect(find.text('Shared wills'), findsOneWidget);
    expect(find.text('My dashboard'), findsOneWidget);
    expect(find.text('Security Factors'), findsNothing);
    expect(find.text('Passwords'), findsNothing);
    await tester.tap(
      find.descendant(
        of: find.byType(ExecutorSidebar),
        matching: find.text('Notes'),
      ),
    );
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/executor/grant/category/NOTE');
    expect(find.text('Important family details'), findsOneWidget);
    expect(find.text('Excluded family note'), findsNothing);
    expect(find.byTooltip('Add item'), findsNothing);
    expect(find.text('Alex Taylor'), findsOneWidget);
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/executor/grant');
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('My dashboard'));
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/home');
    expect(find.text('Dashboard'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
    'shared folders keep execution navigation and contain no owner edits',
    (tester) async {
      await harness.mount(tester);
      harness.router.go('/executor/grant');
      await tester.pumpAndSettle();
      await tester.tap(find.text(categoryFor('FILE').title));
      await tester.pumpAndSettle();
      expect(find.byType(StorageScreen), findsOneWidget);
      expect(harness.router.state.uri.queryParameters['access'], 'grant');
      expect(find.byTooltip('Add file or folder'), findsNothing);
      expect(find.byTooltip('Delete folder'), findsNothing);
      expect(find.text('Excluded family note'), findsNothing);
      await tester.tap(find.text('Family documents'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.queryParameters, {
        'access': 'grant',
        'folder': 'folder',
      });
      expect(find.text('Alex Taylor'), findsOneWidget);
      await tester.tap(find.byTooltip('Open menu'));
      await tester.pumpAndSettle();
      expect(find.byType(ExecutorSidebar), findsOneWidget);
      expect(find.byType(AppSidebar), findsNothing);
      await tester.tap(find.text('Will overview'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor/grant');
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'shared wills switch donor context independently of the owner account',
    (tester) async {
      scenario.received = [receivedWill, secondWill];
      await harness.mount(tester);
      harness.router.go('/executor');
      await tester.pumpAndSettle();
      expect(find.text('Execution dashboard'), findsOneWidget);
      expect(find.text('2 available wills · Read-only'), findsOneWidget);
      await tester.tap(find.text('Open will').last);
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor/grant-two');
      expect(find.text('Morgan Taylor'), findsOneWidget);
      expect(find.text('Alex Taylor'), findsNothing);
      await tester.tap(find.byTooltip('Open menu'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Shared wills'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/executor');
      expect(find.text('Alex Taylor'), findsOneWidget);
      expect(find.text('Morgan Taylor'), findsOneWidget);
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/home');
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
