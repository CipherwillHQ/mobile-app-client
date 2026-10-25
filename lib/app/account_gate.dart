// Gates authenticated screens on account status, onboarding and factor unlocking
// Owns bootstrap and reactivation presentation.
// Does not persist decrypted vault contents.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api/json_values.dart';
import '../shared/ui/page_frame.dart';
import '../shared/ui/actions.dart';
import '../features/auth/auth_screen.dart';
import '../features/auth/onboarding_screen.dart';
import '../features/guidance/guidance_screen.dart';
import '../features/security/lock_screen.dart';
import '../features/security/session_controller.dart';
import 'providers.dart';
import 'logout.dart';

final onboardingProvider = FutureProvider<Json>(
  (ref) async => asJson(
    (await ref.watch(apiProvider).run('GET_MY_ONBOARDING'))['getMyOnboarding'],
  ),
);

class AccountGate extends ConsumerWidget {
  final Widget child;
  const AccountGate({super.key, required this.child});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);
    if (auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (auth.value == null) return const AuthScreen();
    final account = ref.watch(accountProvider);
    if (account.hasError) {
      return PageFrame(
        title: 'Account unavailable',
        children: [
          Text(account.error.toString()),
          FilledButton(
            onPressed: () => ref.invalidate(accountProvider),
            child: const Text('Retry'),
          ),
          TextButton(
            onPressed: () => perform(context, () async {
              await ref.read(apiProvider).run('REQUEST_ACCOUNT_REACTIVATION');
              ref.invalidate(accountProvider);
            }),
            child: const Text('Request reactivation'),
          ),
          TextButton(
            onPressed: () => perform(context, () => logout(ref)),
            child: const Text('Sign out'),
          ),
        ],
      );
    }
    if (account.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final onboarding = ref.watch(onboardingProvider);
    if (onboarding.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (onboarding.hasError) {
      return PageFrame(
        title: 'Unable to load setup',
        children: [
          TextButton(
            onPressed: () => ref.invalidate(onboardingProvider),
            child: const Text('Retry'),
          ),
        ],
      );
    }
    if (onboarding.value!['is_completed'] != true) {
      return OnboardingScreen(
        onboarding: onboarding.value!,
        completed: () => ref.invalidate(onboardingProvider),
      );
    }
    final factors = ref.watch(factorsProvider);
    final session = ref.watch(sessionProvider);
    if (factors.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (factors.hasError) {
      return PageFrame(
        title: 'Unable to load security factors',
        children: [
          TextButton(
            onPressed: () => ref.invalidate(factorsProvider),
            child: const Text('Retry'),
          ),
        ],
      );
    }
    if (factors.value!.isNotEmpty &&
        (session == null ||
            !factors.value!.any(
              (factor) => factor['publicKey'] == session.publicKey,
            ))) {
      return LockScreen(factors: factors.value!);
    }
    return account.value!['email_verified'] == true
        ? child
        : const GuidanceScreen();
  }
}
