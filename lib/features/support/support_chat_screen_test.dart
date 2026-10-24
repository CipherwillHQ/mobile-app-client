// Verifies Settings-to-chat routing, attribution and native closing behavior.
// Owns ready/close callbacks and disposed-view isolation regressions.
// Does not execute a live widget or send a support message.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'support_chat_document.dart';
import 'testing/support_harness.dart';

void main() {
  testWidgets('Settings opens an attributed widget with its channel first', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    final before = harness.api.accountReads;
    await harness.open(tester);
    final web = harness.controller;
    expect(harness.router.state.uri.path, '/support-chat');
    expect(web.events, ['channel', 'html']);
    expect(web.channel!.name, 'CipherwillSupport');
    expect(web.mode, JavaScriptMode.unrestricted);
    expect(web.htmlLoads.single.$2, supportChatBaseUrl);
    expect(web.htmlLoads.single.$1, contains('sam+support@example.com'));
    expect(web.htmlLoads.single.$1, contains('"id":"support-account"'));
    expect(web.requests, isEmpty);
    expect(harness.api.accountReads, before + 1);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    web.send('ready');
    await tester.pumpAndSettle();
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.byType(WebViewWidget), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('minimizing chat returns to Settings and unloads its document', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final web = harness.controller;
    web.send('invalid');
    web.send('close');
    await tester.pump();
    expect(harness.router.state.uri.path, '/support-chat');
    web.send('ready');
    web.send('close');
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/settings');
    expect(find.byType(WebViewWidget), findsNothing);
    expect(web.htmlLoads.last.$1, supportChatBlankDocument);
    web.send('ready');
    web.send('close');
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/settings');
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('native Back closes the widget without invoking chat sending', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    await harness.open(tester);
    harness.controller.send('ready');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(harness.router.state.uri.path, '/settings');
    expect(harness.controller.htmlLoads.last.$1, supportChatBlankDocument);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
