// Loads received wills, released owner access and shared category counts.
// Owns account-scoped online metadata used by dashboard and execution views.
// Does not cache decrypted contents or assign an executor role.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../security/session_controller.dart';
import 'access_status.dart';
import 'executor_repository.dart';

final receivedWillsProvider = FutureProvider.autoDispose<List<Json>>(
  (ref) async => jsonList(
    (await ref
        .watch(apiProvider)
        .run('GET_ALL_BENEFICIARY_ACCESS'))['getAllBeneficiaryAccess'],
  ),
  retry: (_, _) => null,
);

final releasedAccessProvider = FutureProvider.autoDispose<List<Json>>(
  (ref) async => jsonList(
    (await ref
        .watch(apiProvider)
        .run('GET_ALL_GRANTED_BENEFICIARIES'))['getAllGrantedBeneficiaries'],
  ).where(isActiveAccess).toList(),
  retry: (_, _) => null,
);

final grantedCountsProvider = FutureProvider.autoDispose
    .family<List<Json>, String>((ref, id) async {
      ref.watch(sessionProvider);
      final api = ref.watch(apiProvider);
      final lease = ref.read(sessionProvider.notifier).lease();
      await ExecutorRepository(api, lease).access(id);
      final response = await api.run('GET_GRANTED_METAMODEL_TYPE_COUNTS', {
        'access_id': id,
      });
      lease.check();
      return jsonList(
        response['getGrantedMetamodelTypeCounts'],
      ).where((count) => (count['count'] as num) > 0).toList();
    }, retry: (_, _) => null);
