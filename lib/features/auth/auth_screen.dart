// Presents native account sign-in and sign-up
// Owns authentication forms and reset requests.
// Does not unlock security factors.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/legal_links.dart';
import '../../shared/ui/actions.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool busy = false;
  bool signup = false;
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> submit(Future<void> Function() action) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, action);
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Cipherwill',
    children: [
      const SizedBox(height: 32),
      Text(
        'Protect what matters.',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      const SizedBox(height: 12),
      const Text(
        'Keep your digital legacy organized, secure, and ready for the people you trust.',
      ),
      const SizedBox(height: 32),
      TextField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        decoration: const InputDecoration(labelText: 'Email'),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: password,
        obscureText: true,
        autofillHints: const [AutofillHints.password],
        decoration: const InputDecoration(labelText: 'Account password'),
      ),
      const SizedBox(height: 20),
      FilledButton(
        onPressed: busy
            ? null
            : () => submit(
                () => ref
                    .read(authProvider)
                    .email(email.text.trim(), password.text, signup: signup),
              ),
        child: Text(
          busy
              ? 'Please wait…'
              : signup
              ? 'Create account'
              : 'Sign in',
        ),
      ),
      TextButton(
        onPressed: busy ? null : () => setState(() => signup = !signup),
        child: Text(
          signup
              ? 'Already have an account? Sign in'
              : 'Create a Cipherwill account',
        ),
      ),
      TextButton(
        onPressed: busy
            ? null
            : () => submit(() async {
                await ref.read(apiProvider).run('REQUEST_PASSWORD_RESET', {
                  'email': email.text.trim(),
                });
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Password reset request accepted. Check your email if your account is eligible.',
                      ),
                    ),
                  );
                }
              }),
        child: const Text('Forgot account password?'),
      ),
      OutlinedButton(
        onPressed: busy
            ? null
            : () => submit(() => ref.read(authProvider).google()),
        child: const Text('Continue with Google'),
      ),
      if (Platform.isIOS)
        OutlinedButton(
          onPressed: busy
              ? null
              : () => submit(() => ref.read(authProvider).apple()),
          child: const Text('Continue with Apple'),
        ),
      const LegalLinks(),
    ],
  );
}
