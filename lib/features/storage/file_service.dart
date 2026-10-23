// Coordinates native encrypted storage transfers.
// Owns the storage service facade used by screens and guidance.
// Does not implement encryption or persist a vault cache.
import 'dart:io';
import '../../core/api/api_client.dart';
import '../security/session_controller.dart';
import 'file_uploader.dart';
import 'file_downloader.dart';

class FileService {
  final ApiClient api;
  final VaultLease lease;
  const FileService(this.api, this.lease);
  Future<void> upload(
    File file,
    String name, {
    String? folder,
    required String id,
  }) => FileUploader(api, lease).upload(file, name, folder: folder, id: id);
  Future<File> download(String id, Directory temporary, {String? access}) =>
      FileDownloader(api, lease).download(id, temporary, access: access);
}
