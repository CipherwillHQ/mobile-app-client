// Substitutes the native WebView for wrapper and authentication bridge tests.
// Owns loading, JavaScript delivery and deterministic history.
// Does not load remote pages or run Firebase JavaScript.
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
  final scripts = <String>[];
  JavaScriptChannelParams? channel;
  final channels = <String, JavaScriptChannelParams>{};
  JavaScriptMode? mode;
  late FakeNavigationDelegate navigation;
  String? url;
  bool backAvailable = false;
  int backCalls = 0;
  FakeWebViewController(super.params) : super.implementation();
  @override
  Future<void> setJavaScriptMode(JavaScriptMode javaScriptMode) async {
    mode = javaScriptMode;
  }

  @override
  Future<void> addJavaScriptChannel(
    JavaScriptChannelParams javaScriptChannelParams,
  ) async {
    channels[javaScriptChannelParams.name] = javaScriptChannelParams;
    if (javaScriptChannelParams.name == 'CipherwillAuth') {
      channel = javaScriptChannelParams;
    }
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
    url = params.uri.toString();
    navigation.changed?.call(UrlChange(url: url));
    navigation.progress?.call(100);
    navigation.finished?.call(url!);
  }

  @override
  Future<String?> currentUrl() async => url;
  @override
  Future<void> setOnJavaScriptConfirmDialog(
    Future<bool> Function(JavaScriptConfirmDialogRequest)
    onJavaScriptConfirmDialog,
  ) async {}
  @override
  Future<void> runJavaScript(String javaScript) async {
    scripts.add(javaScript);
  }

  @override
  Future<bool> canGoBack() async => backAvailable;
  @override
  Future<void> goBack() async {
    backCalls++;
    backAvailable = false;
    navigation.changed?.call(UrlChange(url: url));
  }

  void send(String payload) =>
      channel!.onMessageReceived(JavaScriptMessage(message: payload));
}

class FakeWebViewWidget extends PlatformWebViewWidget {
  FakeWebViewWidget(super.params) : super.implementation();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Cipherwill web app'));
}
