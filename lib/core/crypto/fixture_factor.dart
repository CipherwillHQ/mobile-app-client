// Derives synthetic factor vectors for cross-client protocol tests.
// Owns fixture selection for the three established factor types.
// Does not authenticate accounts or retain derived secrets.
import 'bytes.dart';
import 'factor_key.dart';

FactorKey fixtureFactor(Map<String, dynamic> value) => switch (value['type']) {
  'master-password' => FactorKey.master(value['input'], value['nonce']),
  'metamask' => FactorKey.wallet(value['input'], value['nonce']),
  'passkey' => FactorKey.passkey(value['nonce'], decode64(value['input'])),
  _ => throw StateError('Unknown factor fixture'),
};
