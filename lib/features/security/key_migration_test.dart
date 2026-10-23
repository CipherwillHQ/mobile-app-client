// Checks recipient migration preserves exclusions and chooses readable source keys.
// Owns E1 wrapping and failure before deleting keys from an unreadable factor.
// Does not change stored ciphertext or use real beneficiary identities.
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../core/crypto/factor_key.dart';
import '../../core/crypto/ecies.dart';
import '../security/session_controller.dart';
import 'key_migration.dart';

void main() {
  test(
    'beneficiary migration excludes blocked items and wraps allowed keys',
    () async {
      final capsule = FactorKey.fromPrivate('2');
      final api = FakeApi((name, args) async {
        switch (name) {
          case 'GET_MY_KEY_COUNT':
            return {
              'getMyKeyCount': [
                {'publicKey': 'null', 'count': 2},
              ],
            };
          case 'GET_BENEFICIARY_FACTORS':
            return {
              'getBeneficiaryFactors': [
                {
                  'beneficiary_id': 'person',
                  'publicKey': capsule.publicKey,
                  'factors': [],
                },
              ],
            };
          case 'GET_KEY_ITEMS_BY_PUBLIC_KEY':
            return {
              'getKeyItemsByPublicKey': {
                'has_more': false,
                'items': [
                  {'ref_id': 'allowed', 'key': 'pod-key'},
                  {'ref_id': 'excluded', 'key': 'other-key'},
                ],
              },
            };
          case 'GET_METAMODEL':
            return {
              'getMetamodel': {
                'ignored_beneficiaries': args['id'] == 'excluded'
                    ? ['person']
                    : [],
              },
            };
          default:
            return {};
        }
      });
      await KeyMigration(api, VaultLease(null, () {})).beneficiary('person');
      final items =
          api.calls.firstWhere((c) => c.$1 == 'UPSERT_KEYS').$2['items']
              as List;
      expect(items.length, 1);
      expect(items.single['ref_id'], 'allowed');
      expect(items.single['beneficiary_id'], 'person');
      expect(
        beneficiaryKey(items.single['key'], capsule.privateKey, null),
        'pod-key',
      );
      api.dispose();
    },
  );
  test(
    'an unreadable source is rejected before any migration mutation',
    () async {
      final api = FakeApi(
        (name, args) async => {
          'getMyKeyCount': [
            {'publicKey': 'locked-factor', 'count': 10},
          ],
        },
      );
      await expectLater(
        KeyMigration(api, VaultLease(null, () {})).factor('destination'),
        throwsStateError,
      );
      expect(api.calls.map((c) => c.$1), ['GET_MY_KEY_COUNT']);
      api.dispose();
    },
  );
}
