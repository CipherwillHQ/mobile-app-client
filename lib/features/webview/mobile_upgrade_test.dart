// Verifies billing upgrades leave the wrapper for the system browser.
// Owns main-frame interception and initial upgrade deep-link regressions.
// Does not load checkout or submit a payment.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'mobile_webview.dart';
import 'webview_links.dart';

void main() {
  test('only the trusted upgrade path receives special external handling', () {
    expect(
      isExternalUpgrade(Uri.parse('https://cipherwill.com/upgrade')),
      true,
    );
    expect(
      isExternalUpgrade(Uri.parse('https://cipherwill.com/upgrade/')),
      true,
    );
    for (final url in [
      'https://cipherwill.com/app/billing',
      'https://cipherwill.com/upgrade-other',
      'https://other.test/upgrade',
      'https://cipherwill.com:444/upgrade',
      'http://cipherwill.com/upgrade',
    ]) {
      expect(isExternalUpgrade(Uri.parse(url)), false, reason: url);
    }
  });

  for (final deepLink in [false, true]) {
    testWidgets('upgrade opens externally (initial deep link: $deepLink)', (
      tester,
    ) async {
      final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
      final platform = FakeWebViewPlatform();
      WebViewPlatform.instance = platform;
      addTearDown(() => WebViewPlatform.instance = previous);
      final auth = FakeAuth();
      addTearDown(auth.dispose);
      final launches = <MethodCall>[];
      const launcher = MethodChannel('plugins.flutter.io/url_launcher');
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(launcher, (
        call,
      ) async {
        launches.add(call);
        return true;
      });
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          launcher,
          null,
        ),
      );
      final upgrade = Uri.https('cipherwill.com', '/upgrade', {
        'email': 'owner+mobile@example.test',
        'user_id': 'database_account',
      });
      await tester.pumpWidget(
        MaterialApp(
          home: MobileWebView(
            auth: auth,
            user: auth.currentUser!,
            uri: deepLink ? upgrade : null,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final native = platform.controllers.single;
      if (!deepLink) {
        expect(
          await native.navigation.navigate!(
            NavigationRequest(url: upgrade.toString(), isMainFrame: true),
          ),
          NavigationDecision.prevent,
        );
      }
      expect(
        native.requests.single.uri.toString(),
        'https://cipherwill.com/app',
      );
      expect(launches.single.method, 'launch');
      expect(launches.single.arguments['url'], upgrade.toString());
      expect(launches.single.arguments['useWebView'], false);
      expect(launches.single.arguments['useSafariVC'], false);
      expect(
        await native.navigation.navigate!(
          NavigationRequest(
            url: 'https://cipherwill.com/app/billing',
            isMainFrame: true,
          ),
        ),
        NavigationDecision.navigate,
      );
      expect(
        await native.navigation.navigate!(
          NavigationRequest(url: upgrade.toString(), isMainFrame: false),
        ),
        NavigationDecision.navigate,
      );
      expect(launches, hasLength(1));
    });
  }
}
