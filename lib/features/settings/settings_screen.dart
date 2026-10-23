// Provides account and application settings navigation
// Owns appearance and authenticated session actions.
// Does not edit vault contents.

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../app/logout.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/legal_links.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import 'appearance.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Settings',
    children: [
      for (final entry in {
        'Profile': '/profile',
        'Planning and segments': '/preferences',
        'Phone and communication': '/phones',
        'Security factors': '/factors',
        'Subscription and invoices': '/billing',
        'Backups': '/backup',
        'Feedback': '/feedback',
        'Reset or delete account': '/account-actions',
      }.entries)
        Card(
          child: ListTile(
            title: Text(entry.key),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(entry.value),
          ),
        ),
      DropdownButtonFormField<ThemeMode>(
        initialValue: ref.watch(appearanceProvider),
        decoration: const InputDecoration(labelText: 'Appearance'),
        items: [
          for (final mode in ThemeMode.values)
            DropdownMenuItem(value: mode, child: Text(mode.name)),
        ],
        onChanged: (mode) {
          if (mode != null) ref.read(appearanceProvider.notifier).select(mode);
        },
      ),
      TextButton(
        onPressed: () => perform(
          context,
          () => ref.read(authProvider).google(link: true),
          success: 'Google account linked.',
        ),
        child: const Text('Link Google to this account'),
      ),
      if (Platform.isIOS)
        TextButton(
          onPressed: () => perform(
            context,
            () => ref.read(authProvider).apple(link: true),
            success: 'Apple account linked.',
          ),
          child: const Text('Link Apple to this account'),
        ),
      TextButton(
        onPressed: () => ref.read(sessionProvider.notifier).lock(),
        child: const Text('Lock vault'),
      ),
      TextButton(
        onPressed: () => perform(context, () => logout(ref)),
        child: const Text('Sign out'),
      ),
      const LegalLinks(),
    ],
  );
}
