// Defines the Notes form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const noteCategory =
    AssetCategory('NOTE', 'Notes', 'note', '0.0.2', null, false, [
      AssetField(
        'content',
        'Note',
        required: false,
        sensitive: false,
        array: false,
        multiline: false,
        rich: true,
      ),
    ]);
