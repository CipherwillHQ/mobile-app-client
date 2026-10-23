// Downloads and decrypts a freshly authorized storage item.
// Owns signed URL renewal and executor permission rechecks.
// Does not retain a persistent vault cache.
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/ecies.dart';
import '../../core/crypto/binary_stream.dart';
import '../security/session_controller.dart';
import '../executor/executor_repository.dart';
import 'file_metadata.dart';

class FileDownloader {
  final ApiClient api;
  final VaultLease lease;
  const FileDownloader(this.api, this.lease);
  Future<File> download(
    String id,
    Directory temporary, {
    String? access,
  }) async {
    lease.check();
    final model = asJson(
      (await api.run(
        access == null ? 'GET_METAMODEL' : 'GET_GRANTED_METAMODEL',
        access == null ? {'id': id} : {'access_id': access, 'model_id': id},
      ))[access == null ? 'getMetamodel' : 'getGrantedMetamodel'],
    );
    lease.check();
    String? capsule;
    if (access != null) {
      final grant = await ExecutorRepository(api, lease).access(access);
      if ((model['ignored_beneficiaries'] as List? ?? []).contains(
        grant['beneficiary_id'],
      )) {
        throw StateError('This file is excluded from your access.');
      }
      capsule = (await api.run('GET_BENEFICIARY_ENCRYPTION_KEY', {
        'access_id': access,
      }))['getBeneficiaryEncryptionKey'];
      lease.check();
    }
    final row = (await api.run('GET_KEY_BY_REF_ID', {
      'ref_id': id,
      'publicKey': lease.key?.publicKey ?? 'null',
    }))['getKeyByRefId'];
    lease.check();
    if (row == null) throw StateError('No decryption key for this item.');
    final key = access == null
        ? ownerKey(row['key'], lease.key)
        : beneficiaryKey(row['key'], capsule!, lease.key);
    final encrypted = File(temporary.path + '/encrypted');
    for (var attempt = 0; attempt < 2; attempt++) {
      lease.check();
      final result = await api.run(
        access == null
            ? 'getPodDownloadUrl'
            : 'GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL',
        access == null ? {'ref_id': id} : {'access_id': access, 'ref_id': id},
      );
      lease.check();
      final url =
          result[access == null
                  ? 'getPodDownloadUrl'
                  : 'getGrantedStorageObjectDownloadUrl']
              as String;
      try {
        await api.transfers.download(url, encrypted.path);
        break;
      } on DioException catch (error) {
        if (attempt == 1 || ![401, 403].contains(error.response?.statusCode)) {
          rethrow;
        }
      }
    }
    lease.check();
    final metadata = asJson(jsonDecode(model['metadata']));
    final name = safeFileName(
      metadata['title']?.toString() ?? 'Cipherwill file',
    );
    final content = await Directory(temporary.path + '/content').create();
    if (access != null) {
      await ExecutorRepository(api, lease).authorizedModel(access, id);
    }
    final output = File(content.path + '/' + name);
    final sink = output.openWrite();
    try {
      await sink.addStream(
        transformBinary(encrypted.openRead(), key, false, lease.check),
      );
    } finally {
      await sink.close();
    }
    if (access != null) {
      await ExecutorRepository(api, lease).authorizedModel(access, id);
    }
    lease.check();
    return output;
  }
}
