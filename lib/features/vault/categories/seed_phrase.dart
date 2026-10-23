// Defines the Seed phrases form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const seedPhraseCategory = AssetCategory(
  'SEED_PHRASE',
  'Seed phrases',
  'seed_phrase',
  '0.0.1',
  'segment_seed_phrases',
  true,
  [
    AssetField(
      'phrase',
      'Seed Phrase',
      required: true,
      sensitive: true,
      array: true,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'public_key',
      'Public Key',
      required: false,
      sensitive: false,
      array: false,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'note',
      'Note',
      required: false,
      sensitive: false,
      array: false,
      multiline: true,
      rich: false,
    ),
  ],
);
