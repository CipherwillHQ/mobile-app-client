// Verifies safe restore behavior against a deterministic backend substitute.
// Owns repeated restore, unreadable items, exclusions and concurrent saves.
// Does not export user data or connect to the backend.
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../core/api/api_failure.dart';
import '../../core/crypto/aes.dart';
import '../security/session_controller.dart';
import 'backup_codec.dart';
import 'backup_service.dart';

void main() {
  final item = {
    'id': 'note_item',
    'type': 'NOTE',
    'metadata': '{"title":"Backup"}',
    'ignored_beneficiaries': ['backup_excluded'],
    'data': {
      'type': 'note',
      'version': '0.0.2',
      'data': {'content': '<p>Saved</p>'},
    },
  };
  final payload = BackupPayload('0.0.2', [item]);
  test(
    'repeated restore preserves exclusions and skips the readable saved item',
    () async {
      var committed = false;
      var exclusions = <String>['web_excluded'];
      final api = FakeApi((name, args) async {
        switch (name) {
          case 'GET_METAMODEL':
            return {
              'getMetamodel': {...item, 'ignored_beneficiaries': exclusions},
            };
          case 'GET_POD':
            if (!committed) throw const ApiFailure('POD_NOT_FOUND', 'Missing');
            return {
              'getPod': {
                'content': encryptText(jsonEncode(item['data']), 'pod-key'),
              },
            };
          case 'GET_KEY_BY_REF_ID':
            return {
              'getKeyByRefId': {'key': 'pod-key'},
            };
          case 'CREATE_METAMODEL':
            exclusions = (args['ignored_beneficiaries'] as List).cast<String>();
            return {};
          case 'GET_FACTORS':
            return {'getFactors': []};
          case 'GET_BENEFICIARY_FACTORS':
            return {'getBeneficiaryFactors': []};
          case 'createUploadPodSession':
            expect(args['require_missing_pod'], true);
            return {
              'createUploadPodSession': {'id': 'session'},
            };
          case 'commitUploadSession':
            committed = true;
            return {
              'commitUploadSession': {'status': 'COMPLETED'},
            };
          default:
            return {};
        }
      });
      final service = BackupService(api, VaultLease(null, () {}));
      expect(await service.restore(payload, (_) {}), (1, 0));
      expect(exclusions, containsAll(['web_excluded', 'backup_excluded']));
      expect(await service.restore(payload, (_) {}), (0, 1));
      expect(
        api.calls.where((c) => c.$1 == 'createUploadPodSession').length,
        1,
      );
      api.dispose();
    },
  );
  test('existing unreadable content is not overwritten', () async {
    final api = FakeApi((name, args) async {
      if (name == 'GET_METAMODEL') return {'getMetamodel': item};
      if (name == 'GET_POD') {
        return {
          'getPod': {'content': 'existing_ciphertext'},
        };
      }
      return {'getKeyByRefId': null};
    });
    await expectLater(
      BackupService(api, VaultLease(null, () {})).restore(payload, (_) {}),
      throwsStateError,
    );
    expect(api.calls.any((c) => c.$1 == 'CREATE_METAMODEL'), false);
    api.dispose();
  });
  test(
    'a concurrent newer save rejects restore without reporting success',
    () async {
      final api = FakeApi((name, args) async {
        if (name == 'GET_METAMODEL') return {'getMetamodel': item};
        if (name == 'GET_POD') {
          throw const ApiFailure('POD_NOT_FOUND', 'Missing');
        }
        if (name == 'createUploadPodSession') {
          throw const ApiFailure(
            'REQUEST_FAILED',
            'Saved content already exists',
          );
        }
        return {};
      });
      await expectLater(
        BackupService(api, VaultLease(null, () {})).restore(payload, (_) {}),
        throwsA(isA<ApiFailure>()),
      );
      expect(api.calls.any((c) => c.$1 == 'uploadText'), false);
      api.dispose();
    },
  );
}
