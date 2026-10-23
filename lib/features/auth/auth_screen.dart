// Presents native account authentication in a branded photographic layout.
// Owns credential controllers, provider actions and reset requests.
// Does not unlock security factors or save account passwords.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/legal_links.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/motion.dart';
import 'auth_hero.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password reset request accepted. Check your email if your account is eligible.',
          ),
        ),
      );
    }
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      top: false,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              children: [
                const AuthHero(),
                Transform.translate(
                  offset: const Offset(0, -22),
                  child: Reveal(
                    order: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            signup ? 'Begin your legacy' : 'Welcome back',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            signup
                                ? 'Your future peace of mind starts here.'
                                : 'Your digital legacy, ready when you are.',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
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
                            google: () =>
                                submit(() => ref.read(authProvider).google()),
                            apple: () =>
                                submit(() => ref.read(authProvider).apple()),
                          ),
                          const SizedBox(height: 14),
                          TextButton(
                            onPressed: busy
                                ? null
                                : () => setState(() => signup = !signup),
                            child: Text(
                              signup
                                  ? 'Already have an account? Sign in'
                                  : 'New to Cipherwill? Create an account',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                  child: Column(
                    children: [
                      Text(
                        'By continuing, you agree to our terms and privacy policy.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const LegalLinks(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
