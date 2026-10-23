// Maps the supported factor identifiers to native labels and icons.
// Owns presentation shared by unlocking and security settings.
// Does not derive keys or choose factor fallbacks.
import 'package:flutter/material.dart';

String factorTitle(String type) => switch (type) {
  'master-password' => 'Master password',
  'metamask' => 'MetaMask',
  'passkey' => 'Passkey',
  _ => type,
};
IconData factorIcon(String type) => switch (type) {
  'master-password' => Icons.password_rounded,
  'metamask' => Icons.account_balance_wallet_outlined,
  'passkey' => Icons.fingerprint_rounded,
  _ => Icons.key_rounded,
};
