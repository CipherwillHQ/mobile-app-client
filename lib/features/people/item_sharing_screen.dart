// Controls beneficiary exclusions for a single vault item
// Owns explicit sharing changes and recipient rewrapping.
// Does not change executor release conditions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';

class ItemSharingScreen extends ConsumerWidget {
  final String id;
  const ItemSharingScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Beneficiary access',
    children: [
      RemotePanel(
        operation: 'GET_METAMODEL',
        variables: {'id': id},
        builder: (data) {
          final ignored =
              asJson(data['getMetamodel'])['ignored_beneficiaries'] as List? ??
              [];
          return RemotePanel(
            operation: 'GET_SMARTWILL_BENEFICIARY',
            builder: (result) => Column(
              children: [
                for (final beneficiary in jsonList(
                  result['getSmartWillBeneficiaries'],
                ))
                  RemotePanel(
                    operation: 'GET_PERSON',
                    variables: {'id': beneficiary['person_id']},
                    builder: (person) => SwitchListTile(
                      title: Text(label(asJson(person['getPerson']))),
                      subtitle: const Text(
                        'Receive this item after will release',
                      ),
                      value: !ignored.contains(beneficiary['id']),
                      onChanged: (enabled) => perform(context, () async {
                        await ref.read(apiProvider).run(
                          enabled
                              ? 'REMOVE_IGNORED_BENEFICIARY'
                              : 'ADD_IGNORED_BENEFICIARY',
                          {
                            'metamodel_id': id,
                            'beneficiary_id': beneficiary['id'],
                          },
                        );
                        if (enabled) {
                          await KeyMigration(
                            ref.read(apiProvider),
                            ref.read(sessionProvider.notifier).lease(),
                          ).beneficiary(beneficiary['id']);
                        }
                        ref.invalidate(remoteProvider);
                      }),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
