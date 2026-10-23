// Keeps existing session and account controls in General Settings.
// Owns lock, logout and account-action navigation.
// Does not implement key deletion or bypass confirmation for account changes.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/logout.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../security/session_controller.dart';

class SessionSettings extends ConsumerWidget {
  const SessionSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PanelSection(
    title: 'Session & account',
    children: [
      OutlinedButton.icon(
        onPressed: () => ref.read(sessionProvider.notifier).lock(),
        icon: const Icon(Icons.lock_outline),
        label: const Text('Lock vault'),
      ),
      const SizedBox(height: 10),
      OutlinedButton.icon(
        onPressed: () => perform(context, () => logout(ref)),
        icon: const Icon(Icons.logout_outlined),
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
  );
}
