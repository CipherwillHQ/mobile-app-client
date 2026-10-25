// Verifies trusted web origins and retained Firebase email deep links.
// Owns link routing assertions after native feature routes were removed.
// Does not navigate a device or grant account access.
import 'package:flutter_test/flutter_test.dart';
import 'webview_links.dart';

void main() {
  test('only the exact HTTPS Cipherwill origin is trusted', () {
    expect(isCipherwillPage(Uri.parse('https://cipherwill.com/app')), true);
    for (final url in [
      'http://cipherwill.com/app',
      'https://www.cipherwill.com/app',
      'https://cipherwill.com.attacker.test/app',
      'https://cipherwill.com:444/app',
      'https://owner@cipherwill.com/app',
      'javascript:alert(1)',
    ]) {
      expect(isCipherwillPage(Uri.parse(url)), false, reason: url);
    }
  });
  test('Firebase actions remain native and preserve their one-time codes', () {
    final uri = Uri.parse(
      'https://auth.cipherwill.com/__/auth/action?mode=verifyEmail&oobCode=test-code',
    );
    expect(
      mobileLocation(uri),
      '/auth-action?mode=verifyEmail&oobCode=test-code',
    );
    expect(
      mobileLocation(
        Uri.parse('/auth-action?mode=verifyEmail&oobCode=test-code'),
      ),
      null,
    );
  });
  test('web and custom-scheme application links retain their destinations', () {
    expect(
      mobileLocation(Uri.parse('https://cipherwill.com/app/notes?item=123')),
      '/app/notes?item=123',
    );
    expect(
      mobileLocation(Uri.parse('cipherwill://app/notes?item=123')),
      '/app/notes?item=123',
    );
    expect(
      webAppUri(Uri.parse('/executor/account?folder=123')).toString(),
      'https://cipherwill.com/executor/account?folder=123',
    );
    expect(mobileLocation(Uri.parse('https://other.test/app')), '/app');
  });
}
