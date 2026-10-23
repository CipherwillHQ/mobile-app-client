// Streams legacy CBC file encryption without loading whole files
// Owns bounded buffers and PKCS7 final blocks.
// Does not change the binary wire format.
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'bytes.dart';

Stream<List<int>> transformBinary(
  Stream<List<int>> input,
  String key,
  bool encrypt,
  void Function() check,
) async* {
  final cipher = CBCBlockCipher(AESEngine())
    ..init(
      encrypt,
      ParametersWithIV(
        KeyParameter(bytes(key.substring(16))),
        bytes(key.substring(0, 16)),
      ),
    );
  var pending = Uint8List(0);
  await for (final chunk in input) {
    check();
    pending = joinBytes([pending, chunk]);
    final blocks =
        ((pending.length - (encrypt ? 0 : 16)).clamp(0, pending.length) ~/ 16) *
        16;
    final output = Uint8List(blocks);
    for (var offset = 0; offset < blocks; offset += 16) {
      cipher.processBlock(pending, offset, output, offset);
    }
    pending = Uint8List.fromList(pending.sublist(blocks));
    if (output.isNotEmpty) yield output;
  }
  check();
  if (encrypt) {
    final count = 16 - pending.length;
    final padded = joinBytes([pending, List.filled(count, count)]);
    final output = Uint8List(16);
    cipher.processBlock(padded, 0, output, 0);
    yield output;
  } else {
    if (pending.length != 16) {
      throw const FormatException('Invalid encrypted file size');
    }
    final output = Uint8List(16);
    cipher.processBlock(pending, 0, output, 0);
    final count = PKCS7Padding().padCount(output);
    yield output.sublist(0, 16 - count);
  }
}
