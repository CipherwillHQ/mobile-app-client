// Searches loaded plaintext item labels using the web's title behavior.
// Owns case-insensitive matching for paginated metadata lists.
// Does not decrypt or search encrypted asset values.
import 'dart:convert';
import '../../core/api/json_values.dart';

bool metadataMatches(Json item, String query) => label(
  asJson(jsonDecode(item['metadata'])),
).toLowerCase().contains(query.trim().toLowerCase());
