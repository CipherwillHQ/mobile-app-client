// Presents existing email notification preferences from the web client.
// Owns the mandatory-email explanation and promotional-email toggle.
// Does not introduce push notifications or change the account email.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/remote_panel.dart';

class EmailPreferences extends ConsumerWidget {
  const EmailPreferences({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => AsyncPanel(
    value: ref.watch(preferencesProvider),
    retry: () => ref.invalidate(preferencesProvider),
    builder: (preferences) => PanelSection(
      title: 'Email notifications',
      description: ref.watch(accountProvider).value?['email']?.toString(),
      children: [
        const SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Essential emails'),
          subtitle: Text(
            'Account, security and will notifications are always enabled.',
          ),
          value: true,
          onChanged: null,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Promotional emails'),
          subtitle: const Text('Product updates and offers from Cipherwill.'),
          value: preferences['promotional_emails'] != false,
          onChanged: (value) => perform(context, () async {
            await ref.read(apiProvider).run('UPDATE_PREFERENCES', {
              'key': 'promotional_emails',
              'value': value.toString(),
            });
            ref.invalidate(preferencesProvider);
            ref.invalidate(remoteProvider);
          }, success: 'Email preference saved.'),
        ),
      ],
    ),
  );
}
