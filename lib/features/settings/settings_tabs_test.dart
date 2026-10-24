// Exercises Settings tab navigation and keyboard-reachable profile controls.
// Owns selected-tab destinations and single keyboard-inset behavior.
// Does not persist real account edits or authenticate production users.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import '../../testing/design_harness.dart';
import '../../testing/navigation_harness.dart';
import 'profile_screen.dart';

void main() {
  testWidgets('Profile tab opens existing profile route', (tester) async {
    await tester.pumpWidget(
      const DesignHarness(location: '/profile', screen: ProfileScreen()),
    );
    await tester.pumpAndSettle();
    final router = GoRouter.of(tester.element(find.byType(ProfileScreen)));
    router.go('/settings');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(router.state.uri.path, '/profile');
    expect(find.text('First name'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
    'About tab owns policy links and stays selected after navigation',
    (tester) async {
      final harness = NavigationHarness(hasFactors: false);
      addTearDown(harness.dispose);
      await harness.mount(tester);
      final router = harness.router;
      router.go('/settings');
      await tester.pumpAndSettle();
      expect(find.text('Privacy policy'), findsNothing);
      expect(find.text('Terms of service'), findsNothing);
      await tester.ensureVisible(find.text('About us'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('About us'));
      await tester.pumpAndSettle();
      expect(router.state.uri.path, '/about');
      expect(find.text('About us').hitTestable(), findsOneWidget);
      expect(find.text('Privacy policy'), findsOneWidget);
      expect(find.text('Terms of service'), findsOneWidget);
      await tester.ensureVisible(find.text('General Settings'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('General Settings'));
      await tester.pumpAndSettle();
      expect(router.state.uri.path, '/settings');
      expect(find.text('Privacy policy'), findsNothing);
      expect(find.text('Terms of service'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets('profile stays keyboard-reachable with a single save footer', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(393, 852);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const DesignHarness(
        location: '/profile',
        screen: ProfileScreen(),
        keyboard: 300,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byType(BottomNavigationBar), findsNothing);
    expect(find.text('Save profile'), findsOneWidget);
    expect(tester.getBottomRight(find.text('Save profile')).dy, lessThan(552));
    final list = find.byType(ListView).first;
    expect(tester.getSize(list).height, greaterThan(300));
    final input = find.byType(TextField).first;
    await tester.ensureVisible(input);
    await tester.enterText(input, 'Taylor');
    expect(tester.widget<TextField>(input).controller!.text, 'Taylor');
    expect(tester.takeException(), isNull);
  });
}
