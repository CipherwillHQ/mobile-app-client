// Checks the Tawk document's profile allowlist and script-safe serialization.
// Owns public widget contract checks and synthetic JavaScript test fixtures.
// Does not load Tawk or share real account information.
import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'support_chat_document.dart';

void main() {
  const account = {
    'id': 'support-account',
    'email': 'sam+support@example.com',
    'first_name': '</script><script>alert("injected")</script>',
    'middle_name': 'Sam',
    'last_name': 'Mobile',
    'plan': 'premium',
    'token': 'secret-fixture-id-token',
    'privateKey': 'secret-fixture-factor-key',
    'content': 'private-fixture-vault-content',
  };
  test('only the same support profile fields as web are included', () {
    final html = supportChatDocument(account);
    final value = RegExp(r'const identity = (.+);').firstMatch(html)!.group(1)!;
    expect(jsonDecode(value), {
      'visitor': {
        'name': '</script><script>alert("injected")</script> Sam Mobile',
        'email': 'sam+support@example.com',
      },
      'attributes': {'id': 'support-account', 'plan': 'premium'},
    });
    expect(html, isNot(contains('secret-fixture')));
    expect(html, isNot(contains('private-fixture')));
    expect(RegExp('</script>').allMatches(html), hasLength(1));
    expect(
      html,
      contains('https://embed.tawk.to/$tawkPropertyId/$tawkWidgetId'),
    );
    Directory('build').createSync(recursive: true);
    File(
      'build/support_chat_document.json',
    ).writeAsStringSync(jsonEncode({'html': html}));
  });
  test('an account without a profile name uses its email', () {
    expect(
      supportChatDocument({
        'id': 'account',
        'email': 'sam@example.com',
        'plan': 'free',
      }),
      contains('"name":"sam@example.com"'),
    );
  });
}
