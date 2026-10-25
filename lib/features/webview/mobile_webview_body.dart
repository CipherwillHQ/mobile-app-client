// Renders loading, error recovery and the native-safe-area WebView surface.
// Owns wrapper presentation and retry/sign-out controls.
// Does not handle authentication messages or platform capabilities.
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileWebViewBody extends StatelessWidget {
  final WebViewController? controller;
  final String? error;
  final int progress;
  final VoidCallback retry;
  final VoidCallback logout;
  const MobileWebViewBody({
    super.key,
    required this.controller,
    required this.error,
    required this.progress,
    required this.retry,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: error != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(error!),
                    FilledButton(onPressed: retry, child: const Text('Retry')),
                    TextButton(
                      onPressed: logout,
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                if (progress < 100)
                  LinearProgressIndicator(
                    value: progress == 0 ? null : progress / 100,
                  ),
                if (controller != null)
                  Expanded(child: WebViewWidget(controller: controller!)),
              ],
            ),
    ),
  );
}
