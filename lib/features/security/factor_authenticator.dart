// Authenticates existing factor types through native adapters
// Owns factor derivation and credential challenges.
// Does not sign in Firebase accounts or store passwords.
import 'dart:convert';
import '../../core/api/json_values.dart';
import '../../core/crypto/bytes.dart';
import '../../core/crypto/factor_key.dart';
import '../../core/security/device_security.dart';
import 'wallet_factor.dart';

class FactorAuthenticator {
  final DeviceSecurity security;
  final WalletFactor wallet;
  const FactorAuthenticator(this.security, this.wallet);
  Future<FactorKey> unlock(Json factor, {String? password}) async {
    final nonce = factor['nonce'] as String;
    switch (factor['type']) {
      case 'master-password':
        return FactorKey.master(password!, nonce);
      case 'metamask':
        return FactorKey.wallet(await wallet.sign(nonce), nonce);
      case 'passkey':
        final result = await security.passkey({
          'json': jsonEncode({
            'challenge': base64UrlEncode([1, 2, 3, 4, 5]),
            'rpId': 'cipherwill.com',
            'userVerification': 'required',
          }),
        });
        return FactorKey.passkey(nonce, decode64(result['rawId'] as String));
      default:
        throw StateError('Unsupported security factor. Choose another factor.');
    }
  }

  Future<(String, FactorKey)> createPasskey(Json account) async {
    final nonce = randomBytes(8);
    final response = await security.passkey({
      'json': jsonEncode({
        'challenge': base64UrlEncode(randomBytes(32)),
        'rp': {'id': 'cipherwill.com', 'name': 'Cipherwill'},
        'user': {
          'id': base64UrlEncode(joinBytes([nonce, bytes(account['id'])])),
          'name': account['email'],
          'displayName': account['first_name'] ?? account['email'],
        },
        'pubKeyCredParams': [
          {'type': 'public-key', 'alg': -7},
          {'type': 'public-key', 'alg': -257},
        ],
        'authenticatorSelection': {
          'residentKey': 'required',
          'requireResidentKey': true,
          'userVerification': 'required',
        },
      }),
    }, create: true);
    return (
      base64Encode(nonce),
      FactorKey.passkey(base64Encode(nonce), decode64(response['rawId'])),
    );
  }
}
