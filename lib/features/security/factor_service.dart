// Creates and removes existing factors with required key migration
// Owns factor lifecycle and source-session validation.
// Does not invent new encryption protocols.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../../core/crypto/factor_key.dart';
import '../../core/crypto/bytes.dart';
import '../security/session_controller.dart';
import 'factor_authenticator.dart';
import 'key_migration.dart';

class FactorService {
  final ApiClient api;
  final VaultLease lease;
  final FactorAuthenticator authenticator;
  const FactorService(this.api, this.lease, this.authenticator);
  Future<void> add(
    String type,
    String name,
    Json account, {
    String? password,
  }) async {
    final migration = KeyMigration(api, lease);
    await migration.source();
    String nonce;
    FactorKey key;
    if (type == 'passkey') {
      final result = await authenticator.createPasskey(account);
      nonce = result.$1;
      key = result.$2;
    } else {
      nonce = (int.parse(toHex(randomBytes(3)), radix: 16) % 1000000)
          .toString();
      if (type == 'master-password') {
        if (password == null || password.length < 4) {
          throw StateError('Use at least four characters.');
        }
        key = FactorKey.master(password, nonce);
      } else {
        key = FactorKey.wallet(await authenticator.wallet.sign(nonce), nonce);
      }
    }
    lease.check();
    await api.run('CREATE_FACTOR', {
      'name': name,
      'type': type,
      'publicKey': key.publicKey,
      'nonce': nonce,
    });
    lease.check();
    await migration.factor(key.publicKey);
  }

  Future<void> remove(Json factor) async {
    final factors = jsonList((await api.run('GET_FACTORS'))['getFactors']);
    lease.check();
    if (factors.length == 1) {
      if (lease.key?.publicKey != factor['publicKey']) {
        throw StateError('Unlock the factor you want to remove.');
      }
      await KeyMigration(api, lease).factor('null');
    } else {
      final counts = jsonList(
        (await api.run('GET_ALL_KEY_COUNT'))['getAllKeyCount'],
      );
      lease.check();
      final current = counts
          .where((c) => c['publicKey'] == factor['publicKey'])
          .firstOrNull;
      if (!counts.any(
        (c) =>
            c['publicKey'] != factor['publicKey'] &&
            (c['count'] as int) >= (current?['count'] as int? ?? 0),
      )) {
        throw StateError(
          'Migrate all keys to another factor before removing this factor.',
        );
      }
    }
    await api.run('DELETE_KEY_BY_PUBLIC_KEY', {
      'publicKey': factor['publicKey'],
    });
    lease.check();
    await api.run('DELETE_FACTOR', {'id': factor['id']});
  }
}
