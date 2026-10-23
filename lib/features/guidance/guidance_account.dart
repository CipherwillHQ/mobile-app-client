// Loads an online guidance snapshot using existing account operations.
// Owns protocol account fields and catalog inputs.
// Does not select objectives or read decrypted asset content.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';
import '../security/session_controller.dart';

Future<(Json, Json)> loadGuidanceAccount(
  ApiClient api,
  VaultLease lease,
) async {
  final bootstrap = await api.run('GUIDANCE_BOOTSTRAP');
  lease.check();
  final user = (await api.account()).toJson();
  lease.check();
  final preferences = asJson(
    (await api.run('GET_PREFERENCES'))['getPreferences'],
  );
  lease.check();
  final beneficiaries = jsonList(
    (await api.run('GET_SMARTWILL_BENEFICIARY'))['getSmartWillBeneficiaries'],
  );
  lease.check();
  return (
    bootstrap,
    {
      'firstName': user['first_name'],
      'lastName': user['last_name'],
      'birthDate': user['birth_date'],
      'plan': user['plan'],
      'preferences': preferences,
      'beneficiaryCount': beneficiaries.length,
      'completedObjectiveIds': bootstrap['getGuidedActionCompletions'] ?? [],
      'deferrals': bootstrap['getGuidedActionDeferrals'] ?? [],
      'recovery': bootstrap['getGuidedActionRecovery'] ?? [],
    },
  );
}
