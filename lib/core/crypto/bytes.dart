// Converts protocol bytes and supplies secure randomness
// Owns encoding primitives.
// Does not read keys or network state.
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

Uint8List randomBytes(int count) => Uint8List.fromList(
  List.generate(count, (_) => Random.secure().nextInt(256)),
);
Uint8List fromHex(String value) {
  final padded = value.length.isOdd ? '0$value' : value;
  return Uint8List.fromList([
    for (var i = 0; i < padded.length; i += 2)
      int.parse(padded.substring(i, i + 2), radix: 16),
  ]);
}

String toHex(List<int> value) =>
    value.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
Uint8List bytes(String value) => Uint8List.fromList(utf8.encode(value));
Uint8List joinBytes(Iterable<List<int>> values) =>
    Uint8List.fromList(values.expand((v) => v).toList());
Uint8List decode64(String value) =>
    Uint8List.fromList(base64.decode(base64.normalize(value)));
bool constantTimeEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  var difference = 0;
  for (var i = 0; i < a.length; i++) {
    difference |= a[i] ^ b[i];
  }
  return difference == 0;
}
