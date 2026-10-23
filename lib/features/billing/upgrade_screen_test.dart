// Exercises the real billing-to-WebView route and web callback behavior.
// Owns success/error/close, backend refresh and payment-processing regressions.
// Does not run a live payment or claim device checkout acceptance.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'testing/upgrade_harness.dart';

const success = '{"type":"cipherwill.upgrade","status":"success"}';

void main() {
  testWidgets('rapid upgrade taps open a single checkout route', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    final button = tester.widget<FilledButton>(
      find.widgetWithText(FilledButton, 'Upgrade to Premium'),
    );
    button.onPressed!();
    button.onPressed!();
    await tester.pumpAndSettle();
    expect(harness.web.controllers, hasLength(1));
    await tester.tap(find.byTooltip('Close checkout'));
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/billing');
  });
  testWidgets(
    'direct upgrade links use the current account and can close to billing',
    (tester) async {
      final harness = UpgradeHarness();
      await harness.mount(tester);
      harness.router.go(
        '/upgrade?email=other@example.com&user_id=another-account',
      );
      await tester.pumpAndSettle();
      expect(harness.controller.requests.single.uri.queryParameters, {
        'email': 'sam+mobile@example.com',
        'user_id': 'backend-account',
      });
      await tester.tap(find.byTooltip('Close checkout'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/billing');
    },
  );
  testWidgets(
    'loads current backend attribution with channel registered first',
    (tester) async {
      final harness = UpgradeHarness();
      await harness.mount(tester);
      await harness.open(tester);
      final web = harness.controller;
      expect(web.events, ['channel', 'load']);
      expect(web.channel!.name, 'CipherwillUpgrade');
      expect(web.mode, JavaScriptMode.unrestricted);
      expect(web.requests.single.uri.queryParameters, {
        'email': 'sam+mobile@example.com',
        'user_id': 'backend-account',
      });
      expect(web.requests.single.headers, isEmpty);
      expect(harness.api.accountReads, 2);
      expect(find.byType(WebViewWidget), findsOneWidget);
    },
  );
  testWidgets(
    'success closes once and refreshes without granting Premium locally',
    (tester) async {
      final harness = UpgradeHarness();
      await harness.mount(tester);
      await harness.open(tester);
      final before = harness.api.accountReads;
      harness.controller.send(success);
      harness.controller.send(success);
      await tester.pumpAndSettle();
      expect(find.byType(WebViewWidget), findsNothing);
      expect(harness.router.state.uri.path, '/billing');
      expect(harness.api.accountReads, before + 1);
      expect(
        find.textContaining('Premium will appear after processing'),
        findsOneWidget,
      );
      expect(find.text('Upgrade to Premium'), findsOneWidget);
      expect(
        harness.api.calls
            .where((call) => call.$1 == 'GET_MY_SUBSCRIPTION')
            .length,
        2,
      );
      harness.api.plan = 'premium';
      await tester.tap(find.byTooltip('Refresh billing'));
      await tester.pumpAndSettle();
      expect(find.text('Upgrade to Premium'), findsNothing);
    },
  );
  testWidgets('web errors close checkout and report retry feedback', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final before = harness.api.accountReads;
    harness.controller.send(
      '{"type":"cipherwill.upgrade","status":"error",'
      '"code":"checkout.payment.failed","message":"Please try again."}',
    );
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/billing');
    expect(find.text('Please try again.'), findsOneWidget);
    expect(harness.api.accountReads, before);
    await harness.open(tester);
    expect(harness.web.controllers, hasLength(2));
  });
  testWidgets('malformed messages and manual close do not report success', (
    tester,
  ) async {
    final harness = UpgradeHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final web = harness.controller;
    web.send('invalid');
    web.send('{"type":"cipherwill.upgrade","status":"closed"}');
    await tester.pumpAndSettle();
    expect(find.byType(WebViewWidget), findsOneWidget);
    await tester.tap(find.byTooltip('Close checkout'));
    await tester.pumpAndSettle();
    web.send(success);
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/billing');
    expect(find.textContaining('Payment received'), findsNothing);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
    'already Premium accounts retain billing without an upgrade entry',
    (tester) async {
      final harness = UpgradeHarness();
      harness.api.plan = 'premium';
      await harness.mount(tester);
      expect(find.text('Upgrade to Premium'), findsNothing);
      expect(find.text('Subscription and invoices'), findsOneWidget);
    },
  );
}
