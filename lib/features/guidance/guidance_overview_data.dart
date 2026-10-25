// Loads the same account facts used by the web Guide overview.
// Owns fresh score, record, beneficiary and factor counts.
// Does not fetch encrypted vault contents or award account scores.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../home/account_score.dart';

final guidanceOverviewProvider = FutureProvider.autoDispose<Json>((ref) async {
  final api = ref.watch(apiProvider);
  final values = await Future.wait([
    api.run('GET_USER_SCORE'),
    api.run('GET_METAMODEL_TYPE_COUNTS'),
    api.run('GET_SMARTWILL_BENEFICIARY'),
    api.run('GET_FACTORS'),
  ]);
  final account = await ref.watch(accountProvider.future);
  final typeCounts = jsonList(values[1]['getMetamodelTypeCounts']);
  return {
    'firstName': account['first_name']?.toString().trim(),
    'emailVerified': account['email_verified'] == true,
    'score': accountScore(values[0]['getUserScore']),
    'itemCount': typeCounts.fold<int>(
      0,
      (sum, item) => sum + (item['count'] as int),
    ),
    'typeCounts': typeCounts,
    'beneficiaryCount': jsonList(values[2]['getSmartWillBeneficiaries']).length,
    'factorCount': jsonList(values[3]['getFactors']).length,
  };
});
