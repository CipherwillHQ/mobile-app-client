// Checks the web-style shell inside production account and privacy gates.
// Owns drawer lock, background privacy and isolated checkout regressions.
// Does not use a real account or complete a payment.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import '../features/security/lock_screen.dart';
import '../features/security/session_controller.dart';
import '../features/billing/testing/fake_webview.dart';
import '../testing/navigation_harness.dart';
import 'app_sidebar.dart';
import 'mobile_section_bar.dart';

void main() {
  late NavigationHarness harness;
  setUp(() => harness = NavigationHarness());
  tearDown(() => harness.dispose());
  testWidgets('factor locking removes protected navigation', (tester) async {
    await harness.mount(tester);
    harness.router.go('/vault/NOTE');
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    harness.container.read(sessionProvider.notifier).lock();
    await tester.pumpAndSettle();
    expect(harness.container.read(sessionProvider), isNull);
    expect(find.byType(AppSidebar), findsNothing);
    expect(find.byType(MobileSectionBar), findsNothing);
    expect(find.byType(LockScreen), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('backgrounding removes drawer contents and returns to lock', (
    tester,
  ) async {
    await harness.mount(tester);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    await tester.pumpAndSettle();
    expect(harness.container.read(sessionProvider), isNull);
    expect(find.byType(AppSidebar), findsNothing);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(find.byType(LockScreen), findsOneWidget);
    expect(find.byType(MobileSectionBar), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets(
    'checkout hides the shell and close restores Billing navigation',
    (tester) async {
      final previous = WebViewPlatform.instance;
      WebViewPlatform.instance = FakeWebViewPlatform();
      addTearDown(() {
        if (previous != null) WebViewPlatform.instance = previous;
      });
      await harness.mount(tester);
      harness.router.go('/upgrade');
      await tester.pumpAndSettle();
      expect(find.byType(MobileSectionBar), findsNothing);
      expect(find.byTooltip('Open menu'), findsNothing);
      await tester.tap(find.byTooltip('Close checkout'));
      await tester.pumpAndSettle();
      expect(harness.router.state.uri.path, '/billing');
      expect(find.byType(MobileSectionBar), findsOneWidget);
      expect(find.byTooltip('Open menu'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
