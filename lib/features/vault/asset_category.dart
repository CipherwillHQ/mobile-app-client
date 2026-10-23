// Defines vault category and field contracts
// Owns form metadata and payload versioning.
// Does not read mutable account state.
class AssetField {
  final String key;
  final String label;
  final bool required;
  final bool sensitive;
  final bool array;
  final bool multiline;
  final bool rich;
  final String? group;
  final String? inputType;
  const AssetField(
    this.key,
    this.label, {
    this.required = false,
    this.sensitive = false,
    this.array = false,
    this.multiline = false,
    this.rich = false,
    this.group,
    this.inputType,
  });
}

class AssetCategory {
  final String type;
  final String title;
  final String podType;
  final String version;
  final String? preference;
  final bool premium;
  final List<AssetField> fields;
  const AssetCategory(
    this.type,
    this.title,
    this.podType,
    this.version,
    this.preference,
    this.premium,
    this.fields,
  );
}
