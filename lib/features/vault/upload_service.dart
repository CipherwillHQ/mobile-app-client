// Stages encrypted text and recipient keys before confirming persistence
// Owns upload session commits and bounded retries.
// Does not report incomplete uploads as saved.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/aes.dart';
import '../../core/crypto/bytes.dart';
import '../security/session_controller.dart';
import 'recipient_keys.dart';

class UploadService {
  final ApiClient api;
  const UploadService(this.api);
  Future<void> stageKeys(
    String session,
    List<Json> keys,
    VaultLease lease,
  ) async {
    for (final batch in keyBatches(keys)) {
      lease.check();
      await api.run('uploadSessionKeys', {
        'session_id': session,
        'keys': batch,
      });
      lease.check();
    }
    await commit(session, lease);
  }

  Future<void> commit(String session, VaultLease lease) async {
    for (var attempt = 0; attempt < 30; attempt++) {
      lease.check();
      final result = asJson(
        (await api.run('commitUploadSession', {
          'session_id': session,
        }))['commitUploadSession'],
      );
      lease.check();
      if (result['status'] == 'COMPLETED') return;
      if (result['status'] != 'KEYS_UPLOADED') {
        throw StateError('Upload is incomplete. Retry saving.');
      }
      await Future<void>.delayed(const Duration(milliseconds: 300));
    }
    throw StateError('Save confirmation is still pending. Retry to check it.');
  }

  Future<void> text(
    String refId,
    String plaintext,
    String version,
    List<String> ignored,
    VaultLease lease, {
    bool requireMissing = false,
  }) async {
    lease.check();
    final key = toHex(randomBytes(24));
    final encrypted = bytes(encryptText(plaintext, key));
    final factors = jsonList((await api.run('GET_FACTORS'))['getFactors']);
    lease.check();
    final beneficiaries = jsonList(
      (await api.run('GET_BENEFICIARY_FACTORS'))['getBeneficiaryFactors'],
    );
    lease.check();
    final keys = recipientKeys(refId, key, factors, beneficiaries, ignored);
    final session = asJson(
      (await api.run('createUploadPodSession', {
        'ref_id': refId,
        'data_model_version': version,
        'required_space': encrypted.length,
        'require_missing_pod': requireMissing,
      }))['createUploadPodSession'],
    );
    lease.check();
    await api.uploadText(session['id'], encrypted);
    lease.check();
    await stageKeys(session['id'], keys, lease);
  }

  Future<bool> resume(String refId, VaultLease lease) async {
    final result = (await api.run('GET_UPLOAD_POD_SESSION', {
      'ref_id': refId,
    }))['getUploadPodSession'];
    lease.check();
    if (result == null) return false;
    final session = asJson(result);
    if (session['status'] == 'COMPLETED') return true;
    if (session['status'] == 'KEYS_UPLOADED') {
      await commit(session['id'], lease);
      return true;
    }
    return false;
  }
}
