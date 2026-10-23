// Exercises checkout loading recovery and native navigation boundaries.
// Owns retry, stale callback, account-switch and external-link regressions.
// Does not submit payments or change vault-lock behavior.
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_auth.dart';
import 'testing/upgrade_harness.dart';

void main() {
  testWidgets('page failures retry with a fresh account and WebView', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final old = harness.controller;
    old.navigation.resourceError!(
      const WebResourceError(
        errorCode: -2,
        description: 'Private URL must not appear',
        isForMainFrame: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('Private URL'), findsNothing);
    expect(find.text('Retry'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(harness.web.controllers, hasLength(2));
    expect(harness.api.accountReads, 3);
    old.send('{"type":"cipherwill.upgrade","status":"success"}');
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/upgrade');
    expect(find.byType(WebViewWidget), findsOneWidget);
  });
  testWidgets(
    'account lookup failures can retry without sending stale attribution',
    (tester) async {
      final harness = UpgradeHarness();
      await harness.mount(tester);
      harness.api.failAccount = true;
      await harness.open(tester);
      expect(harness.web.controllers, isEmpty);
      expect(find.text('Retry'), findsOneWidget);
      harness.api.failAccount = false;
      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();
      expect(find.byType(WebViewWidget), findsOneWidget);
    },
  );
  testWidgets('account switching during lookup prevents checkout', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    final delay = Completer<void>();
    harness.api.accountDelay = delay;
    await tester.tap(find.text('Upgrade to Premium'));
    await tester.pump();
    harness.auth.user = FakeUser('different-account');
    delay.complete();
    await tester.pumpAndSettle();
    expect(harness.web.controllers, isEmpty);
    expect(find.text('Retry'), findsOneWidget);
  });
  testWidgets('HTTPS checkout frames work and external links use the browser', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final launched = <MethodCall>[];
    const channel = MethodChannel('plugins.flutter.io/url_launcher');
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      call,
    ) async {
      launched.add(call);
      return true;
    });
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        channel,
        null,
      ),
    );
    final navigate = harness.controller.navigation.navigate!;
    expect(
      await navigate(
        const NavigationRequest(
          url: 'https://www.cipherwill.com/upgrade',
          isMainFrame: true,
        ),
      ),
      NavigationDecision.navigate,
    );
    expect(
      await navigate(
        const NavigationRequest(
          url: 'https://checkout.paddle.com/frame',
          isMainFrame: false,
        ),
      ),
      NavigationDecision.navigate,
    );
    for (final url in [
      'http://www.cipherwill.com/upgrade',
      'javascript:alert(1)',
    ]) {
      expect(
        await navigate(NavigationRequest(url: url, isMainFrame: true)),
        NavigationDecision.prevent,
      );
    }
    expect(
      await navigate(
        const NavigationRequest(
          url: 'https://www.cipherwill.com/i/terms-of-service',
          isMainFrame: true,
        ),
      ),
      NavigationDecision.prevent,
    );
    expect(launched, isNotEmpty);
    expect(
      launched.last.arguments['url'],
      'https://www.cipherwill.com/i/terms-of-service',
    );
    harness.controller.navigation.started!('https://unrelated.example/');
    harness.controller.send('{"type":"cipherwill.upgrade","status":"success"}');
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/upgrade');
  });
  testWidgets(
    'subresource failures do not hide checkout; upgrade HTTP errors allow retry',
    (tester) async {
      final harness = UpgradeHarness();
      await harness.mount(tester);
      await harness.open(tester);
      final navigation = harness.controller.navigation;
      navigation.resourceError!(
        const WebResourceError(
          errorCode: -2,
          description: 'Image failed',
          isForMainFrame: false,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(WebViewWidget), findsOneWidget);
      navigation.httpError!(
        HttpResponseError(
          request: WebResourceRequest(
            uri: Uri.parse('https://www.cipherwill.com/upgrade'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text('Checkout is unavailable right now. Please try again.'),
        findsOneWidget,
      );
      expect(find.text('Retry'), findsOneWidget);
    },
  );
}
