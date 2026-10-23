// Registers native routes for owner and executor workspaces
// Owns URL-to-screen mapping and mobile link entry points.
// Does not authorize protected server reads.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/home_screen.dart';
import '../features/vault/vault_screen.dart';
import '../features/vault/asset_list_screen.dart';
import '../features/vault/asset_edit_screen.dart';
import '../features/people/people_screen.dart';
import '../features/people/people_list_screen.dart';
import '../features/people/person_add_screen.dart';
import '../features/people/beneficiary_screen.dart';
import '../features/people/item_sharing_screen.dart';
import '../features/security/factors_screen.dart';
import '../features/storage/storage_screen.dart';
import '../features/storage/file_screen.dart';
import '../features/executor/executor_screen.dart';
import '../features/executor/granted_categories_screen.dart';
import '../features/executor/granted_items_screen.dart';
import '../features/executor/granted_item_screen.dart';
import '../features/executor/granted_access_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/settings/profile_screen.dart';
import '../features/settings/preferences_screen.dart';
import '../features/settings/phone_screen.dart';
import '../features/settings/account_actions_screen.dart';
import '../features/billing/billing_screen.dart';
import '../features/backup/backup_screen.dart';
import '../features/guidance/guidance_screen.dart';
import '../features/timeline/timeline_screen.dart';
import '../features/auth/auth_action_screen.dart';
import 'navigation_shell.dart';
import 'deep_links.dart';

GoRouter createRouter() => GoRouter(
  initialLocation: '/home',
  redirect: (_, state) => cipherwillLocation(state.uri),
  routes: [
    GoRoute(
      path: '/auth-action',
      builder: (_, state) => AuthActionScreen(
        key: ValueKey(state.uri.toString()),
        parameters: state.uri.queryParameters,
      ),
    ),
    ShellRoute(
      builder: (_, state, child) =>
          NavigationShell(location: state.uri.path, child: child),
      routes: [
        GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
        GoRoute(path: '/vault', builder: (_, _) => const VaultScreen()),
        GoRoute(path: '/people', builder: (_, _) => const PeopleScreen()),
        GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
      ],
    ),
    GoRoute(
      path: '/vault/:type',
      builder: (_, s) => s.pathParameters['type'] == 'FILE'
          ? const StorageScreen()
          : AssetListScreen(type: s.pathParameters['type']!),
    ),
    GoRoute(
      path: '/item/:id',
      builder: (_, s) => AssetEditScreen(
        id: s.pathParameters['id']!,
        type: s.uri.queryParameters['type'] ?? 'NOTE',
        newItem: s.uri.queryParameters['new'] == 'true',
      ),
    ),
    GoRoute(
      path: '/item/:id/sharing',
      builder: (_, s) => ItemSharingScreen(id: s.pathParameters['id']!),
    ),
    GoRoute(
      path: '/beneficiaries',
      builder: (_, _) => const PeopleListScreen(),
    ),
    GoRoute(
      path: '/friends',
      builder: (_, _) => const PeopleListScreen(friends: true),
    ),
    GoRoute(
      path: '/beneficiaries/:id',
      builder: (_, s) => BeneficiaryScreen(id: s.pathParameters['id']!),
    ),
    GoRoute(
      path: '/people/add',
      builder: (_, s) =>
          PersonAddScreen(friend: s.uri.queryParameters['friend'] == 'true'),
    ),
    GoRoute(path: '/factors', builder: (_, _) => const FactorsScreen()),
    GoRoute(
      path: '/storage',
      builder: (_, s) => StorageScreen(
        folder: s.uri.queryParameters['folder'],
        access: s.uri.queryParameters['access'],
      ),
    ),
    GoRoute(
      path: '/file/:id',
      builder: (_, s) => FileScreen(
        id: s.pathParameters['id']!,
        access: s.uri.queryParameters['access'],
      ),
    ),
    GoRoute(path: '/executor', builder: (_, _) => const ExecutorScreen()),
    GoRoute(
      path: '/executor/:id',
      builder: (_, s) => GrantedCategoriesScreen(id: s.pathParameters['id']!),
    ),
    GoRoute(
      path: '/executor/:id/category/:type',
      builder: (_, s) => GrantedItemsScreen(
        access: s.pathParameters['id']!,
        type: s.pathParameters['type']!,
      ),
    ),
    GoRoute(
      path: '/executor/:id/item/:item',
      builder: (_, s) => GrantedItemScreen(
        access: s.pathParameters['id']!,
        id: s.pathParameters['item']!,
      ),
    ),
    GoRoute(
      path: '/granted-access',
      builder: (_, _) => const GrantedAccessScreen(),
    ),
    GoRoute(path: '/profile', builder: (_, _) => const ProfileScreen()),
    GoRoute(path: '/preferences', builder: (_, _) => const PreferencesScreen()),
    GoRoute(path: '/phones', builder: (_, _) => const PhoneScreen()),
    GoRoute(
      path: '/account-actions',
      builder: (_, _) => const AccountActionsScreen(),
    ),
    GoRoute(path: '/feedback', builder: (_, _) => const FeedbackScreen()),
    GoRoute(path: '/billing', builder: (_, _) => const BillingScreen()),
    GoRoute(path: '/backup', builder: (_, _) => const BackupScreen()),
    GoRoute(path: '/guide', builder: (_, _) => const GuidanceScreen()),
    GoRoute(path: '/timeline', builder: (_, _) => const TimelineScreen()),
  ],
  errorBuilder: (_, _) => const Scaffold(
    body: SafeArea(
      child: Center(child: Text('This Cipherwill link is unavailable.')),
    ),
  ),
);
