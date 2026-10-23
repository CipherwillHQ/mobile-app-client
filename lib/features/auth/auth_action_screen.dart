// Handles Firebase verification and reset links in the native app.
// Owns one-time action validation, feedback and return navigation.
// Does not unlock vault encryption factors.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../security/session_controller.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';

class AuthActionScreen extends ConsumerStatefulWidget {
  final Map<String, String> parameters;
  const AuthActionScreen({super.key, required this.parameters});
  @override
  ConsumerState<AuthActionScreen> createState() => _AuthActionScreenState();
}

class _AuthActionScreenState extends ConsumerState<AuthActionScreen> {
  bool busy = false;
  bool completed = false;

  Future<void> complete() async {
    if (busy || completed) return;
    setState(() => busy = true);
    await perform(context, () async {
      final code = widget.parameters['oobCode'];
      final mode = widget.parameters['mode'];
      if (code == null || code.isEmpty) {
        throw StateError('This link is missing its account action code.');
      }
      final auth = ref.read(firebaseProvider);
      if (mode == 'resetPassword') {
        await auth.verifyPasswordResetCode(code);
        if (!mounted) throw const ActionCancelled();
        final password = await prompt(
          context,
          'New account password',
          secret: true,
        );
        if (password == null) throw const ActionCancelled();
        await auth.confirmPasswordReset(code: code, newPassword: password);
        await ref.read(securityProvider).clear();
        ref.read(sessionProvider.notifier).lock();
        await auth.signOut();
      } else if (mode == 'verifyEmail' || mode == 'recoverEmail') {
        await auth.applyActionCode(code);
        await auth.currentUser?.reload();
        await auth.currentUser?.getIdToken(true);
        ref.invalidate(accountProvider);
      } else {
        throw StateError('This account action is unsupported.');
      }
      if (mounted) setState(() => completed = true);
    }, success: 'Account action completed.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Account action',
    children: [
      Text(
        completed
            ? 'Your account action is complete.'
            : 'Complete the account action from your email.',
      ),
      const SizedBox(height: 16),
      if (!completed)
        FilledButton(
          onPressed: busy ? null : complete,
          child: Text(busy ? 'Please wait…' : 'Complete account action'),
        ),
      TextButton(
        onPressed: busy ? null : () => context.go('/home'),
        child: const Text('Continue to Cipherwill'),
      ),
    ],
  );
}
