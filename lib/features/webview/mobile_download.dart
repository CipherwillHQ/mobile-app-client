// Streams a decrypted web file into a temporary native file for save or share.
// Owns ordered chunks, exact byte counts and cleanup after the user action.
// Does not decrypt vault data or retain exported files in the app.
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'webview_dialogs.dart';

class MobileDownload {
  final Directory? temporaryRoot;
  MobileDownload({this.temporaryRoot});
  Directory? directory;
  File? file;
  IOSink? sink;
  int expected = 0;
  int received = 0;
  String mime = 'application/octet-stream';

  Future<void> start(String name, int size, String type) async {
    if (file != null || size < 0) {
      throw StateError('A download is already active.');
    }
    final filename = name.replaceAll(RegExp(r'[\\/\x00-\x1f]'), '_').trim();
    if (filename.isEmpty || {'.', '..'}.contains(filename)) {
      throw FormatException('Invalid filename');
    }
    directory = await (temporaryRoot ?? await getTemporaryDirectory())
        .createTemp('cipherwill-download-');
    file = File('${directory!.path}/$filename');
    sink = file!.openWrite();
    expected = size;
    received = 0;
    mime = type;
  }

  Future<void> append(String chunk) async {
    if (sink == null || chunk.length > 65536) {
      throw StateError('Invalid download chunk.');
    }
    final bytes = base64Decode(chunk);
    if (received + bytes.length > expected) {
      throw StateError('Download size mismatch.');
    }
    sink!.add(bytes);
    await sink!.flush();
    received += bytes.length;
  }

  Future<bool> finish(BuildContext context) async {
    if (file == null || received != expected) {
      throw StateError('Incomplete download.');
    }
    await sink!.close();
    sink = null;
    if (!context.mounted) return false;
    final filename = file!.uri.pathSegments.last;
    final action = await chooseFileAction(context, filename);
    if (action == 'save') {
      return await FilePicker.saveFile(
            fileName: filename,
            mimeType: mime,
            bytes: await file!.readAsBytes(),
          ) !=
          null;
    }
    if (action == 'share' && context.mounted) {
      final box = context.findRenderObject() as RenderBox;
      final result = await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file!.path, mimeType: mime)],
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        ),
      );
      return result.status != ShareResultStatus.dismissed;
    }
    return false;
  }

  Future<void> dispose() async {
    await sink?.close();
    sink = null;
    file = null;
    final temporary = directory;
    directory = null;
    if (temporary != null && await temporary.exists()) {
      await temporary.delete(recursive: true);
    }
  }
}
