// Embeds the existing public checkout using webview_flutter.
// Owns the channel, trusted navigation and recoverable page-loading errors.
// Does not inject account tokens, expose vault contents or confirm Premium.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../shared/ui/error_panel.dart';
import 'upgrade_contract.dart';

class UpgradeWebView extends StatefulWidget {
  final Uri uri;
  final ValueChanged<UpgradeResult> onResult;
  final VoidCallback onRetry;
  const UpgradeWebView({
    super.key,
    required this.uri,
    required this.onResult,
    required this.onRetry,
  });
  @override
  State<UpgradeWebView> createState() => _UpgradeWebViewState();
}

class _UpgradeWebViewState extends State<UpgradeWebView> {
  WebViewController? controller;
  bool resultHandled = false;
  bool trustedPage = false;
  int progress = 0;
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
        'CipherwillUpgrade',
        onMessageReceived: receive,
      );
      await web.setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: navigate,
          onPageStarted: pageStarted,
          onProgress: updateProgress,
          onWebResourceError: resourceError,
          onHttpError: httpError,
        ),
      );
      if (!mounted) return;
      setState(() {
        controller = web;
        trustedPage = isUpgradePage(widget.uri);
      });
      await web.loadRequest(widget.uri);
    } catch (_) {
      if (mounted) {
        setState(
          () => error =
              'Unable to open checkout. Check your connection and retry.',
        );
      }
    }
  }

  void receive(JavaScriptMessage event) {
    if (!mounted || resultHandled || !trustedPage || error != null) return;
    final result = UpgradeResult.parse(event.message);
    if (result == null) return;
    resultHandled = true;
    widget.onResult(result);
  }

  Future<NavigationDecision> navigate(NavigationRequest request) async {
    if (!mounted) return NavigationDecision.prevent;
    final uri = Uri.tryParse(request.url);
    if (uri == null || uri.scheme != 'https') return NavigationDecision.prevent;
    if (!request.isMainFrame || isUpgradePage(uri)) {
      return NavigationDecision.navigate;
    }
    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw StateError('Unable to open link.');
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open this link. Please try again.'),
          ),
        );
      }
    }
    return NavigationDecision.prevent;
  }

  void pageStarted(String url) {
    if (mounted) setState(() => trustedPage = isUpgradePage(Uri.parse(url)));
  }

  void updateProgress(int value) {
    if (mounted) setState(() => progress = value);
  }

  void resourceError(WebResourceError failure) {
    if (failure.isForMainFrame == false || !mounted) return;
    setState(
      () => error =
          'The checkout page could not load. Check your connection and retry.',
    );
  }

  void httpError(HttpResponseError failure) {
    final uri = failure.request?.uri;
    if (mounted && uri != null && isUpgradePage(uri)) {
      setState(
        () => error = 'Checkout is unavailable right now. Please try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) => error != null
      ? SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: ErrorPanel(message: error!, retry: widget.onRetry),
        )
      : Column(
          children: [
            if (progress < 100)
              LinearProgressIndicator(
                value: progress == 0 ? null : progress / 100,
                semanticsLabel: 'Loading secure checkout',
              ),
            if (controller != null)
              Expanded(child: WebViewWidget(controller: controller!)),
          ],
        );
}
