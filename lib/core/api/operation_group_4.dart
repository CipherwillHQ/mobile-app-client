// Registers generated GraphQL operation documents.
// Owns one modular operation lookup group.
// Does not cache account or vault data.
import 'package:gql/ast.dart';
import 'operations/sendFeedback.graphql.dart' as op0;
import 'operations/uploadSessionKeys.graphql.dart' as op1;
import 'operations/uploadSessionPod.graphql.dart' as op2;

final operationGroup4 = <String, DocumentNode>{
  'sendFeedback': op0.documentNodeMutationsendFeedback,
  'uploadSessionKeys': op1.documentNodeMutationuploadSessionKeys,
  'uploadSessionPod': op2.documentNodeMutationuploadSessionPod,
};
