// Exercises real screen layouts at phone sizes in both themes.
// Owns overflow, large-text, reduced-motion and opt-in visual evidence.
// Does not authenticate real accounts or claim live-device parity.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_fixtures.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/auth/onboarding_screen.dart';
import '../../features/security/lock_screen.dart';
import '../../features/security/factors_screen.dart';
import '../../features/people/people_list_screen.dart';
import '../../features/people/beneficiary_screen.dart';
import '../../features/settings/profile_screen.dart';
import '../../features/settings/preferences_screen.dart';
import '../../features/settings/phone_screen.dart';
import '../../features/settings/account_actions_screen.dart';
import '../../features/billing/billing_screen.dart';
import '../../features/storage/storage_screen.dart';
import '../../features/backup/backup_screen.dart';
import '../../features/guidance/guidance_screen.dart';
import '../../features/timeline/timeline_screen.dart';
import '../../features/executor/executor_screen.dart';
import '../../features/executor/granted_categories_screen.dart';
import '../../features/vault/asset_list_screen.dart';
import '../../features/home/score_screen.dart';
import 'error_panel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadDesignFonts);
  final screens = <String, Widget?>{
    '/home': null,
    '/vault': null,
    '/people': null,
    '/settings': null,
    '/auth': const AuthScreen(),
    '/lock': const LockScreen(factors: [previewFactor]),
    '/factors': const FactorsScreen(),
    '/beneficiaries': const PeopleListScreen(),
    '/beneficiary': const BeneficiaryScreen(id: 'beneficiary'),
    '/profile': const ProfileScreen(),
    '/preferences': const PreferencesScreen(),
    '/communication': const PhoneScreen(),
    '/billing': const BillingScreen(),
    '/storage': const StorageScreen(),
    '/backup': const BackupScreen(),
    '/guidance': const GuidanceScreen(),
    '/timeline': const TimelineScreen(),
    '/executor': const ExecutorScreen(),
    '/released': const GrantedCategoriesScreen(id: 'grant'),
    '/notes': const AssetListScreen(type: 'NOTE'),
    '/passwords': const AssetListScreen(type: 'PASSWORD'),
    '/score': const ScoreScreen(),
    '/account': const AccountActionsScreen(),
    '/feedback': const FeedbackScreen(),
    '/onboarding': OnboardingScreen(
      onboarding: const {
        'heard_from_options_catalog': [
          {'id': 'friend', 'label': 'A friend'},
        ],
        'expectation_options_catalog': [
          {'id': 'legacy', 'label': 'Plan my digital legacy'},
        ],
      },
      completed: () {},
    ),
  };
  for (final brightness in Brightness.values) {
    testWidgets('all screens render on a phone in ${brightness.name}', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final entry in screens.entries) {
        await tester.pumpWidget(
          DesignHarness(
            key: ValueKey(entry.key),
            location: entry.key,
            screen: entry.value,
            brightness: brightness,
          ),
        );
        await tester.pumpAndSettle();
        await prepareDesignImages(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: entry.key);
        expect(find.byType(ErrorPanel), findsNothing, reason: entry.key);
        await captureDesign(
          tester,
          entry.key.substring(1) + '-' + brightness.name,
        );
        for (final scrollable in find.byType(Scrollable).evaluate().toList()) {
          final state =
              (scrollable as StatefulElement).state as ScrollableState;
          state.position.jumpTo(state.position.maxScrollExtent);
        }
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: entry.key + ' bottom');
        expect(
          find.byType(ErrorPanel),
          findsNothing,
          reason: entry.key + ' bottom',
        );
        await tester.pumpWidget(const SizedBox());
      }
    });
  }
  testWidgets('primary screens and auth fit narrow phones with large text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final entry in screens.entries) {
      await tester.pumpWidget(
        DesignHarness(
          key: ValueKey(entry.key),
          location: entry.key,
          screen: entry.value,
          textScale: 2,
          reducedMotion: true,
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: entry.key);
      await tester.pumpWidget(const SizedBox());
    }
  });
}
