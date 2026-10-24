// Exercises support account/network failures and account-switch races.
// Owns fresh retry, widget timeout and subresource failure regression coverage.
// Does not call the backend or Tawk services.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_auth.dart';
import 'support_chat_document.dart';
import 'testing/support_harness.dart';

void main() {
  testWidgets('failed account lookup offers Retry before creating a WebView', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    harness.api.failAccount = true;
    await harness.open(tester);
    expect(harness.web.controllers, isEmpty);
    expect(find.textContaining('Unable to open support'), findsOneWidget);
    harness.api.failAccount = false;
    await tester.tap(find.text('Retry'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    harness.controller.send('ready');
    await tester.pumpAndSettle();
    expect(find.byType(WebViewWidget), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('script errors offer a fresh account and widget on retry', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    await harness.open(tester);
    final first = harness.controller;
    final reads = harness.api.accountReads;
    first.send('error');
    await tester.pumpAndSettle();
    expect(find.textContaining('Live support could not load'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(harness.api.accountReads, reads + 1);
    expect(harness.web.controllers, hasLength(2));
    expect(first.htmlLoads.last.$1, supportChatBlankDocument);
    harness.controller.send('ready');
    await tester.pumpAndSettle();
    expect(find.byType(WebViewWidget), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('a widget that never becomes ready times out with a retry', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    await harness.open(tester);
    await tester.pump(const Duration(seconds: 31));
    expect(find.text('Retry'), findsOneWidget);
    expect(find.byType(WebViewWidget), findsNothing);
    expect(harness.controller.htmlLoads.last.$1, supportChatBlankDocument);
    harness.controller.send('ready');
    await tester.pump();
    expect(find.text('Retry'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('subresource failures do not discard a usable support chat', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    await harness.open(tester);
    harness.controller.send('ready');
    harness.controller.navigation.resourceError!(
      WebResourceError(
        errorCode: -1,
        description: 'Image unavailable',
        isForMainFrame: false,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WebViewWidget), findsOneWidget);
    harness.controller.navigation.resourceError!(
      WebResourceError(
        errorCode: -1,
        description: 'Connection unavailable',
        isForMainFrame: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Retry'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('an account switch during lookup blocks stale attribution', (
    tester,
  ) async {
    final harness = SupportHarness();
    await harness.mount(tester);
    final pending = Completer<void>();
    harness.api.delay = pending;
    await harness.open(tester);
    harness.auth.user = FakeUser('another-account');
    pending.complete();
    await tester.pumpAndSettle();
    expect(harness.web.controllers, isEmpty);
    expect(find.text('Retry'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
