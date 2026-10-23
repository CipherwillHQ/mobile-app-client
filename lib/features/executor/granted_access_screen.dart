// Lists released access to the owner will and supports revocation
// Owns grant details and explicit revoke actions.
// Does not change the server release schedule.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';

class GrantedAccessScreen extends ConsumerWidget {
  const GrantedAccessScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Released access',
    children: [
      RemotePanel(
        operation: 'GET_ALL_GRANTED_BENEFICIARIES',
        builder: (r) {
          final grants = jsonList(r['getAllGrantedBeneficiaries']);
          if (grants.isEmpty) {
            return const Text('No released access to your will.');
          }
          return Column(
            children: [
              for (final grant in grants)
                Card(
                  child: ListTile(
                    title: Text(grant['beneficiary_id']),
                    subtitle: Text(
                      'Expires ' +
                          DateTime.fromMillisecondsSinceEpoch(
                            int.parse(grant['expire_at']),
                          ).toString(),
                    ),
                    trailing: TextButton(
                      onPressed: () => perform(context, () async {
                        if (!await confirm(
                          context,
                          'Revoke this beneficiary’s released access?',
                        )) {
                          return;
                        }
                        await ref.read(apiProvider).run(
                          'REVOKE_ACCESS_TO_MY_WILL',
                          {'id': grant['id']},
                        );
                        ref.invalidate(remoteProvider);
                      }),
                      child: const Text('Revoke'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    ],
  );
}
