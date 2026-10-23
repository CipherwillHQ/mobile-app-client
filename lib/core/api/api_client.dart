// Executes authenticated generated GraphQL operations without persistent caching
// Owns queries, mutations and multipart text upload.
// Does not decrypt data or log transport payloads.
import 'dart:convert';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:graphql/client.dart';
import 'api_failure.dart';
import 'operation_documents.dart';
import 'operations/ME.graphql.dart';

class ApiClient {
  final String url;
  final Future<String?> Function() token;
  final dio.Dio transfers;
  late final GraphQLClient client;
  ApiClient(this.url, this.token)
    : transfers = dio.Dio(
        dio.BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(minutes: 5),
        ),
      ) {
    client = GraphQLClient(
      link: AuthLink(getToken: token).concat(HttpLink(url)),
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
        query: Policies(fetch: FetchPolicy.noCache),
        mutate: Policies(fetch: FetchPolicy.noCache),
      ),
    );
  }
  Future<Map<String, dynamic>> run(
    String name, [
    Map<String, dynamic> variables = const {},
  ]) async {
    final document = operationDocuments[name];
    if (document == null) throw ArgumentError('Unknown operation $name');
    final definition = document.definitions
        .whereType<OperationDefinitionNode>()
        .first;
    final result = definition.type == OperationType.mutation
        ? await client.mutate(
            MutationOptions(document: document, variables: variables),
          )
        : await client.query(
            QueryOptions(document: document, variables: variables),
          );
    if (result.hasException) {
      final errors = result.exception!.graphqlErrors;
      if (errors.isEmpty) {
        throw const ApiFailure(
          'NETWORK',
          'Unable to connect. Check your connection and retry.',
        );
      }
      final code =
          errors.first.extensions?['code']?.toString() ?? 'REQUEST_FAILED';
      throw ApiFailure(
        code,
        code == 'USER_DEACTIVATED'
            ? 'Your account is inactive. Request reactivation to continue.'
            : errors.first.message,
      );
    }
    return result.data ?? <String, dynamic>{};
  }

  Future<Query$ME$me> account() async => Query$ME.fromJson(await run('ME')).me;
  Future<void> uploadText(String sessionId, Uint8List encrypted) async {
    final headers = {
      'Authorization': await token(),
      'apollo-require-preflight': 'true',
    };
    final form = dio.FormData.fromMap({
      'operations': jsonEncode({
        'query': printNode(operationDocuments['uploadSessionPod']!),
        'variables': {'session_id': sessionId, 'file': null},
      }),
      'map': jsonEncode({
        '0': ['variables.file'],
      }),
      '0': dio.MultipartFile.fromBytes(
        encrypted,
        filename: 'encrypted-text-pod.txt',
        contentType: dio.DioMediaType.parse('text/plain'),
      ),
    });
    final response = await transfers.post<dynamic>(
      url,
      data: form,
      options: dio.Options(headers: headers),
    );
    final data = response.data as Map;
    if (data['errors'] != null ||
        (data['data'] as Map?)?['uploadSessionPod'] == null) {
      throw const ApiFailure(
        'UPLOAD_FAILED',
        'Encrypted upload failed. Retry to finish saving.',
      );
    }
  }

  void dispose() {
    client.cache.store.reset();
    transfers.close(force: true);
  }
}
