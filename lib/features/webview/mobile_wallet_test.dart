// Verifies native wallet handoff uses only the active trusted account.
// Owns launch completion, missing-wallet and rejected-link regressions.
// Does not open MetaMask or sign requests on a real device.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'mobile_device_bridge.dart';

void main() {
  testWidgets(
    'wallet requests validate links, report failures and preserve the web page',
    (tester) async {
      final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
      final platform = FakeWebViewPlatform();
      WebViewPlatform.instance = platform;
      addTearDown(() => WebViewPlatform.instance = previous);
      final auth = FakeAuth();
      addTearDown(auth.dispose);
      final web = WebViewController();
      final native = platform.controllers.single;
      native.url = 'https://cipherwill.com/app/factors';
      final launches = <MethodCall>[];
      var installed = true;
      const launcher = MethodChannel('plugins.flutter.io/url_launcher');
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(launcher, (
        call,
      ) async {
        launches.add(call);
        return installed;
      });
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          launcher,
          null,
        ),
      );
      late MobileDeviceBridge bridge;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              bridge = MobileDeviceBridge(
                web,
                auth,
                auth.currentUser!.uid,
                true,
                context,
                (_) {},
              );
              return const SizedBox();
            },
          ),
        ),
      );
      const request =
          '{"type":"wallet-open","id":1,"url":"metamask://connect?channelId=test&pubkey=public"}';
      await bridge.receive(request);
      expect(
        launches.single.arguments['url'],
        'metamask://connect?channelId=test&pubkey=public',
      );
      expect(launches.single.arguments['useWebView'], false);
      expect(native.url, 'https://cipherwill.com/app/factors');
      expect(native.requests, isEmpty);
      expect(native.scripts.single, contains('"error":null'));

      installed = false;
      await bridge.receive(request);
      expect(native.scripts.last, contains('Install or update MetaMask'));
      final launchCount = launches.length;
      for (final url in [
        'javascript:alert(1)',
        'intent://connect',
        'metamask://other',
        'metamask://connect/other',
        'metamask://owner@connect',
        'metamask://connect:9999',
        'https://metamask.app.link.attacker.test/connect',
      ]) {
        await bridge.receive('{"type":"wallet-open","id":3,"url":"$url"}');
        expect(launches.length, launchCount, reason: url);
        expect(native.scripts.last, contains('"error":"'));
      }
      native.scripts.clear();
      native.url = 'https://other.test';
      await bridge.receive(request);
      expect(launches.length, launchCount);
      expect(native.scripts, isEmpty);
      native.url = 'https://cipherwill.com/app';
      auth.user = FakeUser('different-account');
      await bridge.receive(request);
      expect(launches.length, launchCount);
      expect(native.scripts, isEmpty);
    },
  );
}
