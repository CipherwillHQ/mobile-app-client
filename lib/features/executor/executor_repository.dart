// Reads released wills through freshly checked access permissions
// Owns executor item authorization and E0/E1 decryption.
// Does not edit donor records or bypass exclusions.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/aes.dart';
import '../../core/crypto/ecies.dart';
import '../security/session_controller.dart';
import '../vault/categories.dart';
import '../vault/pod_codec.dart';

class ExecutorRepository {
  final ApiClient api;
  final VaultLease lease;
  const ExecutorRepository(this.api, this.lease);
  Future<Json> access(String id) async {
    lease.check();
    final value = asJson(
      (await api.run('GET_ACCESS_DETAILS', {
        'access_id': id,
      }))['getAccessDetails'],
    );
    lease.check();
    if (int.parse(value['expire_at']) <=
        DateTime.now().millisecondsSinceEpoch) {
      throw StateError('This access has expired.');
    }
    return value;
  }

  Future<Json> authorizedModel(String accessId, String id) async {
    final grant = await access(accessId);
    final model = asJson(
      (await api.run('GET_GRANTED_METAMODEL', {
        'access_id': accessId,
        'model_id': id,
      }))['getGrantedMetamodel'],
    );
    lease.check();
    if ((model['ignored_beneficiaries'] as List? ?? []).contains(
      grant['beneficiary_id'],
    )) {
      throw StateError('This item is excluded from your access.');
    }
    return model;
  }

  Future<(Json, Json)> read(String accessId, String id) async {
    final model = await authorizedModel(accessId, id);
    final capsule =
        (await api.run('GET_BENEFICIARY_ENCRYPTION_KEY', {
              'access_id': accessId,
            }))['getBeneficiaryEncryptionKey']
            as String?;
    lease.check();
    if (capsule == null) {
      throw StateError('This will has not been released to you.');
    }
    final row = (await api.run('GET_KEY_BY_REF_ID', {
      'ref_id': id,
      'publicKey': lease.key?.publicKey ?? 'null',
    }))['getKeyByRefId'];
    lease.check();
    if (row == null) throw StateError('No key is available for this factor.');
    final pod = asJson((await api.run('GET_POD', {'ref_id': id}))['getPod']);
    lease.check();
    final key = beneficiaryKey(row['key'], capsule, lease.key);
    final content = parsePod(
      decryptText(pod['content'], key),
      categoryFor(model['type']),
    );
    await authorizedModel(accessId, id);
    lease.check();
    return (model, content);
  }
}
