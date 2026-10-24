// Collects real mobile screens for synthetic design acceptance checks.
// Owns representative browsing, focused tasks and executor destinations.
// Does not replace production routing or supply decrypted account data.
import 'package:flutter/material.dart';
import '../features/auth/auth_screen.dart';
import '../features/auth/onboarding_screen.dart';
import '../features/security/lock_screen.dart';
import '../features/security/factors_screen.dart';
import '../features/people/people_list_screen.dart';
import '../features/people/beneficiary_screen.dart';
import '../features/people/person_add_screen.dart';
import '../features/settings/profile_screen.dart';
import '../features/settings/usage_screen.dart';
import '../features/settings/preferences_screen.dart';
import '../features/settings/phone_screen.dart';
import '../features/settings/account_actions_screen.dart'
    show AccountActionsScreen;
import '../features/settings/feedback_screen.dart';
import '../features/billing/billing_screen.dart';
import '../features/storage/storage_screen.dart';
import '../features/backup/backup_screen.dart';
import '../features/guidance/guidance_screen.dart';
import '../features/timeline/timeline_screen.dart';
import '../features/executor/executor_screen.dart';
import '../features/executor/granted_categories_screen.dart';
import '../features/executor/granted_items_screen.dart';
import '../features/executor/granted_access_screen.dart';
import '../features/vault/asset_list_screen.dart';
import '../features/vault/asset_edit_screen.dart';
import '../features/home/score_screen.dart';
import 'design_fixtures.dart';

final designScreens = <String, Widget?>{
  '/home': null,
  '/vault': null,
  '/people': null,
  '/settings': null,
  '/platform': null,
  '/auth': const AuthScreen(),
  '/lock': const LockScreen(factors: [previewFactor]),
  '/factors': const FactorsScreen(),
  '/beneficiaries': const PeopleListScreen(),
  '/friends': const PeopleListScreen(friends: true),
  '/beneficiaries/add': const PersonAddScreen(),
  '/friends/add': const PersonAddScreen(friend: true),
  '/beneficiaries/beneficiary': const BeneficiaryScreen(id: 'beneficiary'),
  '/profile': const ProfileScreen(),
  '/usage': const UsageScreen(),
  '/preferences': const PreferencesScreen(),
  '/phones': const PhoneScreen(),
  '/billing': const BillingScreen(),
  '/storage': const StorageScreen(),
  '/backup': const BackupScreen(),
  '/guide': const GuidanceScreen(),
  '/timeline': const TimelineScreen(),
  '/executor': const ExecutorScreen(),
  '/executor/grant': const GrantedCategoriesScreen(id: 'grant'),
  '/executor/grant/NOTE': const GrantedItemsScreen(
    access: 'grant',
    type: 'NOTE',
  ),
  '/granted-access': const GrantedAccessScreen(),
  '/vault/NOTE': const AssetListScreen(type: 'NOTE'),
  '/vault/PASSWORD': const AssetListScreen(type: 'PASSWORD'),
  '/vault/NOTE/new-note': const AssetEditScreen(
    id: 'new-note',
    type: 'NOTE',
    newItem: true,
  ),
  '/vault/PASSWORD/new-password': const AssetEditScreen(
    id: 'new-password',
    type: 'PASSWORD',
    newItem: true,
  ),
  '/score': const ScoreScreen(),
  '/account-actions': const AccountActionsScreen(),
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
