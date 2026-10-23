// Defines the Passwords form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const passwordCategory = AssetCategory(
  'PASSWORD',
  'Passwords',
  'password',
  '0.0.1',
  'segment_passwords',
  false,
  [
    AssetField(
      'username',
      'Username',
      required: true,
      sensitive: false,
      array: false,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'password',
      'Password',
      required: true,
      sensitive: true,
      array: false,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'totp_secret',
      '2FA Secret',
      required: false,
      sensitive: true,
      array: false,
      multiline: false,
      rich: false,
    ),
    AssetField(
      'uri',
      'Websites',
      required: false,
      sensitive: false,
      array: true,
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
