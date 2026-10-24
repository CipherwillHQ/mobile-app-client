// Presents person search results before optional guest invitation.
// Owns the email field, matching people and the explicit Add person choice.
// Does not search or create people without parent callbacks.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/person_name.dart';
import '../../shared/ui/person_avatar.dart';

class PersonSearchForm extends StatelessWidget {
  final TextEditingController email;
  final List<Json>? matches;
  final bool busy;
  final VoidCallback search, changed;
  final ValueChanged<String> add;
  final void Function(String, String) invite;
  const PersonSearchForm({
    super.key,
    required this.email,
    required this.matches,
    required this.busy,
    required this.search,
    required this.changed,
    required this.add,
    required this.invite,
  });
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        controller: email,
        enabled: !busy,
        keyboardType: TextInputType.emailAddress,
        onChanged: (_) => changed(),
        onSubmitted: (_) => search(),
        decoration: const InputDecoration(
          labelText: 'Search by email address',
          prefixIcon: Icon(AppIcons.search),
        ),
      ),
      const SizedBox(height: 16),
      FilledButton(
        onPressed: busy ? null : search,
        child: Text(busy ? 'Searching…' : 'Find person'),
      ),
      for (final person in matches ?? <Json>[]) ...[
        ListTile(
          leading: PersonAvatar(personName(person)),
          title: Text(personName(person)),
          subtitle: Text(person['email']),
          trailing: const Icon(AppIcons.addPerson),
          onTap: busy ? null : () => add(person['id']),
        ),
        if (person['__typename'] == 'Guest')
          TextButton(
            onPressed: busy
                ? null
                : () => invite(person['email'], person['first_name'] ?? ''),
            child: const Text('Send or retry invitation email'),
          ),
      ],
      if (matches != null && matches!.isEmpty) ...[
        const SizedBox(height: 20),
        const Text('No person found with this email address.'),
        TextButton.icon(
          onPressed: busy ? null : () => invite(email.text.trim(), ''),
          icon: const Icon(AppIcons.addPerson),
          label: const Text('Add person'),
        ),
      ],
    ],
  );
}
