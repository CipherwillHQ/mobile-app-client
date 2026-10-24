// Maps the supported factor identifiers to native labels and icons.
// Owns presentation shared by unlocking and security settings.
// Does not derive keys or choose factor fallbacks.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';

String factorTitle(String type) => switch (type) {
  'master-password' => 'Master password',
  'metamask' => 'MetaMask',
  'passkey' => 'Passkey',
  _ => type,
};
IconData factorIcon(String type) => switch (type) {
  'master-password' => AppIcons.password,
  'metamask' => AppIcons.wallet,
  'passkey' => AppIcons.fingerprint,
  _ => AppIcons.key,
};
