// Verifies native authentication owns the WebView lifetime.
// Owns sign-in, account-switch and logout boundary regressions.
// Does not initialize Firebase or load the production website.
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:cipherwill/app/account_gate.dart';
import 'package:cipherwill/app/router.dart';
import 'package:cipherwill/features/auth/auth_screen.dart';
import 'package:cipherwill/features/webview/mobile_webview.dart';
import 'package:cipherwill/testing/auth_harness.dart';
import 'package:cipherwill/testing/fake_auth.dart';
import 'package:cipherwill/testing/fake_webview.dart';

void main() {
  testWidgets('native routes send full web destinations into the wrapper', (
    tester,
  ) async {
    final platform = FakeWebViewPlatform();
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    final auth = FakeAuth();
    addTearDown(auth.dispose);
    final router = createRouter();
    addTearDown(router.dispose);
    await tester.pumpWidget(
      AuthHarness(
        auth: auth,
        screen: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      platform.controllers.single.requests.single.uri.toString(),
      'https://cipherwill.com/app',
    );
    router.go('/app/notes?item=123');
    await tester.pumpAndSettle();
    expect(
      platform.controllers.last.requests.single.uri.toString(),
      'https://cipherwill.com/app/notes?item=123',
    );
    router.go('/executor/account');
    await tester.pumpAndSettle();
    expect(
      platform.controllers.last.requests.single.uri.toString(),
      'https://cipherwill.com/executor/account',
    );
  });
  testWidgets(
    'sign-in opens the web app; account switches replace it; logout returns to native auth',
    (tester) async {
      final platform = FakeWebViewPlatform();
      final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
      WebViewPlatform.instance = platform;
      addTearDown(() => WebViewPlatform.instance = previous);
      final auth = FakeAuth()..user = null;
      addTearDown(auth.dispose);
      await tester.pumpWidget(
        AuthHarness(auth: auth, screen: const AccountGate()),
      );
      await tester.pumpAndSettle();
      expect(find.byType(AuthScreen), findsOneWidget);
      expect(platform.controllers, isEmpty);

      auth.setUser(FakeUser('first'));
      await tester.pumpAndSettle();
      expect(find.byType(MobileWebView), findsOneWidget);
      expect(
        platform.controllers.single.requests.single.uri.toString(),
        'https://cipherwill.com/app',
      );
      expect(platform.controllers.single.events, [
        'channel',
        'channel',
        'load',
      ]);

      auth.setUser(FakeUser('second'));
      await tester.pumpAndSettle();
      expect(platform.controllers, hasLength(2));
      expect(
        tester.widget<MobileWebView>(find.byType(MobileWebView)).user.uid,
        'second',
      );
      platform.controllers.last.send('{"type":"logout","id":1}');
      await tester.pumpAndSettle();
      expect(auth.signOuts, 1);
      expect(find.byType(AuthScreen), findsOneWidget);
      expect(find.byType(MobileWebView), findsNothing);
    },
  );
}
