// Loads beneficiary and friend relationships
// Owns person details, add and remove actions.
// Does not decrypt asset contents.
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/empty_state.dart';

class PeopleListScreen extends ConsumerWidget {
  final bool friends;
  const PeopleListScreen({super.key, this.friends = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: friends ? 'Friends and family' : 'Beneficiaries',
    subtitle: friends
        ? 'The people who help us reach your loved ones.'
        : 'Choose who can receive your digital legacy.',
    actions: [
      IconButton(
        tooltip: 'Add person',
        icon: const Icon(Icons.person_add_outlined),
        onPressed: () => context.push('/people/add?friend=$friends'),
      ),
    ],
    children: [
      if (friends)
        const Text(
          'Friends do not receive your vault data. They help us contact beneficiaries.',
        ),
      RemotePanel(
        operation: friends
            ? 'GET_SMARTWILL_FRIENDS'
            : 'GET_SMARTWILL_BENEFICIARY',
        builder: (response) {
          final people = friends
              ? (response['getSmartWillFriends'] as List? ?? [])
                    .map((id) => <String, dynamic>{'id': id, 'person_id': id})
                    .toList()
              : jsonList(response['getSmartWillBeneficiaries']);
          if (people.isEmpty) {
            return EmptyState(
              title: friends
                  ? 'Your circle of trust'
                  : 'Plan for someone you love',
              message: friends
                  ? 'Friends help us contact beneficiaries when needed.'
                  : 'Add a beneficiary to prepare their access after your will is released.',
              icon: Icons.people_outline_rounded,
              action: 'Add person',
              onAction: () => context.push('/people/add?friend=$friends'),
            );
          }
          return Column(
            children: [
              for (final person in people)
                RemotePanel(
                  operation: 'GET_PERSON',
                  variables: {'id': person['person_id']},
                  builder: (result) => Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: PersonAvatar(
                        personName(asJson(result['getPerson'])),
                      ),
                      title: Text(personName(asJson(result['getPerson']))),
                      subtitle: Text(
                        asJson(result['getPerson'])['email']?.toString() ?? '',
                      ),
                      onTap: friends
                          ? null
                          : () =>
                                context.push('/beneficiaries/' + person['id']),
                      trailing: IconButton(
                        tooltip: 'Remove person',
                        icon: const Icon(Icons.person_remove_outlined),
                        onPressed: () => perform(context, () async {
                          if (!await confirm(context, 'Remove this person?')) {
                            return;
                          }
                          await ref.read(apiProvider).run(
                            friends
                                ? 'DELETE_SMARTWILL_FRIEND'
                                : 'DELETE_SMARTWILL_BENEFICIARY',
                            {'id': person['person_id']},
                          );
                          ref.invalidate(remoteProvider);
                        }),
                      ),
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
