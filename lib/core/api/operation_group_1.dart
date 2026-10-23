// Registers generated GraphQL operation documents.
// Owns one modular operation lookup group.
// Does not cache account or vault data.
import 'package:gql/ast.dart';
import 'operations/DELETE_SMARTWILL_FRIEND.graphql.dart' as op0;
import 'operations/FORCE_TRIGGER_NEXT_WILL_EVENT.graphql.dart' as op1;
import 'operations/GET_ACCESS_DETAILS.graphql.dart' as op2;
import 'operations/GET_ALL_BENEFICIARY_ACCESS.graphql.dart' as op3;
import 'operations/GET_ALL_GRANTED_BENEFICIARIES.graphql.dart' as op4;
import 'operations/GET_ALL_KEY_COUNT.graphql.dart' as op5;
import 'operations/GET_BENEFICIARY_ENCRYPTION_KEY.graphql.dart' as op6;
import 'operations/GET_BENEFICIARY_FACTORS.graphql.dart' as op7;
import 'operations/GET_BENEFICIARY_KEY_COUNT.graphql.dart' as op8;
import 'operations/GET_BENEFICIARY_SEGMENT_COUNTS.graphql.dart' as op9;
import 'operations/GET_FACTORS.graphql.dart' as op10;
import 'operations/GET_FOLDER.graphql.dart' as op11;
import 'operations/GET_FOLDERS.graphql.dart' as op12;
import 'operations/GET_GRANTED_METAMODEL.graphql.dart' as op13;
import 'operations/GET_GRANTED_METAMODELS.graphql.dart' as op14;
import 'operations/GET_GRANTED_METAMODEL_TYPE_COUNTS.graphql.dart' as op15;
import 'operations/GET_GRANTED_STORAGE_FOLDERS.graphql.dart' as op16;
import 'operations/GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL.graphql.dart'
    as op17;
import 'operations/GET_INVOICE_PDF.graphql.dart' as op18;
import 'operations/GET_KEY_BY_REF_ID.graphql.dart' as op19;
import 'operations/GET_KEY_ITEMS_BY_PUBLIC_KEY.graphql.dart' as op20;
import 'operations/GET_METAMODEL.graphql.dart' as op21;

final operationGroup1 = <String, DocumentNode>{
  'DELETE_SMARTWILL_FRIEND': op0.documentNodeMutationDELETE_SMARTWILL_FRIEND,
  'FORCE_TRIGGER_NEXT_WILL_EVENT':
      op1.documentNodeMutationFORCE_TRIGGER_NEXT_WILL_EVENT,
  'GET_ACCESS_DETAILS': op2.documentNodeQueryGET_ACCESS_DETAILS,
  'GET_ALL_BENEFICIARY_ACCESS': op3.documentNodeQueryGET_ALL_BENEFICIARY_ACCESS,
  'GET_ALL_GRANTED_BENEFICIARIES':
      op4.documentNodeQueryGET_ALL_GRANTED_BENEFICIARIES,
  'GET_ALL_KEY_COUNT': op5.documentNodeQueryGET_ALL_KEY_COUNT,
  'GET_BENEFICIARY_ENCRYPTION_KEY':
      op6.documentNodeQueryGET_BENEFICIARY_ENCRYPTION_KEY,
  'GET_BENEFICIARY_FACTORS': op7.documentNodeQueryGET_BENEFICIARY_FACTORS,
  'GET_BENEFICIARY_KEY_COUNT': op8.documentNodeQueryGET_BENEFICIARY_KEY_COUNT,
  'GET_BENEFICIARY_SEGMENT_COUNTS':
      op9.documentNodeQueryGET_BENEFICIARY_SEGMENT_COUNTS,
  'GET_FACTORS': op10.documentNodeQueryGET_FACTORS,
  'GET_FOLDER': op11.documentNodeQueryGET_FOLDER,
  'GET_FOLDERS': op12.documentNodeQueryGET_FOLDERS,
  'GET_GRANTED_METAMODEL': op13.documentNodeQueryGET_GRANTED_METAMODEL,
  'GET_GRANTED_METAMODELS': op14.documentNodeQueryGET_GRANTED_METAMODELS,
  'GET_GRANTED_METAMODEL_TYPE_COUNTS':
      op15.documentNodeQueryGET_GRANTED_METAMODEL_TYPE_COUNTS,
  'GET_GRANTED_STORAGE_FOLDERS':
      op16.documentNodeQueryGET_GRANTED_STORAGE_FOLDERS,
  'GET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL':
      op17.documentNodeQueryGET_GRANTED_STORAGE_OBJECT_DOWNLOAD_URL,
  'GET_INVOICE_PDF': op18.documentNodeQueryGET_INVOICE_PDF,
  'GET_KEY_BY_REF_ID': op19.documentNodeQueryGET_KEY_BY_REF_ID,
  'GET_KEY_ITEMS_BY_PUBLIC_KEY':
      op20.documentNodeQueryGET_KEY_ITEMS_BY_PUBLIC_KEY,
  'GET_METAMODEL': op21.documentNodeQueryGET_METAMODEL,
};
