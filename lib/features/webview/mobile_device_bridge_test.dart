// Verifies the device bridge is restricted to the active trusted account.
// Owns native capability, dirty-state and clipboard message assertions.
// Does not open external pages or use production credentials.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../testing/fake_auth.dart';
import '../../testing/fake_webview.dart';
import 'mobile_device_bridge.dart';

void main() {
  testWidgets(
    'trusted messages expose capabilities and native clipboard completion',
    (tester) async {
      final previous = WebViewPlatform.instance ?? FakeWebViewPlatform();
      final platform = FakeWebViewPlatform();
      WebViewPlatform.instance = platform;
      addTearDown(() => WebViewPlatform.instance = previous);
      final auth = FakeAuth();
      addTearDown(auth.dispose);
      final web = WebViewController();
      final native = platform.controllers.single;
      native.url = 'https://cipherwill.com/app';
      var dirty = false;
      MethodCall? clipboard;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          clipboard = call;
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
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
                (value) => dirty = value,
              );
              return const SizedBox();
            },
          ),
        ),
      );
      await bridge.receive('{"type":"capabilities","id":1}');
      expect(native.scripts.single, contains('"passkeys":true'));
      expect(
        native.scripts.single,
        contains('window.location.origin === "https://cipherwill.com"'),
      );
      await bridge.receive('{"type":"dirty","id":2,"dirty":true}');
      expect(dirty, true);
      await bridge.receive('{"type":"clipboard","id":3,"text":"test text"}');
      expect(clipboard!.method, 'Clipboard.setData');
      expect(clipboard!.arguments, {'text': 'test text'});
      native.scripts.clear();
      native.url = 'https://other.test/app';
      await bridge.receive('{"type":"dirty","id":4,"dirty":false}');
      expect(dirty, true);
      expect(native.scripts, isEmpty);
      native.url = 'https://cipherwill.com/app';
      auth.user = FakeUser('different-account');
      await bridge.receive('{"type":"capabilities","id":5}');
      expect(native.scripts, isEmpty);
    },
  );
}
