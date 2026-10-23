// Manages current factors, migrations and biometric protection.
// Owns security-factor actions and authentic save feedback.
// Does not change the legacy derivation protocol.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/empty_state.dart';
import 'session_controller.dart';
import 'factor_service.dart';
import 'factor_authenticator.dart';
import 'wallet_factor.dart';
import 'key_migration.dart';
import 'factor_card.dart';
import 'factor_visuals.dart';

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
      ref.invalidate(remoteProvider);
      setState(() => busy = false);
    }
  }

  Future<void> add(String type) async {
    final name = await prompt(
      context,
      'Factor name',
      initial: factorTitle(type),
    );
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
    subtitle: 'Your vault. Your keys.',
    children: [
      const GuidePanel(
        title: 'Keep a way back in',
        message:
            'Account sign-in and vault encryption are separate. Keep a security factor you can recover.',
        icon: Icons.shield_outlined,
      ),
      const SectionHeading('Your factors'),
      AsyncPanel(
        value: ref.watch(factorsProvider),
        retry: () => ref.invalidate(factorsProvider),
        builder: (factors) => Column(
          children: [
            if (factors.isEmpty)
              const EmptyState(
                title: 'Add your first security factor',
                message:
                    'Choose a master password, wallet or passkey for your vault.',
                icon: Icons.key_rounded,
              ),
            for (final factor in factors)
              RemotePanel(
                operation: 'GET_ALL_KEY_COUNT',
                builder: (r) => FactorCard(
                  factor: factor,
                  count:
                      jsonList(r['getAllKeyCount'])
                          .where(
                            (count) =>
                                count['publicKey'] == factor['publicKey'],
                          )
                          .firstOrNull?['count'] ??
                      0,
                  busy: busy,
                  rename: () => run(() async {
                    final name = await prompt(
                      context,
                      'Factor name',
                      initial: factor['name'],
                    );
                    if (name != null) {
                      await ref.read(apiProvider).run('UPDATE_FACTOR', {
                        'id': factor['id'],
                        'name': name,
                      });
                    }
                  }),
                  migrate: () => run(
                    () => KeyMigration(
                      ref.read(apiProvider),
                      ref.read(sessionProvider.notifier).lease(),
                    ).factor(factor['publicKey']),
                  ),
                  enable: () => run(
                    () => nativeHandoff(
                      ref,
                      () => ref
                          .read(sessionProvider.notifier)
                          .enableBiometrics(factor),
                    ),
                  ),
                  disable: () => run(
                    () => ref
                        .read(securityProvider)
                        .delete(
                          ref.read(sessionProvider.notifier).alias(factor),
                        ),
                  ),
                  remove: () => run(() async {
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
                          ref.read(sessionProvider.notifier).alias(factor),
                        );
                    ref.read(sessionProvider.notifier).lock();
                  }),
                ),
              ),
          ],
        ),
      ),
      const SectionHeading('Add a factor'),
      for (final type in ['master-password', 'metamask', 'passkey'])
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OutlinedButton.icon(
            onPressed: busy ? null : () => add(type),
            icon: Icon(factorIcon(type)),
            label: Text('Add ' + factorTitle(type)),
          ),
        ),
      TextButton(
        onPressed: () => ref.read(sessionProvider.notifier).lock(),
        child: const Text('Lock and switch factor'),
      ),
    ],
  );
}
