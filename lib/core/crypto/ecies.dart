// Wraps and unwraps keys using the web client Torus ECIES format
// Owns secp256k1 ECDH and authenticated E0/E1 envelopes.
// Does not select recipients or release time capsule keys.
import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'aes.dart';
import 'bytes.dart';
import 'factor_key.dart';

Uint8List sharedSecret(
  String privateKey,
  String publicKey, {
  bool padded = true,
}) {
  final curve = ECDomainParameters('secp256k1');
  final point = curve.curve.decodePoint(fromHex(publicKey));
  if (point == null || point.isInfinity) {
    throw const FormatException('Invalid public key');
  }
  final product = point * BigInt.parse(privateKey, radix: 16);
  if (product == null || product.isInfinity) {
    throw const FormatException('Invalid shared key');
  }
  // Current Torus encryption pads to 32 bytes; older records used minimal bytes.
  final hex = product.x!.toBigInteger()!.toRadixString(16);
  return fromHex(padded ? hex.padLeft(64, '0') : hex);
}

Uint8List mac(Uint8List key, Uint8List data) {
  final hmac = HMac(SHA256Digest(), 64)..init(KeyParameter(key));
  return hmac.process(data);
}

String wrapKey(
  String plaintext,
  String publicKey, {
  bool timeCapsule = false,
  String? ephemeralPrivateKey,
  Uint8List? iv,
}) {
  final ephemeral = FactorKey.fromPrivate(
    ephemeralPrivateKey ?? toHex(randomBytes(32)),
  );
  final material = SHA512Digest().process(
    sharedSecret(ephemeral.privateKey, publicKey),
  );
  final actualIv = iv ?? randomBytes(16);
  final ciphertext = aesCbc(
    true,
    bytes(plaintext),
    material.sublist(0, 32),
    actualIv,
  );
  final publicBytes = fromHex(ephemeral.publicKey);
  return jsonEncode({
    'type': timeCapsule ? 'E1' : 'E0',
    'ciphertext': base64Encode(ciphertext),
    'ephemPublicKey': base64Encode(publicBytes),
    'iv': base64Encode(actualIv),
    'mac': base64Encode(
      mac(material.sublist(32), joinBytes([actualIv, publicBytes, ciphertext])),
    ),
  });
}

String unwrapKey(String envelope, String privateKey) {
  final data = jsonDecode(envelope) as Map<String, dynamic>;
  if (!['E0', 'E1'].contains(data['type'])) {
    throw const FormatException('Unknown key envelope');
  }
  final public = decode64(data['ephemPublicKey'] as String);
  final iv = decode64(data['iv'] as String);
  final ciphertext = decode64(data['ciphertext'] as String);
  var material = SHA512Digest().process(
    sharedSecret(privateKey, toHex(public), padded: false),
  );
  final message = joinBytes([iv, public, ciphertext]);
  final expected = decode64(data['mac'] as String);
  if (!constantTimeEqual(mac(material.sublist(32), message), expected)) {
    material = SHA512Digest().process(sharedSecret(privateKey, toHex(public)));
  }
  if (!constantTimeEqual(mac(material.sublist(32), message), expected)) {
    throw const FormatException('Encrypted key authentication failed');
  }
  return utf8.decode(aesCbc(false, ciphertext, material.sublist(0, 32), iv));
}

String ownerKey(String envelope, FactorKey? factor) {
  if (!envelope.startsWith('{')) return envelope;
  if (factor == null) throw StateError('Unlock your security factor first');
  return unwrapKey(envelope, factor.privateKey);
}

String beneficiaryKey(
  String envelope,
  String capsulePrivate,
  FactorKey? factor,
) {
  var value = envelope;
  final data = jsonDecode(value) as Map<String, dynamic>;
  if (data['type'] == 'E0') {
    if (factor == null) throw StateError('Unlock your security factor first');
    value = unwrapKey(value, factor.privateKey);
  }
  if ((jsonDecode(value) as Map<String, dynamic>)['type'] != 'E1') {
    throw const FormatException('Missing time capsule encryption');
  }
  return unwrapKey(value, capsulePrivate);
}
