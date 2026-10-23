// Defines the File storage form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const fileCategory = AssetCategory(
  'FILE',
  'File storage',
  'file',
  '0.0.1',
  'segment_storage',
  true,
  [],
);
