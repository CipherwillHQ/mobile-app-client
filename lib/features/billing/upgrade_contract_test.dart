// Checks the Flutter boundary against the web upgrade page's public contract.
// Owns account encoding, result validation and trusted URL regression tests.
// Does not test Paddle internally or confirm backend subscription activation.
import 'package:flutter_test/flutter_test.dart';
import 'upgrade_contract.dart';

void main() {
  test('upgrade links encode backend identity without credentials', () {
    final uri = upgradeUri({
      'id': 'id&one',
      'email': 'sam+mobile@example.com',
      'token': 'must-not-be-sent',
      'privateKey': 'must-not-be-sent',
    });
    expect(uri.origin, 'https://www.cipherwill.com');
    expect(uri.path, '/upgrade');
    expect(uri.queryParameters, {
      'email': 'sam+mobile@example.com',
      'user_id': 'id&one',
    });
    expect(uri.toString(), isNot(contains('must-not-be-sent')));
    expect(() => upgradeUri({'email': 'sam@example.com'}), throwsStateError);
  });
  test('matches success and error messages in FlutterWebView.md', () {
    expect(
      UpgradeResult.parse(
        '{"type":"cipherwill.upgrade","status":"success"}',
      )!.success,
      isTrue,
    );
    final error = UpgradeResult.parse(
      '{"type":"cipherwill.upgrade","status":"error",'
      '"code":"checkout.payment.failed","message":"Please try again."}',
    )!;
    expect(error.success, isFalse);
    expect(error.code, 'checkout.payment.failed');
    expect(error.message, 'Please try again.');
  });
  test('malformed, unrelated and nonterminal messages are ignored', () {
    for (final payload in [
      'invalid',
      'null',
      '[]',
      '"success"',
      '{"type":"other","status":"success"}',
      '{"type":"cipherwill.upgrade","status":"closed"}',
      '{"type":"cipherwill.upgrade","status":"success","message":42}',
      '{"type":"cipherwill.upgrade","status":"error","code":{}}',
    ]) {
      expect(UpgradeResult.parse(payload), isNull, reason: payload);
    }
  });
  test('only the HTTPS Cipherwill upgrade page can deliver native results', () {
    expect(
      isUpgradePage(Uri.parse('https://www.cipherwill.com/upgrade')),
      isTrue,
    );
    expect(isUpgradePage(Uri.parse('https://cipherwill.com/upgrade/')), isTrue);
    for (final url in [
      'http://www.cipherwill.com/upgrade',
      'https://www.cipherwill.com.evil.test/upgrade',
      'https://www.cipherwill.com/app',
      'https://user@www.cipherwill.com/upgrade',
      'https://www.cipherwill.com:444/upgrade',
    ]) {
      expect(isUpgradePage(Uri.parse(url)), isFalse, reason: url);
    }
  });
}
