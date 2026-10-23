// Lists released access to the owner's will and supports revocation.
// Owns beneficiary identity and explicit revoke actions.
// Does not change the server release schedule.
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/person_avatar.dart';

class GrantedAccessScreen extends ConsumerWidget {
  const GrantedAccessScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Released access',
    subtitle: 'Review who currently has access to your will.',
    children: [
      const GuidePanel(
        title: 'You remain in control',
        message: 'Revoke a released grant to stop future protected reads.',
        icon: Icons.shield_outlined,
      ),
      const SizedBox(height: 16),
      RemotePanel(
        operation: 'GET_ALL_GRANTED_BENEFICIARIES',
        builder: (r) {
          final grants = jsonList(r['getAllGrantedBeneficiaries']);
          if (grants.isEmpty) {
            return const EmptyState(
              title: 'No released access',
              message: 'Your active beneficiary grants will appear here.',
              icon: Icons.lock_outline_rounded,
            );
          }
          return RemotePanel(
            operation: 'GET_SMARTWILL_BENEFICIARY',
            builder: (b) => Column(
              children: [
                for (final grant in grants)
                  ReleasedGrantCard(
                    grant: grant,
                    personId: jsonList(b['getSmartWillBeneficiaries'])
                        .where(
                          (person) => person['id'] == grant['beneficiary_id'],
                        )
                        .firstOrNull?['person_id'],
                  ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

class ReleasedGrantCard extends ConsumerWidget {
  final Json grant;
  final String? personId;
  const ReleasedGrantCard({super.key, required this.grant, this.personId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revoke = OutlinedButton(
      onPressed: () => perform(context, () async {
        if (!await confirm(
          context,
          'Revoke this beneficiary’s released access?',
        )) {
          return;
        }
        await ref.read(apiProvider).run('REVOKE_ACCESS_TO_MY_WILL', {
          'id': grant['id'],
        });
        ref.invalidate(remoteProvider);
      }),
      child: const Text('Revoke access'),
    );
    if (personId == null) {
      return Card(
        child: ListTile(
          title: const Text('Former beneficiary'),
          subtitle: Text('Expires ' + dateLabel(grant['expire_at'])),
          trailing: revoke,
        ),
      );
    }
    return RemotePanel(
      operation: 'GET_PERSON',
      variables: {'id': personId},
      builder: (r) => Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: PersonAvatar(personName(asJson(r['getPerson']))),
                title: Text(personName(asJson(r['getPerson']))),
                subtitle: Text('Expires ' + dateLabel(grant['expire_at'])),
              ),
              const SizedBox(height: 12),
              revoke,
            ],
          ),
        ),
      ),
    );
  }
}
