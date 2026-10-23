// Offers email delivery and anonymity choices after person search.
// Owns validated first-name input and optional invitation controls.
// Does not search people or send invitation requests itself.
import 'package:flutter/material.dart';

class PersonInvitationForm extends StatelessWidget {
  final String email;
  final TextEditingController name;
  final bool busy, sendEmail, anonymous, attemptedEmail;
  final ValueChanged<bool> emailChanged, anonymousChanged;
  final VoidCallback submit, back;
  const PersonInvitationForm({
    super.key,
    required this.email,
    required this.name,
    required this.busy,
    required this.sendEmail,
    required this.anonymous,
    required this.attemptedEmail,
    required this.emailChanged,
    required this.anonymousChanged,
    required this.submit,
    required this.back,
  });
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(email, style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(height: 16),
      TextField(
        controller: name,
        enabled: !busy && !attemptedEmail,
        decoration: const InputDecoration(labelText: 'First name'),
      ),
      SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Send invitation email'),
        value: sendEmail,
        onChanged: busy ? null : emailChanged,
      ),
      SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: const Text('Send email anonymously'),
        subtitle: const Text("They won't know who sent the invitation."),
        value: anonymous,
        onChanged: busy || !sendEmail || attemptedEmail
            ? null
            : anonymousChanged,
      ),
      FilledButton(
        onPressed: busy ? null : submit,
        child: Text(busy ? 'Please wait…' : 'Add person'),
      ),
      TextButton(
        onPressed: busy ? null : back,
        child: const Text('Back to search'),
      ),
    ],
  );
}
