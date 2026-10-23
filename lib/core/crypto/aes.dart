// Encrypts legacy AES CBC payloads and CryptoJS text envelopes
// Owns AES padding and OpenSSL passphrase derivation.
// Does not change the Cipherwill wire format.
import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'bytes.dart';

Uint8List aesCbc(bool encrypt, Uint8List input, Uint8List key, Uint8List iv) {
  if (encrypt && input.isEmpty) {
    final block = CBCBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(key), iv));
    final output = Uint8List(16);
    block.processBlock(Uint8List.fromList(List.filled(16, 16)), 0, output, 0);
    return output;
  }
  final cipher = PaddedBlockCipherImpl(
    PKCS7Padding(),
    CBCBlockCipher(AESEngine()),
  );
  cipher.init(
    encrypt,
    PaddedBlockCipherParameters(ParametersWithIV(KeyParameter(key), iv), null),
  );
  return cipher.process(input);
}

Uint8List deriveOpenSsl(String password, Uint8List salt) {
  var previous = Uint8List(0);
  var result = Uint8List(0);
  while (result.length < 48) {
    previous = MD5Digest().process(
      joinBytes([previous, bytes(password), salt]),
    );
    result = joinBytes([result, previous]);
  }
  return result.sublist(0, 48);
}

String encryptText(String plaintext, String password, {Uint8List? salt}) {
  final actualSalt = salt ?? randomBytes(8);
  final key = deriveOpenSsl(password, actualSalt);
  return base64Encode(
    joinBytes([
      bytes('Salted__'),
      actualSalt,
      aesCbc(true, bytes(plaintext), key.sublist(0, 32), key.sublist(32)),
    ]),
  );
}

String decryptText(String ciphertext, String password) {
  final envelope = decode64(ciphertext);
  if (envelope.length < 32 ||
      utf8.decode(envelope.sublist(0, 8), allowMalformed: true) != 'Salted__') {
    throw const FormatException('Invalid encrypted text');
  }
  final key = deriveOpenSsl(password, envelope.sublist(8, 16));
  return utf8.decode(
    aesCbc(false, envelope.sublist(16), key.sublist(0, 32), key.sublist(32)),
  );
}

Uint8List encryptBinary(Uint8List plaintext, String key) => aesCbc(
  true,
  plaintext,
  bytes(key.substring(16)),
  bytes(key.substring(0, 16)),
);
Uint8List decryptBinary(Uint8List ciphertext, String key) => aesCbc(
  false,
  ciphertext,
  bytes(key.substring(16)),
  bytes(key.substring(0, 16)),
);
