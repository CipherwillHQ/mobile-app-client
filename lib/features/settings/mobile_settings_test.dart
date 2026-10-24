// Checks requested mobile boundaries for settings, segments and menu controls.
// Owns desktop handoff and three-mode appearance regression coverage.
// Does not reset accounts or export any data.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../testing/design_harness.dart';
import '../../testing/navigation_harness.dart';
import 'account_actions_screen.dart';
import '../backup/backup_screen.dart';
import 'preferences_screen.dart';
import 'appearance.dart';

void main() {
  testWidgets('segments contain category toggles without timeline controls', (
    tester,
  ) async {
    await tester.pumpWidget(
      const DesignHarness(
        location: '/preferences',
        screen: PreferencesScreen(),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(SwitchListTile), findsWidgets);
    expect(find.text('Check-ins & reminders'), findsNothing);
    expect(find.text('Reset timeline'), findsNothing);
  });
  testWidgets('account and backup actions show the desktop URL', (
    tester,
  ) async {
    for (final screen in [const AccountActionsScreen(), const BackupScreen()]) {
      await tester.pumpWidget(
        DesignHarness(key: UniqueKey(), location: '/desktop', screen: screen),
      );
      await tester.pumpAndSettle();
      expect(find.text('https://cipherwill.com/app'), findsOneWidget);
      expect(find.textContaining('on a desktop'), findsOneWidget);
      expect(find.text('Delete vault data'), findsNothing);
      expect(find.text('Choose backup ZIP'), findsNothing);
      await tester.pumpWidget(const SizedBox());
    }
  });
  testWidgets('menu has three themes without lock, logout or Google linking', (
    tester,
  ) async {
    // Co-located test: this API is explicitly intended for test setup.
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    final harness = NavigationHarness(hasFactors: false);
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    for (final label in ['System', 'Light', 'Dark']) {
      expect(find.byTooltip(label), findsOneWidget);
    }
    expect(find.text('Lock'), findsNothing);
    expect(find.text('Logout'), findsNothing);
    for (final entry in const [
      ('Dark', ThemeMode.dark),
      ('Light', ThemeMode.light),
      ('System', ThemeMode.system),
    ]) {
      await tester.tap(find.byTooltip(entry.$1));
      await tester.pumpAndSettle();
      expect(harness.container.read(appearanceProvider), entry.$2);
      expect(
        (await SharedPreferences.getInstance()).getString('appearance'),
        entry.$2.name,
      );
    }
    harness.router.go('/settings');
    await tester.pumpAndSettle();
    expect(find.text('Link Google'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
}
