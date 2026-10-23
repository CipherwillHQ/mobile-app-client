// Binds trusted native services to catalog operation names
// Owns encrypted saves with stable retry identities and local asset context.
// Does not send draft credentials to completion mutations.

import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_failure.dart';
import '../../core/api/json_values.dart';
import '../security/session_controller.dart';
import '../security/key_migration.dart';
import '../vault/vault_repository.dart';
import '../vault/categories.dart';
import '../vault/upload_service.dart';
import '../storage/file_service.dart';
import 'input_validation.dart';

class GuidanceOperations {
  final ApiClient api;
  final VaultLease lease;
  const GuidanceOperations(this.api, this.lease);
  static const types = [
    'create_item_id',
    'save_encrypted_asset',
    'save_encrypted_file',
    'lookup_person',
    'migrate_beneficiary',
  ];
  Future<dynamic> run(String type, Json args) async {
    lease.check();
    switch (type) {
      case 'create_item_id':
        return 'guided_' + const Uuid().v4();
      case 'lookup_person':
        final people = jsonList(
          (await api.run('SEARCH_PERSON', {
            'email': args['email'],
          }))['searchPerson'],
        );
        lease.check();
        return people.where((p) => p['__typename'] == 'User').firstOrNull;
      case 'migrate_beneficiary':
        final people = jsonList(
          (await api.run(
            'GET_SMARTWILL_BENEFICIARY',
          ))['getSmartWillBeneficiaries'],
        );
        lease.check();
        final person = people.firstWhere(
          (p) => p['person_id'] == args['personId'],
        );
        await KeyMigration(api, lease).beneficiary(person['id']);
        return null;
      case 'save_encrypted_file':
        final file = args['file'] as File;
        final id = args['itemId'] as String;
        if (await saved(id)) return {'itemId': id};
        await FileService(
          api,
          lease,
        ).upload(file, file.path.split(Platform.pathSeparator).last, id: id);
        return {'itemId': id};
      case 'save_encrypted_asset':
        return saveAsset(args);
      default:
        throw StateError('Unsupported guidance operation.');
    }
  }

  Future<bool> saved(String id) async {
    if (await UploadService(api).resume(id, lease)) return true;
    try {
      final model = await VaultRepository(api, lease).metadata(id);
      await VaultRepository(api, lease).read(id, categoryFor(model['type']));
      return true;
    } on ApiFailure catch (error) {
      if (!['MODEL_NOT_FOUND', 'POD_NOT_FOUND'].contains(error.code)) rethrow;
      return false;
    }
  }

  Future<Json> saveAsset(Json args) async {
    final schema = asJson(args['schema']);
    final id = args['itemId'] as String;
    if (!RegExp(r'^[\w-]{6,100}$').hasMatch(id)) {
      throw StateError('Invalid guidance item identity.');
    }
    if (await saved(id)) return {'itemId': id};
    final answers = {
      for (final input in jsonList(schema['inputs']))
        input['key']: normalizeGuidance(input, args[input['key']]),
    };
    final metadata = {
      for (final entry in asJson(schema['metadata']).entries)
        entry.key: answers[entry.value],
    };
    final data = <String, dynamic>{};
    for (final entry in asJson(schema['fields']).entries) {
      final field = asJson(entry.value);
      dynamic value = answers[field['answer']];
      if (field['format'] == 'word_list') {
        value = (value?.toString() ?? '').trim().split(RegExp(r'\s+'));
      }
      if (field['format'] == 'plain_text_html') {
        value = (value?.toString() ?? '')
            .split('\n')
            .map((line) => '<p>' + const HtmlEscape().convert(line) + '</p>')
            .join();
      }
      data[entry.key] = value;
    }
    final model = asJson(
      (await api.run('CREATE_METAMODEL', {
        'id': id,
        'type': schema['type'],
        'metadata': jsonEncode(metadata),
      }))['createMetamodel'],
    );
    lease.check();
    await UploadService(api).text(
      id,
      jsonEncode({
        'type': schema['podType'],
        'version': schema['version'],
        'data': data,
      }),
      schema['version'],
      (model['ignored_beneficiaries'] as List? ?? []).cast<String>(),
      lease,
    );
    return {'itemId': id};
  }

  Future<Json> assets() async {
    final counts = jsonList(
      (await api.run('GET_METAMODEL_TYPE_COUNTS'))['getMetamodelTypeCounts'],
    );
    lease.check();
    final total = counts.fold<int>(
      0,
      (sum, item) => sum + (item['count'] as int),
    );
    for (final type in ['BANK_ACCOUNT', 'PAYMENT_CARD', 'EMAIL_ACCOUNT']) {
      if (!counts.any((c) => c['type'] == type && c['count'] > 0)) continue;
      final models = jsonList(
        (await api.run('GET_METAMODELS', {
          'type': type,
        }))['getMetamodels']['models'],
      );
      lease.check();
      for (final model in models.take(3)) {
        try {
          final data = await VaultRepository(
            api,
            lease,
          ).read(model['id'], categoryFor(type));
          final value =
              data[type == 'BANK_ACCOUNT'
                  ? 'bank_name'
                  : type == 'PAYMENT_CARD'
                  ? 'issuer'
                  : 'provider'];
          if (value is String && value.trim().isNotEmpty) {
            final label = value.trim();
            return {
              'total': total,
              'label':
                  'your ' +
                  label.substring(0, label.length > 80 ? 80 : label.length) +
                  (type == 'BANK_ACCOUNT'
                      ? ' bank account'
                      : type == 'PAYMENT_CARD'
                      ? ' card'
                      : ' email account'),
            };
          }
        } catch (_) {
          lease.check();
        }
      }
    }
    return {'total': total, 'label': null};
  }
}
