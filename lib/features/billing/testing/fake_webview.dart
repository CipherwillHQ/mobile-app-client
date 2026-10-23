// Provides a native-WebView substitute for routed Flutter regression tests.
// Owns request/channel capture and a deterministic platform widget.
// Does not load public checkout pages or handle real payments.
import 'package:flutter/material.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'fake_navigation_delegate.dart';

class FakeWebViewPlatform extends WebViewPlatform {
  final controllers = <FakeWebViewController>[];
  @override
  PlatformWebViewController createPlatformWebViewController(
    PlatformWebViewControllerCreationParams params,
  ) {
    final controller = FakeWebViewController(params);
    controllers.add(controller);
    return controller;
  }

  @override
  PlatformNavigationDelegate createPlatformNavigationDelegate(
    PlatformNavigationDelegateCreationParams params,
  ) => FakeNavigationDelegate(params);
  @override
  PlatformWebViewWidget createPlatformWebViewWidget(
    PlatformWebViewWidgetCreationParams params,
  ) => FakeWebViewWidget(params);
}

class FakeWebViewController extends PlatformWebViewController {
  final events = <String>[];
  final requests = <LoadRequestParams>[];
  JavaScriptChannelParams? channel;
  JavaScriptMode? mode;
  late FakeNavigationDelegate navigation;
  FakeWebViewController(super.params) : super.implementation();
  @override
  Future<void> setJavaScriptMode(JavaScriptMode javaScriptMode) async {
    mode = javaScriptMode;
  }

  @override
  Future<void> addJavaScriptChannel(
    JavaScriptChannelParams javaScriptChannelParams,
  ) async {
    channel = javaScriptChannelParams;
    events.add('channel');
  }

  @override
  Future<void> setPlatformNavigationDelegate(
    PlatformNavigationDelegate handler,
  ) async {
    navigation = handler as FakeNavigationDelegate;
  }

  @override
  Future<void> loadRequest(LoadRequestParams params) async {
    events.add('load');
    requests.add(params);
    navigation.started?.call(params.uri.toString());
    navigation.progress?.call(100);
  }

  void send(String payload) =>
      channel!.onMessageReceived(JavaScriptMessage(message: payload));
}

class FakeWebViewWidget extends PlatformWebViewWidget {
  FakeWebViewWidget(super.params) : super.implementation();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Secure web checkout'));
}
