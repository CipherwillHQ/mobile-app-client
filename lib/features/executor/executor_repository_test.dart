// Verifies executor reads reject exclusions, unreleased wills and revocation.
// Owns online permission checks before and after content decryption.
// Does not contact a donor account or expose real will data.
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../core/api/api_failure.dart';
import '../../core/crypto/aes.dart';
import '../../core/crypto/ecies.dart';
import '../../core/crypto/factor_key.dart';
import '../security/session_controller.dart';
import 'executor_repository.dart';

void main() {
  final capsule = FactorKey.fromPrivate('2');
  final encrypted = wrapKey('pod-key', capsule.publicKey, timeCapsule: true);
  test('excluded beneficiaries cannot read keys or content', () async {
    final api = FakeApi(
      (name, args) async => name == 'GET_ACCESS_DETAILS'
          ? {
              'getAccessDetails': {
                'expire_at': '9999999999999',
                'beneficiary_id': 'excluded',
              },
            }
          : {
              'getGrantedMetamodel': {
                'ignored_beneficiaries': ['excluded'],
              },
            },
    );
    await expectLater(
      ExecutorRepository(api, VaultLease(null, () {})).read('access', 'item'),
      throwsStateError,
    );
    expect(api.calls.any((c) => c.$1 == 'GET_POD'), false);
    expect(api.calls.any((c) => c.$1 == 'GET_KEY_BY_REF_ID'), false);
    api.dispose();
  });
  test('expired access is rejected before fetching an item', () async {
    final api = FakeApi(
      (name, args) async => {
        'getAccessDetails': {'expire_at': '1', 'beneficiary_id': 'person'},
      },
    );
    await expectLater(
      ExecutorRepository(api, VaultLease(null, () {})).read('access', 'item'),
      throwsStateError,
    );
    expect(api.calls.length, 1);
    api.dispose();
  });
  test('an unreleased will has no readable capsule', () async {
    final api = FakeApi((name, args) async {
      if (name == 'GET_ACCESS_DETAILS') {
        return {
          'getAccessDetails': {
            'expire_at': '9999999999999',
            'beneficiary_id': 'person',
          },
        };
      }
      if (name == 'GET_GRANTED_METAMODEL') {
        return {
          'getGrantedMetamodel': {'type': 'NOTE', 'ignored_beneficiaries': []},
        };
      }
      return {'getBeneficiaryEncryptionKey': null};
    });
    await expectLater(
      ExecutorRepository(api, VaultLease(null, () {})).read('access', 'item'),
      throwsStateError,
    );
    expect(api.calls.any((c) => c.$1 == 'GET_POD'), false);
    api.dispose();
  });
  test(
    'revocation during decryption prevents returning protected content',
    () async {
      var checks = 0;
      final api = FakeApi((name, args) async {
        switch (name) {
          case 'GET_ACCESS_DETAILS':
            if (++checks > 1) {
              throw const ApiFailure('ACCESS_REVOKED', 'Revoked');
            }
            return {
              'getAccessDetails': {
                'expire_at': '9999999999999',
                'beneficiary_id': 'person',
              },
            };
          case 'GET_GRANTED_METAMODEL':
            return {
              'getGrantedMetamodel': {
                'type': 'NOTE',
                'ignored_beneficiaries': [],
              },
            };
          case 'GET_BENEFICIARY_ENCRYPTION_KEY':
            return {'getBeneficiaryEncryptionKey': capsule.privateKey};
          case 'GET_KEY_BY_REF_ID':
            return {
              'getKeyByRefId': {'key': encrypted},
            };
          default:
            return {
              'getPod': {
                'content': encryptText(
                  '{"type":"note","data":{"content":"Protected"}}',
                  'pod-key',
                ),
              },
            };
        }
      });
      await expectLater(
        ExecutorRepository(api, VaultLease(null, () {})).read('access', 'item'),
        throwsA(isA<ApiFailure>()),
      );
      expect(checks, 2);
      api.dispose();
    },
  );
  test(
    'exclusion changes during a read prevent returning the decrypted item',
    () async {
      var modelReads = 0;
      final api = FakeApi((name, args) async {
        switch (name) {
          case 'GET_ACCESS_DETAILS':
            return {
              'getAccessDetails': {
                'expire_at': '9999999999999',
                'beneficiary_id': 'person',
              },
            };
          case 'GET_GRANTED_METAMODEL':
            return {
              'getGrantedMetamodel': {
                'type': 'NOTE',
                'ignored_beneficiaries': ++modelReads == 1 ? [] : ['person'],
              },
            };
          case 'GET_BENEFICIARY_ENCRYPTION_KEY':
            return {'getBeneficiaryEncryptionKey': capsule.privateKey};
          case 'GET_KEY_BY_REF_ID':
            return {
              'getKeyByRefId': {'key': encrypted},
            };
          default:
            return {
              'getPod': {
                'content': encryptText(
                  '{"type":"note","data":{"content":"Protected"}}',
                  'pod-key',
                ),
              },
            };
        }
      });
      await expectLater(
        ExecutorRepository(api, VaultLease(null, () {})).read('access', 'item'),
        throwsStateError,
      );
      expect(modelReads, 2);
      api.dispose();
    },
  );
}
