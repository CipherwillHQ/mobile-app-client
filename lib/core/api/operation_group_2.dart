// Registers generated GraphQL operation documents.
// Owns one modular operation lookup group.
// Does not cache account or vault data.
import 'package:gql/ast.dart';
import 'operations/GET_METAMODELS.graphql.dart' as op0;
import 'operations/GET_METAMODEL_TYPE_COUNTS.graphql.dart' as op1;
import 'operations/GET_MY_INVOICES.graphql.dart' as op2;
import 'operations/GET_MY_KEY_COUNT.graphql.dart' as op3;
import 'operations/GET_MY_ONBOARDING.graphql.dart' as op4;
import 'operations/GET_MY_SUBSCRIPTION.graphql.dart' as op5;
import 'operations/GET_NEXT_WILL_EVENT.graphql.dart' as op6;
import 'operations/GET_PADDLE_PORTAL_SESSION_URL.graphql.dart' as op7;
import 'operations/GET_PERSON.graphql.dart' as op8;
import 'operations/GET_PERSON_BY_IDS.graphql.dart' as op9;
import 'operations/GET_POD.graphql.dart' as op10;
import 'operations/GET_PREFERENCES.graphql.dart' as op11;
import 'operations/GET_SMARTWILL_BENEFICIARY.graphql.dart' as op12;
import 'operations/GET_SMARTWILL_FRIENDS.graphql.dart' as op13;
import 'operations/GET_STORAGE_USED.graphql.dart' as op14;
import 'operations/GET_UPLOAD_POD_SESSION.graphql.dart' as op15;
import 'operations/GET_USER_PHONE_NUMBERS.graphql.dart' as op16;
import 'operations/GET_USER_SCORE.graphql.dart' as op17;
import 'operations/GUIDANCE_BOOTSTRAP.graphql.dart' as op18;
import 'operations/INVITE_USER.graphql.dart' as op19;
import 'operations/ME.graphql.dart' as op20;
import 'operations/RECHECK_MY_ACTIONS_VALIDATION.graphql.dart' as op21;

final operationGroup2 = <String, DocumentNode>{
  'GET_METAMODELS': op0.documentNodeQueryGET_METAMODELS,
  'GET_METAMODEL_TYPE_COUNTS': op1.documentNodeQueryGET_METAMODEL_TYPE_COUNTS,
  'GET_MY_INVOICES': op2.documentNodeQueryGET_MY_INVOICES,
  'GET_MY_KEY_COUNT': op3.documentNodeQueryGET_MY_KEY_COUNT,
  'GET_MY_ONBOARDING': op4.documentNodeQueryGET_MY_ONBOARDING,
  'GET_MY_SUBSCRIPTION': op5.documentNodeQueryGET_MY_SUBSCRIPTION,
  'GET_NEXT_WILL_EVENT': op6.documentNodeQueryGET_NEXT_WILL_EVENT,
  'GET_PADDLE_PORTAL_SESSION_URL':
      op7.documentNodeQueryGET_PADDLE_PORTAL_SESSION_URL,
  'GET_PERSON': op8.documentNodeQueryGET_PERSON,
  'GET_PERSON_BY_IDS': op9.documentNodeQueryGET_PERSON_BY_IDS,
  'GET_POD': op10.documentNodeQueryGET_POD,
  'GET_PREFERENCES': op11.documentNodeQueryGET_PREFERENCES,
  'GET_SMARTWILL_BENEFICIARY': op12.documentNodeQueryGET_SMARTWILL_BENEFICIARY,
  'GET_SMARTWILL_FRIENDS': op13.documentNodeQueryGET_SMARTWILL_FRIENDS,
  'GET_STORAGE_USED': op14.documentNodeQueryGET_STORAGE_USED,
  'GET_UPLOAD_POD_SESSION': op15.documentNodeQueryGET_UPLOAD_POD_SESSION,
  'GET_USER_PHONE_NUMBERS': op16.documentNodeQueryGET_USER_PHONE_NUMBERS,
  'GET_USER_SCORE': op17.documentNodeQueryGET_USER_SCORE,
  'GUIDANCE_BOOTSTRAP': op18.documentNodeQueryGUIDANCE_BOOTSTRAP,
  'INVITE_USER': op19.documentNodeMutationINVITE_USER,
  'ME': op20.documentNodeQueryME,
  'RECHECK_MY_ACTIONS_VALIDATION':
      op21.documentNodeMutationRECHECK_MY_ACTIONS_VALIDATION,
};
