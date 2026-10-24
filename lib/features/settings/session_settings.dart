// Keeps existing session and account controls in General Settings.
// Owns lock, logout and account-action navigation.
// Does not implement key deletion or bypass confirmation for account changes.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/logout.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/navigation_row.dart';
import '../security/session_controller.dart';
import '../../app/providers.dart';

class SessionSettings extends ConsumerWidget {
  const SessionSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PanelSection(
    title: 'Session & account',
    children: [
      if ((ref.watch(factorsProvider).value ?? []).isNotEmpty)
        NavigationRow(
          onTap: () => ref.read(sessionProvider.notifier).lock(),
          icon: AppIcons.lock,
          title: 'Lock vault',
        ),
      NavigationRow(
        onTap: () => perform(context, () => logout(ref)),
        icon: AppIcons.logout,
        title: 'Sign out',
      ),
      NavigationRow(
        onTap: () => context.push('/account-actions'),
        icon: AppIcons.desktop,
        title: 'Reset or delete account',
        detail: 'On desktop',
        trailing: const Icon(AppIcons.external, size: 20),
      ),
    ],
  );
}
