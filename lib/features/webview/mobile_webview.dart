// Displays cipherwill.com/app after native authentication.
// Owns loading, navigation, authentication delivery and native safe-area insets.
// Does not implement application features or expose credentials through URLs.
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../shared/cipherwill_links.dart';
import '../../shared/ui/external_link.dart';
import 'mobile_auth_bridge.dart';
import 'mobile_back_guard.dart';
import 'mobile_device_bridge.dart';
import 'mobile_webview_body.dart';
import 'webview_dialogs.dart';
import 'webview_links.dart';
import 'webview_platform.dart';

class MobileWebView extends StatefulWidget {
  final FirebaseAuth auth;
  final User user;
  final Uri? uri;
  const MobileWebView({
    super.key,
    required this.auth,
    required this.user,
    this.uri,
  });
  @override
  State<MobileWebView> createState() => _MobileWebViewState();
}

class _MobileWebViewState extends State<MobileWebView> {
  WebViewController? controller;
  MobileAuthBridge? bridge;
  MobileDeviceBridge? device;
  String? error;
  int progress = 0;
  bool canGoBack = false;
  bool dirty = false;
  @override
  void initState() {
    super.initState();
    unawaited(load());
  }

  Future<void> load() async {
    try {
      final web = WebViewController();
      await web.setJavaScriptMode(JavaScriptMode.unrestricted);
      final passkeys = await configureWebViewPlatform(web);
      await web.setOnJavaScriptConfirmDialog(confirmJavaScript);
      await web.addJavaScriptChannel(
        'CipherwillAuth',
        onMessageReceived: receive,
      );
      await web.addJavaScriptChannel(
        'CipherwillDevice',
        onMessageReceived: receiveDevice,
      );
      await web.setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: navigate,
          onProgress: updateProgress,
          onUrlChange: updateBack,
          onPageFinished: updateWebInsets,
          onWebResourceError: resourceError,
        ),
      );
      if (!mounted) return;
      await device?.download.dispose();
      setState(() {
        controller = web;
        bridge = MobileAuthBridge(web, widget.auth, widget.user);
        device = MobileDeviceBridge(
          web,
          widget.auth,
          widget.user.uid,
          passkeys,
          context,
          updateDirty,
        );
        error = null;
        progress = 0;
        canGoBack = false;
        dirty = false;
      });
      final uri = widget.uri ?? Uri.parse(CipherwillLinks.webApp);
      final upgrade = isExternalUpgrade(uri);
      await web.loadRequest(upgrade ? Uri.parse(CipherwillLinks.webApp) : uri);
      if (upgrade && mounted) await openExternalLink(context, uri.toString());
    } catch (_) {
      if (mounted) {
        setState(
          () => error =
              'Unable to open Cipherwill. Check your connection and retry.',
        );
      }
    }
  }

  Future<void> receiveDevice(JavaScriptMessage message) async {
    try {
      await device?.receive(message.message);
    } catch (_) {
      /* Ignore malformed device messages. */
    }
  }

  void updateDirty(bool value) {
    if (mounted) setState(() => dirty = value);
  }

  Future<bool> confirmJavaScript(
    JavaScriptConfirmDialogRequest request,
  ) async =>
      mounted && await confirmWebViewNavigation(context, request.message);

  @override
  void dispose() {
    unawaited(device?.download.dispose());
    super.dispose();
  }

  Future<void> receive(JavaScriptMessage message) async {
    try {
      await bridge?.receive(message.message);
    } catch (_) {
      if (mounted) {
        setState(
          () => error = 'Unable to load your session. Retry or sign in again.',
        );
      }
    }
  }

  Future<NavigationDecision> navigate(NavigationRequest request) async {
    final uri = Uri.tryParse(request.url);
    if (uri == null) return NavigationDecision.prevent;
    if (!request.isMainFrame ||
        (isCipherwillPage(uri) && !isExternalUpgrade(uri))) {
      return NavigationDecision.navigate;
    }
    if (mounted && {'https', 'http', 'mailto', 'tel'}.contains(uri.scheme)) {
      await openExternalLink(context, uri.toString());
    }
    return NavigationDecision.prevent;
  }

  void updateProgress(int value) {
    if (mounted) setState(() => progress = value);
  }

  Future<void> updateWebInsets(String url) async {
    if (!mounted || !isCipherwillPage(Uri.parse(url))) return;
    await controller?.runJavaScript(
      'if (window.location.origin === "https://cipherwill.com") {'
      'document.documentElement.style.setProperty("--cw-safe-top", "0px");'
      'document.documentElement.style.setProperty("--cw-safe-bottom", "0px");}',
    );
  }

  Future<void> updateBack(UrlChange change) async {
    final back = await controller?.canGoBack() ?? false;
    if (mounted) setState(() => canGoBack = back);
  }

  void resourceError(WebResourceError failure) {
    if (mounted && failure.isForMainFrame != false) {
      setState(
        () => error =
            'Cipherwill could not load. Check your connection and retry.',
      );
    }
  }

  @override
  Widget build(BuildContext context) => MobileBackGuard(
    dirty: dirty,
    canGoBack: canGoBack,
    controller: controller,
    child: MobileWebViewBody(
      controller: controller,
      error: error,
      progress: progress,
      retry: load,
      logout: widget.auth.signOut,
    ),
  );
}
