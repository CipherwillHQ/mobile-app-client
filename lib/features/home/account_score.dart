// Parses the score components returned by the existing web API.
// Owns validation and summing; the server owns score awards.
// Does not convert the score to a percentage or duplicate score rules.
import 'dart:convert';

int accountScore(Object? encoded) {
  return accountScoreComponents(
    encoded,
  ).values.fold<num>(0, (a, b) => a + b).toInt();
}

Map<String, num> accountScoreComponents(Object? encoded) {
  if (encoded is! String) throw const FormatException('Score unavailable');
  final values = jsonDecode(encoded);
  if (values is! Map<String, dynamic>) {
    throw const FormatException('Score unavailable');
  }
  for (final value in values.values) {
    if (value is! num || !value.isFinite) {
      throw const FormatException('Invalid score');
    }
  }
  return values.map((key, value) => MapEntry(key, value as num));
}
