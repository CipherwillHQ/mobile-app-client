// Hosts Tawk inside the native support screen with recoverable loading failures.
// Owns widget readiness, external links and unloading the chat on close/lock.
// Does not send messages or expose account credentials through a JS bridge.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/external_link.dart';
import 'support_chat_document.dart';

class SupportChatWebView extends StatefulWidget {
  final Json account;
  final VoidCallback onRetry, onClose;
  const SupportChatWebView({
    super.key,
    required this.account,
    required this.onRetry,
    required this.onClose,
  });
  @override
  State<SupportChatWebView> createState() => _SupportChatWebViewState();
}

class _SupportChatWebViewState extends State<SupportChatWebView> {
  WebViewController? controller;
  Timer? timeout;
  bool ready = false;
  String? error;
  @override
  void initState() {
    super.initState();
    unawaited(load());
  }

  Future<void> load() async {
    try {
      final web = WebViewController();
      await web.setJavaScriptMode(JavaScriptMode.unrestricted);
      await web.addJavaScriptChannel(
        'CipherwillSupport',
        onMessageReceived: receive,
      );
      await web.setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: navigate,
          onWebResourceError: resourceError,
        ),
      );
      if (!mounted) return;
      await web.setBackgroundColor(Theme.of(context).scaffoldBackgroundColor);
      if (!mounted) return;
      setState(() => controller = web);
      timeout = Timer(const Duration(seconds: 30), failed);
      await web.loadHtmlString(
        supportChatDocument(widget.account),
        baseUrl: supportChatBaseUrl,
      );
    } catch (_) {
      failed();
    }
  }

  void receive(JavaScriptMessage event) {
    if (!mounted || error != null) return;
    switch (event.message) {
      case 'ready':
        timeout?.cancel();
        setState(() => ready = true);
      case 'error':
        failed();
      case 'close':
        if (ready) widget.onClose();
    }
  }

  void failed() {
    timeout?.cancel();
    if (mounted && error == null) {
      setState(
        () => error =
            'Live support could not load. Check your connection and retry.',
      );
      unload();
    }
  }

  void resourceError(WebResourceError failure) {
    if (failure.isForMainFrame == true) failed();
  }

  Future<NavigationDecision> navigate(NavigationRequest request) async {
    if (!mounted) return NavigationDecision.prevent;
    if (request.url == 'about:blank' || request.url == supportChatBaseUrl) {
      return NavigationDecision.navigate;
    }
    final uri = Uri.tryParse(request.url);
    if (uri == null) return NavigationDecision.prevent;
    if (!request.isMainFrame && uri.scheme == 'https') {
      return NavigationDecision.navigate;
    }
    if (['https', 'mailto', 'tel'].contains(uri.scheme)) {
      await openExternalLink(context, request.url);
    }
    return NavigationDecision.prevent;
  }

  void unload() {
    final web = controller;
    if (web != null) {
      unawaited(
        web.loadHtmlString(supportChatBlankDocument).catchError((Object _) {}),
      );
    }
  }

  @override
  void dispose() {
    timeout?.cancel();
    unload();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => error != null
      ? SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: ErrorPanel(message: error!, retry: widget.onRetry),
        )
      : Column(
          children: [
            if (!ready)
              const LinearProgressIndicator(
                semanticsLabel: 'Loading live support',
              ),
            if (controller != null)
              Expanded(child: WebViewWidget(controller: controller!)),
          ],
        );
}
