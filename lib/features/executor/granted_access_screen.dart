// Lists released access to the owner's will and supports revocation.
// Owns beneficiary identity and explicit revoke actions.
// Does not change the server release schedule.
import '../../app/app_icons.dart';
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
import '../../shared/ui/navigation_row.dart';

class GrantedAccessScreen extends ConsumerWidget {
  const GrantedAccessScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Released access',
    children: [
      const GuidePanel(
        title: 'You remain in control',
        message: 'Revoke a released grant to stop future protected reads.',
        icon: AppIcons.security,
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
              icon: AppIcons.lock,
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
    final revoke = IconButton(
      tooltip: 'Revoke access',
      color: Theme.of(context).colorScheme.error,
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
      icon: const Icon(AppIcons.excluded),
    );
    if (personId == null) {
      return NavigationRow(
        title: 'Former beneficiary',
        detail: 'Expires ' + dateLabel(grant['expire_at']),
        trailing: revoke,
      );
    }
    return RemotePanel(
      operation: 'GET_PERSON',
      variables: {'id': personId},
      builder: (r) => NavigationRow(
        leading: PersonAvatar(personName(asJson(r['getPerson']))),
        title: personName(asJson(r['getPerson'])),
        detail: 'Expires ' + dateLabel(grant['expire_at']),
        trailing: revoke,
      ),
    );
  }
}
