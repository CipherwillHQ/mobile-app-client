// Removes abandoned app-created temporary plaintext files
// Owns cleanup restricted to Cipherwill temporary directories.
// Does not delete user exports or arbitrary system files.

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

Future<void> cleanupTemporaryFiles() async {
  final directory = await getTemporaryDirectory();
  await for (final entry in directory.list(followLinks: false)) {
    final name = entry.path.split(Platform.pathSeparator).last;
    if (entry is Directory &&
            [
              'cipherwill_backup_',
              'cipherwill_download_',
              'cipherwill_preview_',
              'cipherwill_upload_',
            ].any(name.startsWith) ||
        entry is Directory && name == 'share_plus') {
      await entry.delete(recursive: true);
    }
  }
  await cleanupPickedFiles();
}

Future<void> cleanupShareCopies() async {
  final root = await getTemporaryDirectory();
  final directory = Directory(root.path + '/share_plus');
  if (await directory.exists()) {
    await directory.delete(recursive: true);
  }
}

Future<void> cleanupPickedFiles() async {
  if (Platform.isAndroid || Platform.isIOS) {
    await FilePicker.platform.clearTemporaryFiles();
  }
}
