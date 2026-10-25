// Verifies native back waits for confirmation when a note has pending edits.
// Owns stay/leave behavior against deterministic WebView history.
// Does not save notes or exit the real application.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_webview.dart';
import 'mobile_back_guard.dart';

void main() {
  testWidgets('app visibility delivers background and foreground web events', (
    tester,
  ) async {
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    final platform = FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    final web = WebViewController();
    await tester.pumpWidget(
      MaterialApp(
        home: MobileBackGuard(
          dirty: false,
          canGoBack: false,
          controller: web,
          child: const SizedBox(),
        ),
      ),
    );
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    final scripts = platform.controllers.single.scripts;
    expect(
      scripts.any((script) => script.contains('cipherwill:background')),
      true,
    );
    expect(scripts.last, contains('cipherwill:foreground'));
    expect(scripts.last, contains('https://cipherwill.com'));
  });

  testWidgets('Stay preserves history and Leave allows native back', (
    tester,
  ) async {
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    final platform = FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    final web = WebViewController();
    final native = platform.controllers.single;
    await web.setNavigationDelegate(NavigationDelegate());
    native.backAvailable = true;
    await tester.pumpWidget(
      MaterialApp(
        home: MobileBackGuard(
          dirty: true,
          canGoBack: true,
          controller: web,
          child: const Scaffold(body: Text('Note')),
        ),
      ),
    );
    await Navigator.of(tester.element(find.byType(MobileBackGuard))).maybePop();
    await tester.pumpAndSettle();
    expect(find.text('Leave this page?'), findsOneWidget);
    await tester.tap(find.text('Stay'));
    await tester.pumpAndSettle();
    expect(native.backCalls, 0);
    await Navigator.of(tester.element(find.byType(MobileBackGuard))).maybePop();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Leave'));
    await tester.pumpAndSettle();
    expect(native.backCalls, 1);
  });
}
