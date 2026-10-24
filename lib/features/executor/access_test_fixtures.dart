// Supplies synthetic grants for dashboard and execution scenario tests.
// Owns controllable server responses and pending permission mutations.
// Does not contact Firebase or contain real will data.
import 'dart:async';
import '../../core/api/api_failure.dart';
import '../../core/api/json_values.dart';
import '../../testing/design_fixtures.dart';

const receivedWill = {
  'id': 'grant',
  'user': 'donor',
  'beneficiary_id': 'beneficiary-record',
  'expire_at': '4102444800000',
};
const secondWill = {
  'id': 'grant-two',
  'user': 'donor-two',
  'beneficiary_id': 'beneficiary-record-two',
  'expire_at': '4102444800000',
};
const releasedGrant = {
  'id': 'released',
  'user': 'beneficiary-person',
  'beneficiary_id': 'owner-beneficiary-record',
  'expire_at': '4102444800000',
};

class AccessScenario {
  List<Json> received = [];
  List<Json> released = [];
  final denied = <String>{};
  final pendingChecks = <String, Completer<Json>>{};
  Completer<Json>? revocation;
  bool failAccess = false;
  bool failReceived = false;
  bool failModels = false;
  bool failRevocation = false;
  Future<Json> respond(String operation, Json variables) async {
    switch (operation) {
      case 'GET_ALL_BENEFICIARY_ACCESS':
        if (failReceived) {
          throw const ApiFailure('NETWORK', 'Connection failed');
        }
        return {'getAllBeneficiaryAccess': received};
      case 'GET_ALL_GRANTED_BENEFICIARIES':
        return {'getAllGrantedBeneficiaries': released};
      case 'GET_ACCESS_DETAILS':
        final id = variables['access_id'];
        if (failAccess) throw const ApiFailure('NETWORK', 'Connection failed');
        if (pendingChecks.containsKey(id)) return pendingChecks[id]!.future;
        if (denied.contains(id)) {
          throw const ApiFailure('BAD_USER_INPUT', 'Invalid Access ID');
        }
        return {
          'getAccessDetails': received.firstWhere((grant) => grant['id'] == id),
        };
      case 'GET_GRANTED_METAMODEL_TYPE_COUNTS':
        return {
          'getGrantedMetamodelTypeCounts': [
            {'type': 'NOTE', 'count': 2},
            {'type': 'FILE', 'count': 1},
            {'type': 'PASSWORD', 'count': 0},
          ],
        };
      case 'GET_PERSON':
        final name = switch (variables['id']) {
          'donor' => 'Alex',
          'donor-two' => 'Morgan',
          'beneficiary-person' => 'Casey',
          _ => 'Sam',
        };
        return {
          'getPerson': {'first_name': name, 'last_name': 'Taylor'},
        };
      case 'REVOKE_ACCESS_TO_MY_WILL':
        if (failRevocation) {
          throw const ApiFailure('NETWORK', 'Connection failed');
        }
        final result =
            await (revocation?.future ??
                Future.value({'revokeAccessToMyWill': true}));
        if (result['revokeAccessToMyWill'] == true) {
          released = released
              .where((grant) => grant['id'] != variables['id'])
              .toList();
        }
        return result;
      case 'GET_GRANTED_METAMODELS':
        if (failModels) throw const ApiFailure('FORBIDDEN', 'Access revoked');
        final response = await designResponse(operation, variables);
        final models = asJson(response['getGrantedMetamodels']);
        models['models'] = [
          ...jsonList(models['models']),
          {
            'id': 'excluded',
            'metadata': '{"title":"Excluded family note"}',
            'ignored_beneficiaries': ['beneficiary-record'],
          },
        ];
        return response;
      default:
        return designResponse(operation, variables);
    }
  }
}
