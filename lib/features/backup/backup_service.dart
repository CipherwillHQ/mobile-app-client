// Exports readable text assets and restores only missing pods
// Owns pagination, exclusion preservation and safe repeated restore.
// Does not export files or overwrite saved content.

import 'dart:convert';
import '../../core/api/api_client.dart';
import '../../core/api/api_failure.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/aes.dart';
import '../../core/crypto/ecies.dart';
import '../security/session_controller.dart';
import '../vault/upload_service.dart';
import 'backup_codec.dart';

class BackupService {
  final ApiClient api;
  final VaultLease lease;
  const BackupService(this.api, this.lease);
  Future<Json?> envelope(String id) async {
    final pod = (await api.run('GET_POD', {'ref_id': id}))['getPod'];
    lease.check();
    if (pod == null) return null;
    final key = (await api.run('GET_KEY_BY_REF_ID', {
      'ref_id': id,
      'publicKey': lease.key?.publicKey ?? 'null',
    }))['getKeyByRefId'];
    lease.check();
    if (key == null) {
      throw StateError(
        'A saved item is unreadable with this factor. Switch factors before continuing.',
      );
    }
    return asJson(
      jsonDecode(decryptText(pod['content'], ownerKey(key['key'], lease.key))),
    );
  }

  Future<List<Json>> export(void Function(String) progress) async {
    final result = <Json>[];
    String? cursor;
    while (true) {
      lease.check();
      final page = asJson(
        (await api.run('GET_METAMODELS', {'cursor': cursor}))['getMetamodels'],
      );
      lease.check();
      final models = jsonList(page['models']);
      for (final model in models) {
        if (model['type'] == 'FILE') continue;
        progress('Reading item ' + (result.length + 1).toString());
        Json? data;
        try {
          data = await envelope(model['id']);
        } on ApiFailure catch (error) {
          if (error.code != 'POD_NOT_FOUND') rethrow;
        }
        result.add({
          'id': model['id'],
          'type': model['type'],
          'metadata': model['metadata'],
          'ignored_beneficiaries': model['ignored_beneficiaries'] ?? [],
          'data': data ?? '',
        });
      }
      if (page['has_more'] != true) break;
      if (models.isEmpty) {
        throw StateError('Incomplete backup pagination. Retry.');
      }
      cursor = models.last['id'];
    }
    return result;
  }

  Future<(int, int)> restore(
    BackupPayload payload,
    void Function(String) progress,
  ) async {
    var restored = 0;
    var skipped = 0;
    for (final item in payload.items) {
      if (item['type'] == 'FILE') {
        skipped++;
        continue;
      }
      lease.check();
      progress('Restoring ' + item['id']);
      Json? model;
      try {
        model = asJson(
          (await api.run('GET_METAMODEL', {'id': item['id']}))['getMetamodel'],
        );
        lease.check();
      } on ApiFailure catch (error) {
        if (error.code != 'MODEL_NOT_FOUND') rethrow;
      }
      if (model != null) {
        Json? existing;
        try {
          existing = await envelope(item['id']);
        } on ApiFailure catch (error) {
          if (error.code != 'POD_NOT_FOUND') rethrow;
        }
        if (existing != null) {
          skipped++;
          continue;
        }
      }
      final ignored = <String>{
        ...((model?['ignored_beneficiaries'] as List?) ?? []).cast<String>(),
        ...((item['ignored_beneficiaries'] as List?) ?? []).cast<String>(),
      }.toList();
      await api.run('CREATE_METAMODEL', {
        'id': item['id'],
        'type': model?['type'] ?? item['type'],
        'metadata': model?['metadata'] ?? backupMetadata(item, payload.version),
        'ignored_beneficiaries': ignored,
        'restore': true,
      });
      lease.check();
      if (backupHasData(item)) {
        final data = backupEnvelope(item);
        await UploadService(api).text(
          item['id'],
          jsonEncode(data),
          data['version']?.toString() ?? '0.0.1',
          ignored,
          lease,
          requireMissing: true,
        );
      }
      restored++;
    }
    return (restored, skipped);
  }
}
