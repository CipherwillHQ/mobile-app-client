// Verifies streaming files against the established binary encryption format.
// Owns padding boundaries, irregular chunks and lock cancellation.
// Does not read user files or contact services.
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'aes.dart';
import 'binary_stream.dart';

Stream<List<int>> chunks(List<int> value) async* {
  var cursor = 0;
  var size = 1;
  while (cursor < value.length) {
    final end = (cursor + size).clamp(0, value.length);
    yield value.sublist(cursor, end);
    cursor = end;
    size = (size * 7) % 131 + 1;
  }
}

Future<Uint8List> collect(Stream<List<int>> value) async =>
    Uint8List.fromList(await value.expand((chunk) => chunk).toList());
void main() {
  const key = '0123456789abcdef0123456789abcdef0123456789abcdef';
  for (final length in [0, 1, 15, 16, 17, 31, 32, 4097, 100000]) {
    test('streamed length ' + length.toString() + ' matches web CBC', () async {
      final bytes = Uint8List.fromList(List.generate(length, (i) => i % 256));
      final encrypted = await collect(
        transformBinary(chunks(bytes), key, true, () {}),
      );
      expect(encrypted, encryptBinary(bytes, key));
      expect(
        await collect(transformBinary(chunks(encrypted), key, false, () {})),
        bytes,
      );
    });
  }
  test('locking cancels a streaming transform', () async {
    expect(
      collect(
        transformBinary(
          chunks([1, 2, 3]),
          key,
          true,
          () => throw StateError('locked'),
        ),
      ),
      throwsStateError,
    );
  });
}
