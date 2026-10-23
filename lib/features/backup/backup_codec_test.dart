// Checks web-compatible backups and legacy record adapters.
// Owns ZIP version, exclusion and text-only behavior tests.
// Does not write restored records to a backend.
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'backup_codec.dart';

void main() {
  test('0.0.2 archives exclude files and preserve beneficiary exclusions', () {
    final backup = decodeBackup(
      encodeBackup([
        {
          'id': 'note_123',
          'type': 'NOTE',
          'metadata': '{"title":"Test"}',
          'ignored_beneficiaries': ['beneficiary_1'],
          'data': {
            'type': 'note',
            'version': '0.0.2',
            'data': {'content': '<p>Text</p>'},
          },
        },
        {'id': 'file_123', 'type': 'FILE'},
      ]),
    );
    expect(backup.version, '0.0.2');
    expect(backup.items.length, 1);
    expect(backup.items.single['ignored_beneficiaries'], ['beneficiary_1']);
  });
  test('0.0.1 raw notes become the established legacy note envelope', () {
    final data = utf8.encode(
      jsonEncode({
        'type': 'CIPHERWILL_BACKUP',
        'version': '0.0.1',
        'data': [
          {
            'id': 'legacy_123',
            'type': 'NOTE',
            'title': 'Legacy',
            'data': '<p>Legacy text</p>',
          },
        ],
      }),
    );
    final zip = ZipEncoder().encode(
      Archive()..addFile(ArchiveFile('backup.json', data.length, data)),
    );
    final backup = decodeBackup(zip);
    expect(backupEnvelope(backup.items.single), {
      'type': 'note',
      'data': '<p>Legacy text</p>',
    });
    expect(
      backupMetadata(backup.items.single, backup.version),
      '{"title":"Legacy"}',
    );
  });
  test('empty data does not create a saved pod', () {
    expect(backupHasData({'data': ''}), false);
    expect(
      backupHasData({
        'data': {'data': ''},
      }),
      false,
    );
  });
  test('archives missing backup.json are rejected', () {
    expect(
      () => decodeBackup(ZipEncoder().encode(Archive())),
      throwsFormatException,
    );
  });
}
