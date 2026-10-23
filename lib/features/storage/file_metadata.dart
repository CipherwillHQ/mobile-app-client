// Maps file names to the existing web metadata contract
// Owns known MIME types and safe temporary display names.
// Does not infer file contents or change storage permissions.

String fileExtension(String name) =>
    name.contains('.') ? name.split('.').last.toLowerCase() : '';
String fileMime(String name) =>
    const {
      'txt': 'text/plain',
      'png': 'image/png',
      'jpg': 'image/jpg',
      'jpeg': 'image/jpeg',
      'gif': 'image/gif',
      'mp4': 'video/mp4',
      'pdf': 'application/pdf',
    }[fileExtension(name)] ??
    'unknown';
String safeFileName(String value) {
  final name = value.replaceAll(RegExp(r'[\\/:*?"<>|\x00-\x1f]'), '_').trim();
  return name.isEmpty || name == '.' || name == '..' ? 'Cipherwill file' : name;
}
