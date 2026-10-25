// Verifies token-exchange failures surface native session recovery.
// Owns bridge-error feedback and WebView retry behavior.
// Does not contact the backend or authenticate real accounts.
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/auth_harness.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'mobile_webview.dart';

void main() {
  testWidgets('web authentication failure offers Retry and Sign out', (
    tester,
  ) async {
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    final platform = FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    final auth = FakeAuth();
    addTearDown(auth.dispose);
    await tester.pumpWidget(
      AuthHarness(
        screen: MobileWebView(auth: auth, user: auth.currentUser!),
      ),
    );
    await tester.pumpAndSettle();
    platform.controllers.single.send('{"type":"error","id":0}');
    await tester.pumpAndSettle();
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('Sign out'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pumpAndSettle();
    expect(platform.controllers, hasLength(2));
    expect(find.text('Cipherwill web app'), findsOneWidget);
  });
}
