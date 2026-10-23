// Provides account and application settings navigation.
// Owns grouped destinations and authenticated session actions.
// Does not edit vault contents or change provider authentication.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../app/logout.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/legal_links.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../security/session_controller.dart';
import 'settings_profile.dart';
import 'settings_destination.dart';
import 'appearance_selector.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Settings',
    subtitle: 'Make Cipherwill yours.',
    children: [
      const SettingsProfile(),
      const SizedBox(height: 12),
      const PanelSection(
        title: 'Your account',
        children: [
          SettingsDestination(
            'Profile',
            'Personal and contact details',
            Icons.person_outline_rounded,
            '/profile',
          ),
          SettingsDestination(
            'Subscription & invoices',
            'Manage your existing plan',
            Icons.workspace_premium_outlined,
            '/billing',
          ),
          SettingsDestination(
            'Phone & communication',
            'Verification and channel preferences',
            Icons.notifications_none_rounded,
            '/phones',
          ),
        ],
      ),
      const PanelSection(
        title: 'Vault & planning',
        children: [
          SettingsDestination(
            'Security factors',
            'Keys, biometrics and vault access',
            Icons.shield_outlined,
            '/factors',
          ),
          SettingsDestination(
            'Planning & categories',
            'Check-ins, reminders and enabled categories',
            Icons.tune_rounded,
            '/preferences',
          ),
          SettingsDestination(
            'Backups',
            'Export or restore your text assets',
            Icons.backup_outlined,
            '/backup',
          ),
        ],
      ),
      const PanelSection(title: 'Appearance', children: [AppearanceSelector()]),
      PanelSection(
        title: 'Sign-in methods',
        description: 'Link a provider to use it with this existing account.',
        children: [
          OutlinedButton.icon(
            onPressed: () => perform(
              context,
              () => ref.read(authProvider).google(link: true),
              success: 'Google account linked.',
            ),
            icon: const Icon(Icons.link_rounded),
            label: const Text('Link Google'),
          ),
          if (Platform.isIOS) ...[
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () => perform(
                context,
                () => ref.read(authProvider).apple(link: true),
                success: 'Apple account linked.',
              ),
              icon: const Icon(Icons.apple),
              label: const Text('Link Apple'),
            ),
          ],
        ],
      ),
      const PanelSection(
        title: 'Support',
        children: [
          SettingsDestination(
            'Send feedback',
            'Help us improve Cipherwill',
            Icons.chat_bubble_outline_rounded,
            '/feedback',
          ),
        ],
      ),
      PanelSection(
        title: 'Session & account',
        children: [
          OutlinedButton.icon(
            onPressed: () => ref.read(sessionProvider.notifier).lock(),
            icon: const Icon(Icons.lock_outline_rounded),
            label: const Text('Lock vault'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => perform(context, () => logout(ref)),
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Sign out'),
          ),
          TextButton(
            onPressed: () => context.push('/account-actions'),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Reset or delete account'),
          ),
        ],
      ),
      const LegalLinks(),
    ],
  );
}
