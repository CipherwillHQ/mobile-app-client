// Provides feedback and explicit account reset/deletion access
// Owns destructive-action confirmation and local secret clearing.
// Does not delete accounts without a deliberate user action.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/logout.dart';
import '../security/session_controller.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';

class AccountActionsScreen extends ConsumerWidget {
  const AccountActionsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Reset or delete account',
    children: [
      const Text(
        'These actions affect your Cipherwill account and its data. Export a backup first if you need to keep your records.',
      ),
      TextButton(
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
      TextButton(
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
        child: const Text('Delete vault data'),
      ),
      TextButton(
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
        child: const Text('Delete account'),
      ),
    ],
  );
}

class FeedbackScreen extends ConsumerWidget {
  const FeedbackScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Feedback',
    children: [
      FilledButton(
        onPressed: () => perform(context, () async {
          final message = await prompt(context, 'Your feedback');
          if (message == null || message.trim().isEmpty) {
            throw const ActionCancelled();
          }
          await ref.read(apiProvider).run('sendFeedback', {
            'email': ref.read(firebaseProvider).currentUser?.email,
            'message': message,
          });
        }, success: 'Feedback sent.'),
        child: const Text('Send feedback'),
      ),
    ],
  );
}
