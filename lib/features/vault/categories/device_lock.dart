// Defines the Device locks form from the existing web contract
// Owns field names and serialization versions.
// Does not encrypt records or enforce server permissions.
import '../asset_category.dart';

const deviceLockCategory = AssetCategory(
  'DEVICE_LOCK',
  'Device locks',
  'device_lock',
  '0.0.1',
  'segment_device_locks',
  false,
  [
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
      'pin',
      'Pin',
      required: true,
      sensitive: true,
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
