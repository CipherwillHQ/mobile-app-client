// Wraps one symmetric pod key for owners and allowed beneficiaries
// Owns E0/E1 recipient key construction and batching.
// Does not upload records or include excluded recipients.
import '../../core/api/json_values.dart';
import '../../core/crypto/ecies.dart';

List<Json> recipientKeys(
  String refId,
  String key,
  List<Json> factors,
  List<Json> beneficiaries,
  List<String> ignored,
) {
  final result = <Json>[];
  if (factors.isEmpty) {
    result.add({
      'ref_id': refId,
      'beneficiary_id': 'null',
      'publicKey': 'null',
      'key': key,
    });
  }
  for (final factor in factors) {
    result.add({
      'ref_id': refId,
      'beneficiary_id': 'null',
      'publicKey': factor['publicKey'],
      'key': wrapKey(key, factor['publicKey']),
    });
  }
  for (final beneficiary in beneficiaries) {
    final id = beneficiary['beneficiary_id'].toString();
    if (ignored.contains(id)) continue;
    final capsule = wrapKey(key, beneficiary['publicKey'], timeCapsule: true);
    final recipientFactors = jsonList(beneficiary['factors']);
    if (recipientFactors.isEmpty) {
      result.add({
        'ref_id': refId,
        'beneficiary_id': id,
        'publicKey': 'null',
        'key': capsule,
      });
    }
    for (final factor in recipientFactors) {
      result.add({
        'ref_id': refId,
        'beneficiary_id': id,
        'publicKey': factor['publicKey'],
        'key': wrapKey(capsule, factor['publicKey']),
      });
    }
  }
  return result;
}

Iterable<List<Json>> keyBatches(List<Json> keys) sync* {
  var batch = <Json>[];
  var size = 0;
  for (final key in keys) {
    final length = key['key'].toString().length;
    if (batch.isNotEmpty && (batch.length >= 1000 || size + length > 500000)) {
      yield batch;
      batch = [];
      size = 0;
    }
    batch.add(key);
    size += length;
  }
  if (batch.isNotEmpty) yield batch;
}
