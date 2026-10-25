// Verifies native sessions are sent only to the trusted account-bound WebView.
// Owns origin checks, payload shape, malformed messages and handoff races.
// Does not contact Firebase or instantiate native browser controls.
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'firebase_session.dart';
import 'mobile_auth_bridge.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late FakeAuth auth;
  late FakeWebViewPlatform platform;
  late WebViewController web;
  setUp(() {
    final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
    platform = FakeWebViewPlatform();
    WebViewPlatform.instance = platform;
    addTearDown(() => WebViewPlatform.instance = previous);
    auth = FakeAuth();
    addTearDown(auth.dispose);
    web = WebViewController();
    platform.controllers.single.url = 'https://cipherwill.com/app';
  });

  test(
    'session payload contains only the native identity and short-lived ID token',
    () async {
      final session = await firebaseSession(auth.currentUser!);
      expect(session['uid'], 'firebase_account');
      expect(session, {'uid': 'firebase_account', 'idToken': 'test-id-token'});
      final bridge = MobileAuthBridge(web, auth, auth.currentUser!);
      await bridge.receive('{"type":"session","id":7}');
      final script = platform.controllers.single.scripts.single;
      expect(
        script,
        contains('window.location.origin === "https://cipherwill.com"'),
      );
      expect(script, contains('CipherwillAuthResponse?.(7,'));
      expect(script, contains('"uid":"firebase_account"'));
    },
  );

  test(
    'lookalike, external and insecure origins never receive tokens or logout',
    () async {
      final bridge = MobileAuthBridge(web, auth, auth.currentUser!);
      for (final url in [
        'https://cipherwill.com.attacker.test/app',
        'http://cipherwill.com/app',
        'https://cipherwill.com:444/app',
        'https://other.test/app',
      ]) {
        platform.controllers.single.url = url;
        await bridge.receive('{"type":"session","id":1}');
        await bridge.receive('{"type":"logout","id":2}');
      }
      expect(platform.controllers.single.scripts, isEmpty);
      expect(auth.signOuts, 0);
    },
  );

  test(
    'a different account cannot receive an old session or be logged out by it',
    () async {
      final bridge = MobileAuthBridge(web, auth, auth.currentUser!);
      auth.user = FakeUser('new-account');
      await bridge.receive('{"type":"session","id":1}');
      await bridge.receive('{"type":"logout","id":2}');
      expect(platform.controllers.single.scripts, isEmpty);
      expect(auth.signOuts, 0);
    },
  );

  test(
    'account switching during token retrieval discards the old handoff',
    () async {
      final pending = Completer<IdTokenResult>();
      auth.user = FakeUser('old-account', pendingToken: pending.future);
      final bridge = MobileAuthBridge(web, auth, auth.currentUser!);
      final handoff = bridge.receive('{"type":"session","id":1}');
      await Future<void>.delayed(Duration.zero);
      auth.user = FakeUser('new-account');
      pending.complete(FakeTokenResult());
      await handoff;
      expect(platform.controllers.single.scripts, isEmpty);
    },
  );

  test('unknown and malformed messages do not expose authentication', () async {
    final bridge = MobileAuthBridge(web, auth, auth.currentUser!);
    for (final message in [
      'invalid',
      'null',
      '{"type":"session","id":"1"}',
      '{"type":"unknown","id":1}',
    ]) {
      await bridge.receive(message);
    }
    expect(platform.controllers.single.scripts, isEmpty);
  });
}
