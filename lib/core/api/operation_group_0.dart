// Registers generated GraphQL operation documents.
// Owns one modular operation lookup group.
// Does not cache account or vault data.
import 'package:gql/ast.dart';
import 'operations/ACK_GUIDANCE_OPERATION.graphql.dart' as op0;
import 'operations/ADD_IGNORED_BENEFICIARY.graphql.dart' as op1;
import 'operations/ADD_SMARTWILL_BENEFICIARY.graphql.dart' as op2;
import 'operations/ADD_SMARTWILL_FRIEND.graphql.dart' as op3;
import 'operations/ADD_USER_PHONE_NUMBER.graphql.dart' as op4;
import 'operations/CANCEL_SUBSCRIPTION_AT_PERIOD_END.graphql.dart' as op5;
import 'operations/CANCEL_SUBSCRIPTION_NOW_AND_REFUND.graphql.dart' as op6;
import 'operations/COMPLETE_GUIDED_ACTION.graphql.dart' as op7;
import 'operations/COMPLETE_MY_ONBOARDING.graphql.dart' as op8;
import 'operations/CREATE_FACTOR.graphql.dart' as op9;
import 'operations/CREATE_FOLDER.graphql.dart' as op10;
import 'operations/CREATE_METAMODEL.graphql.dart' as op11;
import 'operations/DEFER_GUIDED_ACTION.graphql.dart' as op12;
import 'operations/DELETE_ACCOUNT.graphql.dart' as op13;
import 'operations/DELETE_ALL_KEYS_FOR_BENEFICIARY.graphql.dart' as op14;
import 'operations/DELETE_DATA.graphql.dart' as op15;
import 'operations/DELETE_FACTOR.graphql.dart' as op16;
import 'operations/DELETE_FOLDER.graphql.dart' as op17;
import 'operations/DELETE_KEY_BY_PUBLIC_KEY.graphql.dart' as op18;
import 'operations/DELETE_METAMODEL.graphql.dart' as op19;
import 'operations/DELETE_POD.graphql.dart' as op20;
import 'operations/DELETE_SMARTWILL_BENEFICIARY.graphql.dart' as op21;

final operationGroup0 = <String, DocumentNode>{
  'ACK_GUIDANCE_OPERATION': op0.documentNodeMutationACK_GUIDANCE_OPERATION,
  'ADD_IGNORED_BENEFICIARY': op1.documentNodeMutationADD_IGNORED_BENEFICIARY,
  'ADD_SMARTWILL_BENEFICIARY':
      op2.documentNodeMutationADD_SMARTWILL_BENEFICIARY,
  'ADD_SMARTWILL_FRIEND': op3.documentNodeMutationADD_SMARTWILL_FRIEND,
  'ADD_USER_PHONE_NUMBER': op4.documentNodeMutationADD_USER_PHONE_NUMBER,
  'CANCEL_SUBSCRIPTION_AT_PERIOD_END':
      op5.documentNodeMutationCANCEL_SUBSCRIPTION_AT_PERIOD_END,
  'CANCEL_SUBSCRIPTION_NOW_AND_REFUND':
      op6.documentNodeMutationCANCEL_SUBSCRIPTION_NOW_AND_REFUND,
  'COMPLETE_GUIDED_ACTION': op7.documentNodeMutationCOMPLETE_GUIDED_ACTION,
  'COMPLETE_MY_ONBOARDING': op8.documentNodeMutationCOMPLETE_MY_ONBOARDING,
  'CREATE_FACTOR': op9.documentNodeMutationCREATE_FACTOR,
  'CREATE_FOLDER': op10.documentNodeMutationCREATE_FOLDER,
  'CREATE_METAMODEL': op11.documentNodeMutationCREATE_METAMODEL,
  'DEFER_GUIDED_ACTION': op12.documentNodeMutationDEFER_GUIDED_ACTION,
  'DELETE_ACCOUNT': op13.documentNodeMutationDELETE_ACCOUNT,
  'DELETE_ALL_KEYS_FOR_BENEFICIARY':
      op14.documentNodeMutationDELETE_ALL_KEYS_FOR_BENEFICIARY,
  'DELETE_DATA': op15.documentNodeMutationDELETE_DATA,
  'DELETE_FACTOR': op16.documentNodeMutationDELETE_FACTOR,
  'DELETE_FOLDER': op17.documentNodeMutationDELETE_FOLDER,
  'DELETE_KEY_BY_PUBLIC_KEY': op18.documentNodeMutationDELETE_KEY_BY_PUBLIC_KEY,
  'DELETE_METAMODEL': op19.documentNodeMutationDELETE_METAMODEL,
  'DELETE_POD': op20.documentNodeMutationDELETE_POD,
  'DELETE_SMARTWILL_BENEFICIARY':
      op21.documentNodeMutationDELETE_SMARTWILL_BENEFICIARY,
};
