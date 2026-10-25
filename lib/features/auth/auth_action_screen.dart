// Handles Firebase verification and reset links in the native app.
// Owns one-time action validation, feedback and return navigation.
// Does not unlock vault factors or load web application account data.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/actions.dart';
import '../../app/app_icons.dart';

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
        await auth.signOut();
      } else if (mode == 'verifyEmail' || mode == 'recoverEmail') {
        await auth.applyActionCode(code);
        await auth.currentUser?.reload();
        await auth.currentUser?.getIdToken(true);
      } else {
        throw StateError('This account action is unsupported.');
      }
      if (mounted) setState(() => completed = true);
    }, success: 'Account action completed.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Account action')),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Icon(AppIcons.security, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            completed ? 'All done.' : 'One more step.',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 12),
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
            onPressed: busy ? null : () => context.go('/app'),
            child: const Text('Continue to Cipherwill'),
          ),
        ],
      ),
    ),
  );
}
