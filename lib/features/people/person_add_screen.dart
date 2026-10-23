// Searches and invites people before adding a trusted relationship
// Owns invitation choices and beneficiary key synchronization.
// Does not send invitations without a user action.
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/remote_panel.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/person_avatar.dart';
import '../../shared/ui/guide_panel.dart';

class PersonAddScreen extends ConsumerStatefulWidget {
  final bool friend;
  const PersonAddScreen({super.key, this.friend = false});
  @override
  ConsumerState<PersonAddScreen> createState() => _PersonAddScreenState();
}

class _PersonAddScreenState extends ConsumerState<PersonAddScreen> {
  final email = TextEditingController();
  final name = TextEditingController();
  List<Json>? matches;
  bool sendEmail = true;
  bool anonymous = false;
  bool busy = false;
  @override
  void dispose() {
    email.dispose();
    name.dispose();
    super.dispose();
  }

  Future<void> add(String id) async {
    final api = ref.read(apiProvider);
    await api.run(
      widget.friend ? 'ADD_SMARTWILL_FRIEND' : 'ADD_SMARTWILL_BENEFICIARY',
      {'id': id},
    );
    ref.invalidate(remoteProvider);
    if (!widget.friend) {
      final beneficiaries = jsonList(
        (await api.run(
          'GET_SMARTWILL_BENEFICIARY',
        ))['getSmartWillBeneficiaries'],
      );
      final added = beneficiaries.firstWhere((b) => b['person_id'] == id);
      await KeyMigration(
        api,
        ref.read(sessionProvider.notifier).lease(),
      ).beneficiary(added['id']);
    }
    if (mounted) context.pop();
  }

  Future<void> run(Future<void> Function() action) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, action);
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: widget.friend ? 'Add friend' : 'Add beneficiary',
    subtitle: 'Start with their email address.',
    children: [
      GuidePanel(
        icon: Icons.person_add_outlined,
        title: 'Invite someone you trust',
        message: widget.friend
            ? 'Friends help us reach your beneficiaries.'
            : 'Your beneficiary can receive the items you allow after will release.',
      ),
      const SizedBox(height: 20),
      TextField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(labelText: 'Email address'),
      ),
      const SizedBox(height: 16),
      FilledButton(
        onPressed: busy
            ? null
            : () => run(() async {
                final result = await ref.read(apiProvider).run(
                  'SEARCH_PERSON',
                  {'email': email.text.trim()},
                );
                if (mounted) {
                  setState(() => matches = jsonList(result['searchPerson']));
                }
              }),
        child: Text(busy ? 'Please wait…' : 'Find person'),
      ),
      if (matches != null)
        for (final person in matches!)
          ListTile(
            leading: PersonAvatar(personName(person)),
            trailing: const Icon(Icons.person_add_outlined),
            title: Text(personName(person)),
            subtitle: Text(person['email']),
            onTap: busy ? null : () => run(() => add(person['id'])),
          ),
      if (matches != null && matches!.isEmpty) ...[
        const SizedBox(height: 20),
        const SectionHeading('Invite someone new'),
        TextField(
          controller: name,
          decoration: const InputDecoration(labelText: 'First name'),
        ),
        SwitchListTile(
          title: const Text('Send invitation email'),
          value: sendEmail,
          onChanged: busy ? null : (v) => setState(() => sendEmail = v),
        ),
        SwitchListTile(
          title: const Text('Anonymous invitation'),
          value: anonymous,
          onChanged: busy ? null : (v) => setState(() => anonymous = v),
        ),
        FilledButton(
          onPressed: busy
              ? null
              : () => run(() async {
                  final person = asJson(
                    (await ref.read(apiProvider).run('INVITE_USER', {
                      'first_name': name.text,
                      'email': email.text.trim(),
                      'send_email': sendEmail,
                      'anonymous_invite': anonymous,
                    }))['inviteUser'],
                  );
                  await add(person['id']);
                }),
          child: const Text('Invite and add'),
        ),
      ],
    ],
  );
}
