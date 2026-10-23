// Matches the web segment groups and their enabled-category ordering.
// Owns shared filtering for the data hub and sidebar.
// Does not change stored preferences or enforce subscription authorization.
import '../../core/api/json_values.dart';
import 'asset_category.dart';
import 'categories.dart';

const categorySections = [
  ('Data', ['NOTE', 'EMAIL_ACCOUNT', 'DEVICE_LOCK', 'PASSWORD']),
  ('Web3 Finance', ['SEED_PHRASE', 'DEFI_STAKING']),
  ('Finance', ['BANK_ACCOUNT', 'PAYMENT_CARD']),
  ('Storage', ['FILE']),
];

List<AssetCategory> enabledCategories(
  Json preferences,
  List<String> types, {
  String query = '',
}) => [
  for (final type in types)
    for (final category in categories)
      if (category.type == type &&
          (category.preference == null ||
              preferences[category.preference] == true) &&
          category.title.toLowerCase().contains(query.trim().toLowerCase()))
        category,
];
