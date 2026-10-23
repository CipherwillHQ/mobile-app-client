// Verifies both directions against fixtures from actual web crypto libraries
// Owns ECIES, text and binary interoperability tests.
// Does not contact backend services.
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'aes.dart';
import 'bytes.dart';
import 'ecies.dart';
import 'factor_key.dart';
import 'fixture_factor.dart';

void main() {
  final f =
      jsonDecode(
            File('assets/contracts/crypto_vectors.json').readAsStringSync(),
          )
          as Map<String, dynamic>;
  test('current and legacy leading-zero ECIES envelopes decrypt', () {
    expect(unwrapKey(f['current'], f['privateKey']), f['podKey']);
    expect(unwrapKey(f['legacy'], f['privateKey']), f['podKey']);
    expect(
      wrapKey(
        f['podKey'],
        f['publicKey'],
        ephemeralPrivateKey: f['ephemeralPrivateKey'],
        iv: decode64(f['iv']),
      ),
      f['current'],
    );
  });
  test('every category preserves exact text bytes and CryptoJS envelopes', () {
    for (final value in f['texts']) {
      expect(decryptText(value['ciphertext'], f['podKey']), value['plaintext']);
      expect(
        encryptText(value['plaintext'], f['podKey'], salt: decode64(f['salt'])),
        value['ciphertext'],
      );
    }
  });
  test('binary encryption matches web CBC key character encoding', () {
    expect(
      base64Encode(encryptBinary(decode64(f['binaryPlaintext']), f['podKey'])),
      f['binary'],
    );
    expect(
      base64Encode(decryptBinary(decode64(f['binary']), f['podKey'])),
      f['binaryPlaintext'],
    );
  });
  test('tampering is rejected before decrypting wrapped keys', () {
    final data = jsonDecode(f['current']);
    data['mac'] = base64Encode(List.filled(32, 0));
    expect(
      () => unwrapKey(jsonEncode(data), f['privateKey']),
      throwsFormatException,
    );
  });
  test('layered beneficiary keys require the factor and capsule', () {
    final factor = FactorKey.fromPrivate(f['privateKey']);
    final e1 = wrapKey(f['podKey'], factor.publicKey, timeCapsule: true);
    final e0 = wrapKey(e1, factor.publicKey);
    expect(beneficiaryKey(e0, factor.privateKey, factor), f['podKey']);
    expect(() => beneficiaryKey(e0, factor.privateKey, null), throwsStateError);
  });
  test(
    'every legacy factor derives the web key and decrypts beneficiary layers',
    () {
      for (final value in f['factors']) {
        final key = fixtureFactor(Map<String, dynamic>.from(value));
        expect(key.privateKey, value['privateKey']);
        expect(key.publicKey, value['publicKey']);
        expect(unwrapKey(value['wrapped'], key.privateKey), f['podKey']);
        expect(
          beneficiaryKey(value['beneficiary'], f['capsulePrivate'], key),
          f['podKey'],
        );
      }
      expect(
        beneficiaryKey(
          f['beneficiaryWithoutFactor'],
          f['capsulePrivate'],
          null,
        ),
        f['podKey'],
      );
    },
  );
  test('mobile ciphertext is exported for all actual web decryptors', () {
    final factors = <Map<String, dynamic>>[];
    for (final value in f['factors']) {
      final key = fixtureFactor(Map<String, dynamic>.from(value));
      final capsule = FactorKey.fromPrivate(f['capsulePrivate']);
      final e1 = wrapKey(f['podKey'], capsule.publicKey, timeCapsule: true);
      factors.add({
        'type': value['type'],
        'nonce': value['nonce'],
        'input': value['input'],
        'privateKey': key.privateKey,
        'publicKey': key.publicKey,
        'wrapped': wrapKey(f['podKey'], key.publicKey),
        'beneficiary': wrapKey(e1, key.publicKey),
      });
    }
    Directory('build').createSync(recursive: true);
    File('build/mobile_crypto_vectors.json').writeAsStringSync(
      jsonEncode({
        'wrapped': wrapKey(f['podKey'], f['publicKey']),
        'texts': [
          for (final value in f['texts'])
            {
              'plaintext': value['plaintext'],
              'ciphertext': encryptText(value['plaintext'], f['podKey']),
            },
        ],
        'factors': factors,
        'binary': base64Encode(
          encryptBinary(decode64(f['binaryPlaintext']), f['podKey']),
        ),
        'binaryPlaintext': f['binaryPlaintext'],
      }),
    );
  });
}
