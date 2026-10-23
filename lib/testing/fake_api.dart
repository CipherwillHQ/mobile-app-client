// Supplies deterministic API responses for service contract tests.
// Owns request capture and injectable backend behavior.
// Does not open network connections.
import '../core/api/api_client.dart';
import '../core/api/json_values.dart';
import '../core/api/operations/ME.graphql.dart';

class FakeApi extends ApiClient {
  final Future<Json> Function(String, Json) respond;
  final calls = <(String, Json)>[];
  FakeApi(this.respond)
    : super('https://api.invalid', () => Future.value(null));
  @override
  Future<Json> run(String name, [Json variables = const {}]) async {
    calls.add((name, variables));
    return respond(name, variables);
  }

  @override
  Future<Query$ME$me> account() async => Query$ME$me.fromJson({
    '__typename': 'User',
    'id': 'account',
    'email': 'sam@example.com',
    'email_verified': true,
    'plan': 'premium',
    'last_accessed': '1',
    'created_at': '1',
    'updated_at': '1',
  });
  @override
  Future<void> uploadText(String sessionId, dynamic encrypted) async {
    calls.add(('uploadText', {'session_id': sessionId}));
  }
}
