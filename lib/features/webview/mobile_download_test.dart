// Verifies streamed native file bytes and temporary-file cleanup.
// Owns filename isolation, ordered chunks and incomplete-transfer checks.
// Does not open system file dialogs or contact the web client.
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'mobile_download.dart';

void main() {
  late Directory root;
  late MobileDownload download;
  setUp(() async {
    root = await Directory.systemTemp.createTemp('cipherwill-download-test-');
    download = MobileDownload(temporaryRoot: root);
  });
  tearDown(() async {
    await download.dispose();
    await root.delete(recursive: true);
  });
  test(
    'ordered chunks preserve binary bytes and cancellation removes plaintext',
    () async {
      final bytes = List<int>.generate(120000, (index) => index % 256);
      await download.start(
        'document.bin',
        bytes.length,
        'application/octet-stream',
      );
      for (var offset = 0; offset < bytes.length; offset += 40000) {
        await download.append(
          base64Encode(bytes.sublist(offset, offset + 40000)),
        );
      }
      final temporary = download.directory!;
      expect(await download.file!.readAsBytes(), bytes);
      await download.dispose();
      expect(await temporary.exists(), false);
    },
  );
  test('filename paths stay inside a dedicated temporary directory', () async {
    await download.start('../secret.txt', 0, 'text/plain');
    expect(download.file!.parent.path, download.directory!.path);
    expect(download.file!.uri.pathSegments.last, '.._secret.txt');
  });
  test('oversized and excess chunks never write unexpected bytes', () async {
    await download.start('file.bin', 3, 'application/octet-stream');
    await expectLater(
      download.append(base64Encode([1, 2, 3, 4])),
      throwsStateError,
    );
    await expectLater(download.append('A' * 65540), throwsStateError);
    expect(download.received, 0);
  });
  test(
    'a second active transfer is rejected without replacing the first file',
    () async {
      await download.start('first.txt', 0, 'text/plain');
      final file = download.file;
      await expectLater(
        download.start('second.txt', 0, 'text/plain'),
        throwsStateError,
      );
      expect(download.file, file);
    },
  );
}
