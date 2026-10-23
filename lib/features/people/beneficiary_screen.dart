// Shows beneficiary details and account-specific access management.
// Owns custom messages, counts and manual key synchronization.
// Does not release wills ahead of their server schedule.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/icon_badge.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';
import '../vault/categories.dart';
import '../vault/category_visuals.dart';
import 'person_identity.dart';

class BeneficiaryScreen extends ConsumerWidget {
  final String id;
  const BeneficiaryScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Beneficiary',
    children: [
      RemotePanel(
        operation: 'GET_SMARTWILL_BENEFICIARY',
        builder: (result) {
          final beneficiary = jsonList(
            result['getSmartWillBeneficiaries'],
          ).where((b) => b['id'] == id).firstOrNull;
          if (beneficiary == null) {
            return const EmptyState(
              title: 'Beneficiary unavailable',
              message: 'This beneficiary is no longer on your will.',
              icon: Icons.person_off_outlined,
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RemotePanel(
                operation: 'GET_PERSON',
                variables: {'id': beneficiary['person_id']},
                builder: (r) => PersonIdentity(
                  person: asJson(r['getPerson']),
                  caption: 'Beneficiary of your digital will',
                ),
              ),
              PanelSection(
                title: 'A message from you',
                description: 'A personal note for when your will is released.',
                children: [
                  SelectableText(
                    beneficiary['custom_message']?.toString() ??
                        'No message added yet.',
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () => perform(context, () async {
                      final value = await prompt(
                        context,
                        'Message for beneficiary',
                        initial: beneficiary['custom_message'] ?? '',
                        multiline: true,
                      );
                      if (value == null) return;
                      await ref.read(apiProvider).run(
                        'UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY',
                        {'beneficiary_id': id, 'custom_message': value},
                      );
                      ref.invalidate(remoteProvider);
                    }),
                    icon: const Icon(Icons.edit_outlined),
                    label: const Text('Edit message'),
                  ),
                  if (beneficiary['custom_message'] != null)
                    TextButton(
                      onPressed: () => perform(context, () async {
                        if (!await confirm(
                          context,
                          'Remove the custom message?',
                        )) {
                          return;
                        }
                        await ref.read(apiProvider).run(
                          'UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY',
                          {'beneficiary_id': id, 'custom_message': null},
                        );
                        ref.invalidate(remoteProvider);
                      }),
                      child: const Text('Remove message'),
                    ),
                ],
              ),
              PanelSection(
                title: 'Prepared access',
                description:
                    'Items available to this beneficiary after will release.',
                children: [
                  RemotePanel(
                    operation: 'GET_BENEFICIARY_SEGMENT_COUNTS',
                    variables: {'beneficiary_id': id},
                    builder: (r) => Column(
                      children: [
                        for (final count in jsonList(
                          r['getMetamodelTypeCounts'],
                        ))
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: IconBadge(
                              visualFor(count['type']).icon,
                              color: visualFor(count['type']).color,
                              size: 36,
                            ),
                            title: Text(categoryFor(count['type']).title),
                            trailing: Text(count['count'].toString()),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => perform(
                      context,
                      () => KeyMigration(
                        ref.read(apiProvider),
                        ref.read(sessionProvider.notifier).lease(),
                      ).beneficiary(id),
                      success: 'Beneficiary keys synchronized.',
                    ),
                    icon: const Icon(Icons.sync_rounded),
                    label: const Text('Synchronize keys'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ],
  );
}
