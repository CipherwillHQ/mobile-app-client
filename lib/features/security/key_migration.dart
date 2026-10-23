// Migrates owner and beneficiary keys without changing ciphertext
// Owns source selection and cancellable key rewrapping.
// Does not retain private keys or bypass exclusions.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/ecies.dart';
import '../vault/recipient_keys.dart';
import '../security/session_controller.dart';

class KeyMigration {
  final ApiClient api;
  final VaultLease lease;
  const KeyMigration(this.api, this.lease);
  Future<String> source() async {
    final counts = jsonList(
      (await api.run('GET_MY_KEY_COUNT'))['getMyKeyCount'],
    );
    lease.check();
    counts.sort((a, b) => (b['count'] as int).compareTo(a['count'] as int));
    if (counts.isEmpty || counts.first['count'] == 0) return 'null';
    final max = counts.first['count'];
    final current = counts.where(
      (c) => c['count'] == max && c['publicKey'] == lease.key?.publicKey,
    );
    final selected = current.isNotEmpty ? current.first : counts.first;
    if (selected['publicKey'] != 'null' &&
        selected['publicKey'] != lease.key?.publicKey) {
      throw StateError(
        'Unlock the factor with the most keys before migrating.',
      );
    }
    return selected['publicKey'];
  }

  Future<List<Json>> keys(String publicKey, {bool beneficiary = false}) async {
    final all = <Json>[];
    String? cursor;
    while (true) {
      lease.check();
      final page = asJson(
        (await api.run('GET_KEY_ITEMS_BY_PUBLIC_KEY', {
          'publicKey': publicKey,
          'cursor': cursor,
          'for_beneficiary_migration': beneficiary,
        }))['getKeyItemsByPublicKey'],
      );
      lease.check();
      final items = jsonList(page['items']);
      all.addAll(items);
      if (page['has_more'] != true) break;
      if (items.isEmpty || cursor == items.last['id']) {
        throw StateError('Key pagination did not advance.');
      }
      cursor = items.last['id'];
    }
    return all;
  }

  Future<void> upsert(List<Json> items) async {
    for (final batch in keyBatches(items)) {
      lease.check();
      await api.run('UPSERT_KEYS', {'items': batch});
      lease.check();
    }
  }

  Future<void> factor(String destination) async {
    final sourceKey = await source();
    final rows = await keys(sourceKey);
    final output = <Json>[];
    for (final row in rows) {
      lease.check();
      final key = ownerKey(row['key'], lease.key);
      output.add({
        'ref_id': row['ref_id'],
        'beneficiary_id': row['beneficiary_id'],
        'publicKey': destination,
        'key': destination == 'null' ? key : wrapKey(key, destination),
      });
    }
    await upsert(output);
    if (sourceKey == 'null' && destination != 'null') {
      await api.run('DELETE_KEY_BY_PUBLIC_KEY', {'publicKey': 'null'});
    }
  }

  Future<void> beneficiary(String beneficiaryId) async {
    final sourceKey = await source();
    final targets = jsonList(
      (await api.run('GET_BENEFICIARY_FACTORS'))['getBeneficiaryFactors'],
    );
    lease.check();
    final target = targets.firstWhere(
      (b) => b['beneficiary_id'] == beneficiaryId,
    );
    final rows = await keys(sourceKey, beneficiary: true);
    final output = <Json>[];
    for (final row in rows) {
      lease.check();
      final model = asJson(
        (await api.run('GET_METAMODEL', {'id': row['ref_id']}))['getMetamodel'],
      );
      lease.check();
      if ((model['ignored_beneficiaries'] as List? ?? []).contains(
        beneficiaryId,
      )) {
        continue;
      }
      final key = ownerKey(row['key'], lease.key);
      output.addAll(
        recipientKeys(row['ref_id'], key, [], [
          target,
        ], []).where((item) => item['beneficiary_id'] == beneficiaryId),
      );
    }
    await api.run('DELETE_ALL_KEYS_FOR_BENEFICIARY', {
      'beneficiary_id': beneficiaryId,
    });
    lease.check();
    await upsert(output);
  }
}
