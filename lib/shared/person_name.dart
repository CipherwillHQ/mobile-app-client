// Formats account and person identities using available profile names.
// Owns readable name fallbacks shared by native people views.
// Does not infer account membership from an email.
import '../core/api/json_values.dart';

String personName(Json person) {
  final name = ['first_name', 'middle_name', 'last_name']
      .map((key) => person[key]?.toString().trim() ?? '')
      .where((part) => part.isNotEmpty)
      .join(' ');
  return name.isNotEmpty ? name : label(person);
}
