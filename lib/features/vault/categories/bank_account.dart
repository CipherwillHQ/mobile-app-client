// Defines the Bank accounts form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const bankAccountCategory = AssetCategory(
  'BANK_ACCOUNT',
  'Bank accounts',
  'bank_account',
  '0.0.1',
  'segment_bank_account',
  false,
  [
    AssetField(
      'account_number',
      'Account number',
      required: true,
      sensitive: false,
      array: false,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'bank_name',
      'Bank name',
      required: true,
      sensitive: false,
      array: false,
      multiline: false,
      rich: false,
    ),
  ],
);
