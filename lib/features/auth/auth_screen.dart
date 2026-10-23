// Presents account authentication in the web mobile layout.
// Owns credential controllers, provider actions and reset requests.
// Does not unlock factors or save account passwords.
import 'package:flutter/material.dart';
import '../../shared/ui/app_notice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/legal_links.dart';
import '../../shared/ui/actions.dart';
import 'auth_layout.dart';
import 'auth_fields.dart';
import 'auth_providers.dart';

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

  void signIn() => submit(
    () => ref
        .read(authProvider)
        .email(email.text.trim(), password.text, signup: signup),
  );
  void reset() => submit(() async {
    await ref.read(apiProvider).run('REQUEST_PASSWORD_RESET', {
      'email': email.text.trim(),
    });
    if (mounted) {
      showNotice(
        context,
        'Password reset request accepted. Check your email if your account is eligible.',
      );
    }
  });
  @override
  Widget build(BuildContext context) => AuthLayout(
    children: [
      Builder(
        builder: (context) => Text(
          signup ? 'Create your account' : 'Welcome to Cipherwill',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      AuthFields(
        email: email,
        password: password,
        busy: busy,
        signup: signup,
        submit: signIn,
        reset: reset,
      ),
      AuthProviders(
        busy: busy,
        google: () => submit(() => ref.read(authProvider).google()),
        apple: () => submit(() => ref.read(authProvider).apple()),
      ),
      const SizedBox(height: 14),
      TextButton(
        onPressed: busy ? null : () => setState(() => signup = !signup),
        child: Text(
          signup ? 'Already have an account? Sign in' : 'Create an account',
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'By continuing, you agree to our terms and privacy policy.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: Color(0xff6d7475)),
      ),
      const LegalLinks(),
    ],
  );
}
