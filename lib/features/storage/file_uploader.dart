// Encrypts one selected file and commits its recipient keys.
// Owns stable upload identities and bounded temporary ciphertext.
// Does not preserve plaintext or report unconfirmed saves.
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/bytes.dart';
import '../../core/crypto/binary_stream.dart';
import '../security/session_controller.dart';
import '../vault/recipient_keys.dart';
import '../vault/upload_service.dart';
import 'file_metadata.dart';

class FileUploader {
  final ApiClient api;
  final VaultLease lease;
  const FileUploader(this.api, this.lease);
  Future<void> upload(
    File file,
    String name, {
    String? folder,
    required String id,
  }) async {
    lease.check();
    if (await UploadService(api).resume(id, lease)) return;
    final temp = await (await getTemporaryDirectory()).createTemp(
      'cipherwill_upload_',
    );
    try {
      final key = toHex(randomBytes(24));
      final ciphertext = File(temp.path + '/encrypted');
      final sink = ciphertext.openWrite();
      try {
        await sink.addStream(
          transformBinary(file.openRead(), key, true, lease.check),
        );
      } finally {
        await sink.close();
      }
      lease.check();
      final model = asJson(
        (await api.run('CREATE_METAMODEL', {
          'id': id,
          'type': 'FILE',
          'metadata': jsonEncode({
            'title': name,
            'type': fileMime(name),
            'file_ext': fileExtension(name),
          }),
          'folder_id': folder,
        }))['createMetamodel'],
      );
      lease.check();
      final factors = jsonList((await api.run('GET_FACTORS'))['getFactors']);
      lease.check();
      final beneficiaries = jsonList(
        (await api.run('GET_BENEFICIARY_FACTORS'))['getBeneficiaryFactors'],
      );
      lease.check();
      final keys = recipientKeys(
        model['id'],
        key,
        factors,
        beneficiaries,
        (model['ignored_beneficiaries'] as List? ?? []).cast<String>(),
      );
      final session = asJson(
        (await api.run('createUploadPodSession', {
          'ref_id': model['id'],
          'data_model_version': '0.0.1',
          'required_space': await ciphertext.length(),
        }))['createUploadPodSession'],
      );
      lease.check();
      final url = session['presigned_upload_url'] as String?;
      if (url == null) throw StateError('Storage upload URL unavailable.');
      await api.transfers.put<dynamic>(
        url,
        data: ciphertext.openRead(),
        options: Options(
          headers: {
            'Content-Type': 'data/encrypted',
            'Content-Length': await ciphertext.length(),
          },
        ),
      );
      lease.check();
      await UploadService(api).stageKeys(session['id'], keys, lease);
    } finally {
      await temp.delete(recursive: true);
    }
  }
}
