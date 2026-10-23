// Presents a person's name and email in a private native card.
// Owns reusable identity presentation for people and released wills.
// Does not fetch identity data or expose encrypted vault contents.
import 'package:flutter/material.dart';
import '../../shared/person_name.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/person_avatar.dart';

class PersonIdentity extends StatelessWidget {
  final Json person;
  final String? caption;
  const PersonIdentity({super.key, required this.person, this.caption});
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonAvatar(personName(person), size: 58),
          const SizedBox(height: 16),
          Text(
            personName(person),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            person['email']?.toString() ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (caption != null) ...[
            const SizedBox(height: 12),
            Text(caption!, style: Theme.of(context).textTheme.bodySmall),
          ],
        ],
      ),
    ),
  );
}
