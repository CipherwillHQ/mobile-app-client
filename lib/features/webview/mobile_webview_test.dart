// Verifies WebView navigation, retry and native back behavior.
// Owns wrapper interaction tests using the fake native platform.
// Does not open remote pages or launch an external browser.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/auth_harness.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'mobile_webview.dart';

void main() {
  late FakeWebViewPlatform platform;
  late FakeAuth auth;
  setUp(() {
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    platform = FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    auth = FakeAuth();
    addTearDown(auth.dispose);
  });

  testWidgets('native SafeArea owns the insets without duplicate web padding', (
    tester,
  ) async {
    await tester.pumpWidget(
      AuthHarness(
        screen: MobileWebView(auth: auth, user: auth.currentUser!),
      ),
    );
    await tester.pumpAndSettle();
    final safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
    expect(safeArea.top, true);
    expect(safeArea.bottom, true);
    final script = platform.controllers.single.scripts.single;
    expect(
      script,
      contains('window.location.origin === "https://cipherwill.com"'),
    );
    expect(script, contains('setProperty("--cw-safe-top", "0px")'));
    expect(script, contains('setProperty("--cw-safe-bottom", "0px")'));
  });

  testWidgets(
    'trusted app routes stay inside the WebView and unsafe URLs are blocked',
    (tester) async {
      await tester.pumpWidget(
        AuthHarness(
          screen: MobileWebView(auth: auth, user: auth.currentUser!),
        ),
      );
      await tester.pumpAndSettle();
      final web = platform.controllers.single;
      expect(
        await web.navigation.navigate!(
          const NavigationRequest(
            url: 'https://cipherwill.com/app/notes',
            isMainFrame: true,
          ),
        ),
        NavigationDecision.navigate,
      );
      expect(
        await web.navigation.navigate!(
          const NavigationRequest(
            url: 'javascript:alert(1)',
            isMainFrame: true,
          ),
        ),
        NavigationDecision.prevent,
      );
      expect(web.requests.single.uri.queryParameters, isEmpty);
    },
  );

  testWidgets('main-frame loading failures offer a fresh WebView retry', (
    tester,
  ) async {
    await tester.pumpWidget(
      AuthHarness(
        screen: MobileWebView(auth: auth, user: auth.currentUser!),
      ),
    );
    await tester.pumpAndSettle();
    platform.controllers.single.navigation.resourceError!(
      WebResourceError(
        errorCode: -2,
        description: 'offline',
        isForMainFrame: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('Sign out'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(platform.controllers, hasLength(2));
    expect(find.text('Cipherwill web app'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);
  });

  testWidgets(
    'Android back returns through web history before leaving the app',
    (tester) async {
      await tester.pumpWidget(
        AuthHarness(
          screen: MobileWebView(auth: auth, user: auth.currentUser!),
        ),
      );
      await tester.pumpAndSettle();
      final web = platform.controllers.single;
      web.backAvailable = true;
      web.navigation.changed!(
        const UrlChange(url: 'https://cipherwill.com/app/notes'),
      );
      await tester.pumpAndSettle();
      final backScope = find.byWidgetPredicate((widget) => widget is PopScope);
      expect(tester.widget<PopScope>(backScope).canPop, false);
      await Navigator.of(tester.element(find.byType(MobileWebView))).maybePop();
      await tester.pumpAndSettle();
      expect(web.backCalls, 1);
      expect(tester.widget<PopScope>(backScope).canPop, true);
    },
  );
}
