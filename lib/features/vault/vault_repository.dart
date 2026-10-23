// Loads and saves vault items with account-scoped encryption
// Owns metadata, pod reads, and text saves.
// Does not cache decrypted records on disk.
import 'dart:convert';
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/aes.dart';
import '../../core/crypto/ecies.dart';
import '../security/session_controller.dart';
import 'asset_category.dart';
import 'pod_codec.dart';
import 'item_metadata.dart';
import 'upload_service.dart';

class VaultRepository {
  final ApiClient api;
  final VaultLease lease;
  const VaultRepository(this.api, this.lease);
  Future<Json> metadata(String id) async {
    lease.check();
    final value = asJson(
      (await api.run('GET_METAMODEL', {'id': id}))['getMetamodel'],
    );
    lease.check();
    return value;
  }

  Future<Json> read(String id, AssetCategory category) async {
    await metadata(id);
    final pod = asJson((await api.run('GET_POD', {'ref_id': id}))['getPod']);
    lease.check();
    final key = (await api.run('GET_KEY_BY_REF_ID', {
      'ref_id': id,
      'publicKey': lease.key?.publicKey ?? 'null',
    }))['getKeyByRefId'];
    lease.check();
    if (key == null) {
      throw StateError(
        'This factor cannot read this item. Switch factors or finish migration.',
      );
    }
    return parsePod(
      decryptText(pod['content'], ownerKey(key['key'], lease.key)),
      category,
    );
  }

  Future<String> create(
    AssetCategory category,
    String title, {
    String? id,
    List<String> ignored = const [],
  }) async {
    lease.check();
    final model = asJson(
      (await api.run('CREATE_METAMODEL', {
        'type': category.type,
        'metadata': jsonEncode(itemMetadata(category.type, title)),
        'id': id,
        'ignored_beneficiaries': ignored,
      }))['createMetamodel'],
    );
    lease.check();
    return model['id'];
  }

  Future<void> save(
    String id,
    AssetCategory category,
    Json data,
    String title,
  ) async {
    final model = await metadata(id);
    final meta = asJson(jsonDecode(model['metadata']));
    meta[itemLabelKey(category.type)] = title;
    await api.run('UPDATE_METAMODEL', {
      'data': {'id': id, 'metadata': jsonEncode(meta)},
    });
    lease.check();
    await UploadService(api).text(
      id,
      encodePod(data, category),
      category.version,
      (model['ignored_beneficiaries'] as List? ?? []).cast<String>(),
      lease,
    );
  }
}
