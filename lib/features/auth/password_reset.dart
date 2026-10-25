// Requests password reset emails through the existing backend policy.
// Owns the one public GraphQL operation still needed by native sign-in.
// Does not contain vault operations or use Firebase's client email sender.
import 'dart:convert';
import 'dart:io';

class PasswordReset {
  final String apiUrl;
  const PasswordReset(this.apiUrl);

  Future<String> request(String email) async {
    final client = HttpClient()
      ..connectionTimeout = const Duration(seconds: 30);
    try {
      final request = await client.postUrl(Uri.parse(apiUrl));
      request.headers.contentType = ContentType.json;
      request.write(
        jsonEncode({
          'operationName': 'REQUEST_PASSWORD_RESET',
          'query':
              'mutation REQUEST_PASSWORD_RESET(\$email: String!) { requestPasswordReset(email: \$email) { sent reason } }',
          'variables': {'email': email.trim()},
        }),
      );
      final response = await request.close().timeout(
        const Duration(seconds: 30),
      );
      if (response.statusCode != 200) {
        throw StateError(
          'Unable to request a password reset. Please try again.',
        );
      }
      final result =
          jsonDecode(await response.transform(utf8.decoder).join()) as Map;
      if (result['errors'] != null) {
        throw StateError(result['errors'][0]['message'].toString());
      }
      final outcome = result['data']['requestPasswordReset'] as Map;
      return outcome['sent'] == true
          ? 'Password reset email sent. Check your inbox.'
          : outcome['reason']?.toString() ??
                'No password reset email was sent.';
    } finally {
      client.close(force: true);
    }
  }
}
