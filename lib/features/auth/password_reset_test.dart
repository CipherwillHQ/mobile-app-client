// Verifies native password resets preserve the existing backend email policy.
// Owns GraphQL request shape, skipped delivery and backend error regressions.
// Does not contact Firebase or send emails.
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'password_reset.dart';

void main() {
  late HttpServer server;
  late PasswordReset reset;
  final requests = <Map>[];
  Map response = {};
  setUp(() async {
    requests.clear();
    server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    reset = PasswordReset('http://127.0.0.1:${server.port}/v1/');
    server.listen((request) async {
      requests.add(jsonDecode(await utf8.decoder.bind(request).join()) as Map);
      request.response.headers.contentType = ContentType.json;
      request.response.write(jsonEncode(response));
      await request.response.close();
    });
  });
  tearDown(() => server.close(force: true));

  test(
    'requests a reset for the trimmed email and reports confirmed delivery',
    () async {
      response = {
        'data': {
          'requestPasswordReset': {'sent': true, 'reason': null},
        },
      };
      expect(
        await reset.request(' owner@example.test '),
        'Password reset email sent. Check your inbox.',
      );
      expect(requests.single['operationName'], 'REQUEST_PASSWORD_RESET');
      expect(requests.single['variables'], {'email': 'owner@example.test'});
      expect(
        requests.single['query'],
        contains('requestPasswordReset(email: \$email) { sent reason }'),
      );
    },
  );
  test(
    'skipped delivery uses the backend reason instead of claiming an email was sent',
    () async {
      response = {
        'data': {
          'requestPasswordReset': {
            'sent': false,
            'reason': 'Verify your email first',
          },
        },
      };
      expect(
        await reset.request('owner@example.test'),
        'Verify your email first',
      );
    },
  );
  test(
    'backend errors remain visible to the native authentication form',
    () async {
      response = {
        'errors': [
          {'message': 'Reset unavailable'},
        ],
      };
      await expectLater(
        reset.request('owner@example.test'),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            'Reset unavailable',
          ),
        ),
      );
    },
  );
}
