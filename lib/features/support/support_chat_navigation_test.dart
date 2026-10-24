// Checks production support entry, privacy gates and external-link routing.
// Owns drawer reachability, locking and trusted-frame navigation tests.
// Does not open native browsers or send support messages.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../features/security/session_controller.dart';
import '../../testing/fake_webview.dart';
import '../../testing/fake_url_launcher.dart';
import '../../testing/navigation_harness.dart';
import 'support_chat_document.dart';
import 'testing/support_harness.dart';

void main() {
  testWidgets('the sidebar opens isolated support and locking unloads it', (
    tester,
  ) async {
    final previous = WebViewPlatform.instance;
    final web = FakeWebViewPlatform();
    WebViewPlatform.instance = web;
    addTearDown(() {
      if (previous != null) WebViewPlatform.instance = previous;
    });
    final harness = NavigationHarness();
    addTearDown(harness.dispose);
    await harness.mount(tester);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('Live Chat with Team'),
      300,
      scrollable: find
          .descendant(
            of: find.byType(Drawer),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.tap(find.text('Live Chat with Team'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(harness.router.state.uri.path, '/support-chat');
    expect(find.byType(Drawer), findsNothing);
    expect(find.byTooltip('Open menu'), findsNothing);
    web.controllers.last.send('ready');
    await tester.pumpAndSettle();
    expect(find.byType(WebViewWidget), findsOneWidget);
    harness.container.read(sessionProvider.notifier).lock();
    await tester.pumpAndSettle();
    expect(find.text('Unlock your vault'), findsOneWidget);
    expect(find.byType(WebViewWidget), findsNothing);
    expect(web.controllers.last.htmlLoads.last.$1, supportChatBlankDocument);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
    'external HTTPS links open outside the attributed chat document',
    (tester) async {
      final harness = SupportHarness();
      final launcher = FakeUrlLauncher(tester.binding.defaultBinaryMessenger);
      addTearDown(launcher.dispose);
      await harness.mount(tester);
      await harness.open(tester);
      harness.controller.send('ready');
      await tester.pumpAndSettle();
      final navigate = harness.controller.navigation.navigate!;
      expect(
        await navigate(
          NavigationRequest(
            url: 'https://widget.tawk.to/iframe',
            isMainFrame: false,
          ),
        ),
        NavigationDecision.navigate,
      );
      expect(
        await navigate(
          NavigationRequest(
            url: 'https://cipherwill.com/support',
            isMainFrame: true,
          ),
        ),
        NavigationDecision.prevent,
      );
      expect(
        launcher.calls.last.arguments['url'],
        'https://cipherwill.com/support',
      );
      expect(launcher.calls.last.arguments['useWebView'], false);
      for (final url in [
        'javascript:alert(1)',
        'file:///private',
        'http://unsafe.example',
      ]) {
        expect(
          await navigate(NavigationRequest(url: url, isMainFrame: true)),
          NavigationDecision.prevent,
        );
      }
      expect(launcher.calls, hasLength(1));
      expect(harness.router.state.uri.path, '/support-chat');
      await tester.pumpWidget(const SizedBox());
    },
  );
}
