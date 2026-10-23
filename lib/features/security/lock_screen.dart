// Offers existing security factors and optional biometric unlocking
// Owns unlock choices and user feedback.
// Does not change factor encryption formats.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/logout.dart';
import '../../app/privacy_guard.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import 'session_controller.dart';
import 'factor_authenticator.dart';
import 'wallet_factor.dart';
import '../../shared/ui/vault_emblem.dart';
import '../../shared/ui/icon_badge.dart';
import 'factor_visuals.dart';

class LockScreen extends ConsumerStatefulWidget {
  final List<Json> factors;
  const LockScreen({super.key, required this.factors});
  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen> {
  bool busy = false;
  Future<void> unlock(Json factor, {bool biometric = false}) async {
    if (busy) return;
    String? password;
    if (!biometric && factor['type'] == 'master-password') {
      password = await prompt(context, 'Master password', secret: true);
      if (password == null) return;
    }
    if (!mounted) return;
    setState(() => busy = true);
    await perform(context, () async {
      final controller = ref.read(sessionProvider.notifier);
      final uid = ref.read(firebaseProvider).currentUser!.uid;
      final epoch = controller.generation;
      ref.read(privacyProvider.notifier).set(true);
      try {
        if (biometric) {
          await controller.biometricUnlock(factor);
        } else {
          final auth = FactorAuthenticator(
            ref.read(securityProvider),
            WalletFactor(ref.read(configProvider).reownProjectId),
          );
          final key = await auth.unlock(factor, password: password);
          await controller.accept(factor, key, uid, epoch: epoch);
        }
      } finally {
        ref.read(privacyProvider.notifier).set(false);
      }
    });
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Unlock Cipherwill',
    children: [
      const VaultEmblem(),
      const SizedBox(height: 20),
      Text(
        'Your vault.\nYour keys.',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      const SizedBox(height: 12),
      const Text(
        'You’re signed in. Choose a security factor to open your private vault.',
      ),
      const SizedBox(height: 20),
      for (final factor in widget.factors)
        Card(
          child: Column(
            children: [
              ListTile(
                leading: IconBadge(factorIcon(factor['type'])),
                title: Text(factor['name']),
                subtitle: Text(factorTitle(factor['type'])),
                trailing: const Icon(Icons.arrow_forward_rounded, size: 20),
                onTap: busy ? null : () => unlock(factor),
              ),
              TextButton.icon(
                onPressed: busy ? null : () => unlock(factor, biometric: true),
                icon: const Icon(Icons.fingerprint),
                label: const Text('Unlock with biometrics'),
              ),
            ],
          ),
        ),
      if (busy) const Center(child: CircularProgressIndicator()),
      TextButton(
        onPressed: busy ? null : () => perform(context, () => logout(ref)),
        child: const Text('Sign out'),
      ),
    ],
  );
}
