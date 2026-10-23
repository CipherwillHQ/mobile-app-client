// Preserves legacy encrypted pod JSON versions
// Owns text payload parsing and note migration.
// Does not change category fields silently.
import 'dart:convert';
import '../../core/api/json_values.dart';
import 'asset_category.dart';

Json parsePod(String plaintext, AssetCategory category) {
  final pod = asJson(jsonDecode(plaintext));
  if (pod['type'] != null && pod['type'] != category.podType) {
    throw const FormatException('Unexpected vault data type');
  }
  final data = pod['data'];
  if (category.type == 'NOTE' && data is String) return {'content': data};
  if (data == null) return {};
  if (data is! Map) {
    throw const FormatException('Unsupported vault data version');
  }
  return asJson(data);
}

String encodePod(Json data, AssetCategory category) => jsonEncode({
  'type': category.podType,
  'version': category.version,
  'data': {
    for (final field in category.fields)
      if (data.containsKey(field.key)) field.key: data[field.key],
  },
});
