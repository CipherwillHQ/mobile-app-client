// Provides explicit account reset/deletion access.
// Owns destructive-action confirmation and local secret clearing.
// Does not delete accounts without a deliberate user action.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../app/logout.dart';
import '../security/session_controller.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/guide_panel.dart';
export 'feedback_screen.dart';

class AccountActionsScreen extends ConsumerWidget {
  const AccountActionsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Reset or delete account',
    children: [
      const GuidePanel(
        title: 'Keep what matters first',
        message:
            'These actions affect your account and data. Export a backup first if you need to keep your records.',
        icon: Icons.warning_amber_rounded,
      ),
      const SizedBox(height: 16),
      OutlinedButton.icon(
        onPressed: () => context.push('/backup'),
        icon: const Icon(Icons.backup_outlined),
        label: const Text('Open backups'),
      ),
      const SizedBox(height: 20),
      PanelSection(
        title: 'Reset your account',
        description: 'Request the reset process through your account email.',
        children: [
          OutlinedButton(
            onPressed: () => perform(context, () async {
              if (!await confirm(
                context,
                'Request an account reset? Check your email for the reset process.',
              )) {
                throw const ActionCancelled();
              }
              await ref.read(apiProvider).run('REQUEST_ACCOUNT_RESET');
              await ref.read(securityProvider).clear();
              ref.read(sessionProvider.notifier).lock();
            }, success: 'Reset requested. Check your email.'),
            child: const Text('Request account reset'),
          ),
        ],
      ),
      PanelSection(
        title: 'Delete vault data',
        description: 'Permanently remove the data in your vault.',
        children: [
          OutlinedButton(
            onPressed: () => perform(context, () async {
              if (!await confirm(
                context,
                'Permanently delete all your vault data?',
              )) {
                throw const ActionCancelled();
              }
              await ref.read(apiProvider).run('DELETE_DATA');
              await logout(ref);
            }),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete vault data'),
          ),
        ],
      ),
      PanelSection(
        title: 'Delete account',
        description: 'Permanently remove your Cipherwill account and its data.',
        children: [
          OutlinedButton(
            onPressed: () => perform(context, () async {
              if (!await confirm(
                context,
                'Permanently delete your Cipherwill account and data?',
              )) {
                throw const ActionCancelled();
              }
              await ref.read(apiProvider).run('DELETE_ACCOUNT');
              await logout(ref);
            }),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete account'),
          ),
        ],
      ),
    ],
  );
}
