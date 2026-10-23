// Finds a person first and then offers explicit invitation choices.
// Owns search, guest retry flow, relationship creation and key migration.
// Does not send emails before the user's Add person action.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/email_validation.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/app_notice.dart';
import '../../shared/ui/remote_panel.dart';
import 'person_search_form.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';
import 'person_invitation_form.dart';
import 'invitation_result.dart';

class PersonAddScreen extends ConsumerStatefulWidget {
  final bool friend;
  const PersonAddScreen({super.key, this.friend = false});
  @override
  ConsumerState<PersonAddScreen> createState() => _PersonAddScreenState();
}

class _PersonAddScreenState extends ConsumerState<PersonAddScreen> {
  final email = TextEditingController(), name = TextEditingController();
  List<Json>? matches;
  String? selectedEmail, addedId;
  bool sendEmail = true,
      anonymous = false,
      busy = false,
      attemptedEmail = false;
  @override
  void dispose() {
    email.dispose();
    name.dispose();
    super.dispose();
  }

  Future<void> add(String id) async {
    final api = ref.read(apiProvider);
    if (addedId != id) {
      await api.run(
        widget.friend ? 'ADD_SMARTWILL_FRIEND' : 'ADD_SMARTWILL_BENEFICIARY',
        {'id': id},
      );
      addedId = id;
    }
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
    if (mounted) {
      showNotice(
        context,
        widget.friend ? 'Friend added.' : 'Beneficiary added.',
      );
      context.pop();
    }
  }

  Future<void> run(Future<void> Function() action) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, action);
    if (mounted) setState(() => busy = false);
  }

  Future<void> search() => run(() async {
    if (!validEmail(email.text)) {
      throw StateError('Enter a valid email address.');
    }
    final query = email.text.trim();
    final result = await ref.read(apiProvider).run('SEARCH_PERSON', {
      'email': query,
    });
    if (mounted && email.text.trim() == query) {
      setState(() => matches = jsonList(result['searchPerson']));
    }
  });
  void chooseInvitation(String address, [String firstName = '']) {
    setState(() {
      selectedEmail = address;
      name.text = firstName;
      attemptedEmail = false;
      sendEmail = true;
      anonymous = false;
    });
  }

  Future<void> invite() => run(() async {
    if (name.text.trim().isEmpty) throw StateError('Enter their first name.');
    final person = asJson(
      (await ref.read(apiProvider).run('INVITE_USER', {
        'first_name': name.text.trim(),
        'email': selectedEmail!,
        'send_email': sendEmail,
        'anonymous_invite': sendEmail && anonymous,
      }))['inviteUser'],
    );
    if (sendEmail && mounted) setState(() => attemptedEmail = true);
    checkInvitation(person, sendEmail);
    await add(person['id']);
  });
  @override
  Widget build(BuildContext context) => PageFrame(
    title: widget.friend ? 'Add friend' : 'Add beneficiary',
    subtitle: 'Find them by email address.',
    children: [
      if (selectedEmail != null)
        PersonInvitationForm(
          email: selectedEmail!,
          name: name,
          busy: busy,
          sendEmail: sendEmail,
          anonymous: anonymous,
          attemptedEmail: attemptedEmail,
          emailChanged: (v) => setState(() {
            sendEmail = v;
            if (!v) anonymous = false;
          }),
          anonymousChanged: (v) => setState(() => anonymous = v),
          submit: invite,
          back: () => setState(() => selectedEmail = null),
        )
      else
        PersonSearchForm(
          email: email,
          matches: matches,
          busy: busy,
          search: search,
          changed: () => setState(() => matches = null),
          add: (id) => run(() => add(id)),
          invite: chooseInvitation,
        ),
    ],
  );
}
