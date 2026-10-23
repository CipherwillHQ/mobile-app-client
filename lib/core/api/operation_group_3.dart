// Registers generated GraphQL operation documents.
// Owns one modular operation lookup group.
// Does not cache account or vault data.
import 'package:gql/ast.dart';
import 'operations/REMOVE_IGNORED_BENEFICIARY.graphql.dart' as op0;
import 'operations/REMOVE_USER_PHONE_NUMBER.graphql.dart' as op1;
import 'operations/REQUEST_ACCOUNT_REACTIVATION.graphql.dart' as op2;
import 'operations/REQUEST_ACCOUNT_RESET.graphql.dart' as op3;
import 'operations/REQUEST_PASSWORD_RESET.graphql.dart' as op4;
import 'operations/RESET_WILL_EVENTS.graphql.dart' as op5;
import 'operations/RESUME_GUIDED_ACTION.graphql.dart' as op6;
import 'operations/REVOKE_ACCESS_TO_MY_WILL.graphql.dart' as op7;
import 'operations/SEARCH_PERSON.graphql.dart' as op8;
import 'operations/SEND_EMAIL_VERIFICATION.graphql.dart' as op9;
import 'operations/SEND_USER_PHONE_VERIFICATION_CODE.graphql.dart' as op10;
import 'operations/UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY.graphql.dart' as op11;
import 'operations/UPDATE_FACTOR.graphql.dart' as op12;
import 'operations/UPDATE_METAMODEL.graphql.dart' as op13;
import 'operations/UPDATE_MOBILE_PREFERENCES.graphql.dart' as op14;
import 'operations/UPDATE_PREFERENCES.graphql.dart' as op15;
import 'operations/UPDATE_USER.graphql.dart' as op16;
import 'operations/UPSERT_KEYS.graphql.dart' as op17;
import 'operations/VERIFY_USER_PHONE_NUMBER.graphql.dart' as op18;
import 'operations/commitUploadSession.graphql.dart' as op19;
import 'operations/createUploadPodSession.graphql.dart' as op20;
import 'operations/getPodDownloadUrl.graphql.dart' as op21;

final operationGroup3 = <String, DocumentNode>{
  'REMOVE_IGNORED_BENEFICIARY':
      op0.documentNodeMutationREMOVE_IGNORED_BENEFICIARY,
  'REMOVE_USER_PHONE_NUMBER': op1.documentNodeMutationREMOVE_USER_PHONE_NUMBER,
  'REQUEST_ACCOUNT_REACTIVATION':
      op2.documentNodeMutationREQUEST_ACCOUNT_REACTIVATION,
  'REQUEST_ACCOUNT_RESET': op3.documentNodeMutationREQUEST_ACCOUNT_RESET,
  'REQUEST_PASSWORD_RESET': op4.documentNodeMutationREQUEST_PASSWORD_RESET,
  'RESET_WILL_EVENTS': op5.documentNodeMutationRESET_WILL_EVENTS,
  'RESUME_GUIDED_ACTION': op6.documentNodeMutationRESUME_GUIDED_ACTION,
  'REVOKE_ACCESS_TO_MY_WILL': op7.documentNodeMutationREVOKE_ACCESS_TO_MY_WILL,
  'SEARCH_PERSON': op8.documentNodeQuerySEARCH_PERSON,
  'SEND_EMAIL_VERIFICATION': op9.documentNodeMutationSEND_EMAIL_VERIFICATION,
  'SEND_USER_PHONE_VERIFICATION_CODE':
      op10.documentNodeMutationSEND_USER_PHONE_VERIFICATION_CODE,
  'UPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY':
      op11.documentNodeMutationUPDATE_CUSTOM_MESSAGE_FOR_BENEFICIARY,
  'UPDATE_FACTOR': op12.documentNodeMutationUPDATE_FACTOR,
  'UPDATE_METAMODEL': op13.documentNodeMutationUPDATE_METAMODEL,
  'UPDATE_MOBILE_PREFERENCES':
      op14.documentNodeMutationUPDATE_MOBILE_PREFERENCES,
  'UPDATE_PREFERENCES': op15.documentNodeMutationUPDATE_PREFERENCES,
  'UPDATE_USER': op16.documentNodeMutationUPDATE_USER,
  'UPSERT_KEYS': op17.documentNodeMutationUPSERT_KEYS,
  'VERIFY_USER_PHONE_NUMBER': op18.documentNodeMutationVERIFY_USER_PHONE_NUMBER,
  'commitUploadSession': op19.documentNodeMutationcommitUploadSession,
  'createUploadPodSession': op20.documentNodeMutationcreateUploadPodSession,
  'getPodDownloadUrl': op21.documentNodeQuerygetPodDownloadUrl,
};
