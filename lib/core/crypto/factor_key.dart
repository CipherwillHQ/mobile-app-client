// Derives the existing Cipherwill factor key pairs
// Owns legacy master password, wallet and passkey derivation.
// Does not authenticate Firebase accounts or store secrets.
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'bytes.dart';

class FactorKey {
  final String publicKey;
  final String privateKey;
  const FactorKey(this.publicKey, this.privateKey);
  factory FactorKey.fromPrivate(String secret) {
    final curve = ECDomainParameters('secp256k1');
    final scalar = BigInt.parse(secret, radix: 16) % curve.n;
    if (scalar == BigInt.zero) {
      throw const FormatException('Invalid private key');
    }
    return FactorKey(
      toHex((curve.G * scalar)!.getEncoded(false)),
      scalar.toRadixString(16),
    );
  }
  factory FactorKey.master(String password, String nonce) =>
      FactorKey.fromPrivate(
        toHex(SHA256Digest().process(bytes('$password:$nonce'))),
      );
  factory FactorKey.wallet(String signature, String nonce) {
    if (signature.length < 8) {
      throw const FormatException('Invalid wallet signature');
    }
    return FactorKey.master(signature.substring(signature.length - 8), nonce);
  }
  factory FactorKey.passkey(String nonce, Uint8List credentialId) =>
      FactorKey.fromPrivate(
        toHex(
          SHA256Digest().process(joinBytes([decode64(nonce), credentialId])),
        ),
      );
}
