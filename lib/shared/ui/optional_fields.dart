// Calculates optional visibility and grouped addition/removal like the web hook.
// Owns field grouping and existing-data visibility for all asset categories.
// Does not mutate saved records or invent category fields.
import '../../features/vault/asset_category.dart';
import '../../core/api/json_values.dart';

bool fieldHasData(dynamic value) =>
    value is List ? value.isNotEmpty : value != null && value != '';
List<AssetField> fieldGroup(List<AssetField> fields, AssetField field) =>
    field.group == null
    ? [field]
    : fields.where((f) => f.group == field.group).toList();
bool fieldVisible(
  List<AssetField> fields,
  AssetField field,
  Json values,
  Set<String> added,
) =>
    field.required ||
    fieldGroup(
      fields,
      field,
    ).any((f) => added.contains(f.key) || fieldHasData(values[f.key]));
