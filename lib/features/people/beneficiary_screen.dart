// Shows beneficiary details and account-specific access management
// Owns custom messages, counts and manual key synchronization.
// Does not release wills ahead of their server schedule.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';

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
            return const Text('This beneficiary is no longer available.');
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RemotePanel(
                operation: 'GET_PERSON',
                variables: {'id': beneficiary['person_id']},
                builder: (r) => ListTile(
                  title: Text(label(asJson(r['getPerson']))),
                  subtitle: Text(asJson(r['getPerson'])['email'] ?? ''),
                ),
              ),
              Text(
                beneficiary['custom_message']?.toString() ??
                    'No custom message',
              ),
              TextButton(
                onPressed: () => perform(context, () async {
                  final value = await prompt(
                    context,
                    'Message for beneficiary',
                    initial: beneficiary['custom_message'] ?? '',
                  );
                  if (value == null) return;
                  await ref.read(apiProvider).run(
                    'UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY',
                    {'beneficiary_id': id, 'custom_message': value},
                  );
                  ref.invalidate(remoteProvider);
                }),
                child: const Text('Edit message'),
              ),
              TextButton(
                onPressed: () => perform(context, () async {
                  if (!await confirm(context, 'Remove the custom message?')) {
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
              FilledButton(
                onPressed: () => perform(
                  context,
                  () => KeyMigration(
                    ref.read(apiProvider),
                    ref.read(sessionProvider.notifier).lease(),
                  ).beneficiary(id),
                  success: 'Beneficiary keys synchronized.',
                ),
                child: const Text('Synchronize keys'),
              ),
              const SizedBox(height: 20),
              RemotePanel(
                operation: 'GET_BENEFICIARY_SEGMENT_COUNTS',
                variables: {'beneficiary_id': id},
                builder: (r) => Column(
                  children: [
                    for (final count in jsonList(r['getMetamodelTypeCounts']))
                      ListTile(
                        title: Text(count['type']),
                        trailing: Text(count['count'].toString()),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}
