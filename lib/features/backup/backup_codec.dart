// Reads and writes the established Cipherwill ZIP backup format
// Owns legacy note adaptation and text-only archive records.
// Does not encrypt exported backups or restore records.

import 'dart:convert';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import '../../core/api/json_values.dart';
import '../vault/categories.dart';

class BackupPayload {
  final String version;
  final List<Json> items;
  const BackupPayload(this.version, this.items);
}

Uint8List encodeBackup(List<Json> items) {
  final content = utf8.encode(
    jsonEncode({
      'type': 'CIPHERWILL_BACKUP',
      'version': '0.0.2',
      'data': items.where((item) => item['type'] != 'FILE').toList(),
    }),
  );
  return Uint8List.fromList(
    ZipEncoder().encode(
      Archive()..addFile(ArchiveFile('backup.json', content.length, content)),
    ),
  );
}

BackupPayload decodeBackup(List<int> bytes) {
  final archive = ZipDecoder().decodeBytes(bytes, verify: true);
  final file = archive.findFile('backup.json');
  if (file == null || file.size > 128 * 1024 * 1024) {
    throw const FormatException('Invalid or oversized backup');
  }
  final payload = asJson(jsonDecode(utf8.decode(file.content as List<int>)));
  if (payload['type'] != 'CIPHERWILL_BACKUP' ||
      !['0.0.1', '0.0.2'].contains(payload['version']) ||
      payload['data'] is! List) {
    throw const FormatException('Unsupported Cipherwill backup');
  }
  final items = jsonList(payload['data']);
  for (final item in items) {
    if (item['id'] is! String || item['type'] is! String) {
      throw const FormatException('Invalid backup item');
    }
    if (item['type'] != 'FILE') categoryFor(item['type']);
    if (item['ignored_beneficiaries'] != null &&
        (item['ignored_beneficiaries'] is! List ||
            (item['ignored_beneficiaries'] as List).any(
              (id) => id is! String,
            ))) {
      throw const FormatException('Invalid beneficiary exclusions');
    }
  }
  return BackupPayload(payload['version'], items);
}

String backupMetadata(Json item, String version) => version == '0.0.1'
    ? jsonEncode({'title': item['title']})
    : (item['metadata'] as String? ?? jsonEncode({'title': item['title']}));
Json backupEnvelope(Json item) {
  final data = item['data'];
  if (item['type'] == 'NOTE' && (data is! Map || data['type'] == null)) {
    return {'type': 'note', 'data': data};
  }
  return asJson(data);
}

bool backupHasData(Json item) {
  final data = item['data'];
  return data != null && data != '' && !(data is Map && data['data'] == '');
}
