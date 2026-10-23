// Serializes the existing category-specific plaintext label field.
// Owns title-versus-name metadata compatibility.
// Does not serialize encrypted asset fields.
import '../../core/api/json_values.dart';

String itemLabelKey(String type) =>
    type == 'NOTE' || type == 'FILE' ? 'title' : 'name';
Json itemMetadata(String type, String label) => {itemLabelKey(type): label};
