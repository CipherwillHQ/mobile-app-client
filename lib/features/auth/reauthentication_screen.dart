// Reauthenticates accounts without vault factors after background locking.
// Owns native password, Google and Apple return authentication.
// Does not create accounts or unlock factor-protected vaults.
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/privacy_guard.dart';
import '../../app/logout.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../security/return_authentication.dart';
import '../security/session_controller.dart';
import '../../shared/ui/vault_emblem.dart';

class ReauthenticationScreen extends ConsumerWidget {
  const ReauthenticationScreen({super.key});
  Future<void> authenticate(
    BuildContext context,
    WidgetRef ref,
    String provider,
  ) async {
    String? password;
    if (provider == 'password') {
      password = await prompt(context, 'Account password', secret: true);
      if (password == null) return;
    }
    if (!context.mounted) return;
    final firebase = ref.read(firebaseProvider);
    final user = firebase.currentUser!;
    final auth = ref.read(authProvider);
    final api = ref.read(apiProvider);
    final controller = ref.read(sessionProvider.notifier);
    final epoch = controller.generation;
    final privacy = ref.read(privacyProvider.notifier);
    final returnAuth = ref.read(returnAuthenticationProvider.notifier);
    await perform(context, () async {
      privacy.set(true);
      try {
        if (provider == 'password') {
          await user.reauthenticateWithCredential(
            EmailAuthProvider.credential(
              email: user.email!,
              password: password!,
            ),
          );
        } else if (provider == 'google.com') {
          await auth.google(reauthenticate: true);
        } else {
          await auth.apple(reauthenticate: true);
        }
        await user.getIdToken(true);
        await api.account();
        if (firebase.currentUser?.uid != user.uid ||
            controller.generation != epoch) {
          throw StateError('Account changed. Authenticate again.');
        }
        returnAuth.require(false);
      } finally {
        privacy.set(false);
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = ref
        .read(firebaseProvider)
        .currentUser!
        .providerData
        .map((p) => p.providerId)
        .toSet();
    return PageFrame(
      title: 'Unlock Cipherwill',
      children: [
        const VaultEmblem(),
        const SizedBox(height: 24),
        Text('Welcome back.', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 12),
        const Text('Authenticate your account to reopen your vault.'),
        const SizedBox(height: 24),
        if (providers.contains('password'))
          FilledButton(
            onPressed: () => authenticate(context, ref, 'password'),
            child: const Text('Use account password'),
          ),
        if (providers.contains('google.com'))
          FilledButton(
            onPressed: () => authenticate(context, ref, 'google.com'),
            child: const Text('Continue with Google'),
          ),
        if (Platform.isIOS && providers.contains('apple.com'))
          FilledButton(
            onPressed: () => authenticate(context, ref, 'apple.com'),
            child: const Text('Continue with Apple'),
          ),
        TextButton(
          onPressed: () => perform(context, () => logout(ref)),
          child: const Text('Sign out'),
        ),
      ],
    );
  }
}
