// Records native URL-launch requests without opening a browser in tests.
// Owns method-channel setup and cleanup for link interaction regressions.
// Does not fetch URLs or register production platform implementations.
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeUrlLauncher {
  final TestDefaultBinaryMessenger messenger;
  final calls = <MethodCall>[];
  final channel = const MethodChannel('plugins.flutter.io/url_launcher');
  FakeUrlLauncher(this.messenger) {
    messenger.setMockMethodCallHandler(channel, launch);
  }
  Future<bool> launch(MethodCall call) async {
    calls.add(call);
    return true;
  }

  void dispose() => messenger.setMockMethodCallHandler(channel, null);
}
