// Retains a selected upload identity across in-memory retries.
// Owns the same item ID until the save is confirmed.
// Does not store file contents or survive account locking.
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'file_service.dart';

class PendingUpload {
  final File file;
  final String name;
  final String id;
  final String? folder;
  PendingUpload(this.file, this.name, {String? id, this.folder})
    : id = id ?? 'file_' + const Uuid().v4();
  Future<void> save(FileService service) =>
      service.upload(file, name, folder: folder, id: id);
}
