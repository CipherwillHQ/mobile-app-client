// Manages current factor names, migrations and biometric protection
// Owns security-factor actions.
// Does not change the legacy derivation protocol.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/async_panel.dart';
import 'session_controller.dart';
import 'factor_service.dart';
import 'factor_authenticator.dart';
import 'wallet_factor.dart';
import 'key_migration.dart';

class FactorsScreen extends ConsumerStatefulWidget {
  const FactorsScreen({super.key});
  @override
  ConsumerState<FactorsScreen> createState() => _FactorsScreenState();
}

class _FactorsScreenState extends ConsumerState<FactorsScreen> {
  bool busy = false;
  FactorService service() => FactorService(
    ref.read(apiProvider),
    ref.read(sessionProvider.notifier).lease(),
    FactorAuthenticator(
      ref.read(securityProvider),
      WalletFactor(ref.read(configProvider).reownProjectId),
    ),
  );
  Future<void> run(Future<void> Function() action) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, action);
    if (mounted) {
      ref.invalidate(factorsProvider);
      setState(() => busy = false);
    }
  }

  Future<void> add(String type) async {
    final name = await prompt(context, 'Factor name', initial: type);
    if (name == null) return;
    String? password;
    if (type == 'master-password') {
      if (!mounted) return;
      password = await prompt(context, 'New master password', secret: true);
      if (password == null) return;
    }
    await run(
      () => nativeHandoff(
        ref,
        () => service().add(
          type,
          name,
          ref.read(accountProvider).value!,
          password: password,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Security factors',
    children: [
      const Text(
        'Account sign-in and vault encryption are separate. Keep a factor you can recover.',
      ),
      const SizedBox(height: 16),
      AsyncPanel(
        value: ref.watch(factorsProvider),
        retry: () => ref.invalidate(factorsProvider),
        builder: (factors) => Column(
          children: [
            for (final factor in factors)
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(factor['name']),
                      subtitle: Text(factor['type']),
                    ),
                    Wrap(
                      children: [
                        TextButton(
                          onPressed: busy
                              ? null
                              : () => run(() async {
                                  final name = await prompt(
                                    context,
                                    'Factor name',
                                    initial: factor['name'],
                                  );
                                  if (name != null) {
                                    await ref.read(apiProvider).run(
                                      'UPDATE_FACTOR',
                                      {'id': factor['id'], 'name': name},
                                    );
                                  }
                                }),
                          child: const Text('Rename'),
                        ),
                        TextButton(
                          onPressed: busy
                              ? null
                              : () => run(
                                  () => KeyMigration(
                                    ref.read(apiProvider),
                                    ref.read(sessionProvider.notifier).lease(),
                                  ).factor(factor['publicKey']),
                                ),
                          child: const Text('Migrate keys'),
                        ),
                        TextButton(
                          onPressed: busy
                              ? null
                              : () => run(
                                  () => nativeHandoff(
                                    ref,
                                    () => ref
                                        .read(sessionProvider.notifier)
                                        .enableBiometrics(factor),
                                  ),
                                ),
                          child: const Text('Enable biometrics'),
                        ),
                        TextButton(
                          onPressed: busy
                              ? null
                              : () => run(
                                  () => ref
                                      .read(securityProvider)
                                      .delete(
                                        ref
                                            .read(sessionProvider.notifier)
                                            .alias(factor),
                                      ),
                                ),
                          child: const Text('Disable biometrics'),
                        ),
                        TextButton(
                          onPressed: busy
                              ? null
                              : () => run(() async {
                                  if (!await confirm(
                                    context,
                                    'Remove this security factor?',
                                  )) {
                                    return;
                                  }
                                  await service().remove(factor);
                                  await ref
                                      .read(securityProvider)
                                      .delete(
                                        ref
                                            .read(sessionProvider.notifier)
                                            .alias(factor),
                                      );
                                  ref.read(sessionProvider.notifier).lock();
                                }),
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      for (final type in ['master-password', 'metamask', 'passkey'])
        OutlinedButton(
          onPressed: busy ? null : () => add(type),
          child: Text('Add ' + type),
        ),
      TextButton(
        onPressed: () => ref.read(sessionProvider.notifier).lock(),
        child: const Text('Lock and switch factor'),
      ),
    ],
  );
}
