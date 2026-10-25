// Protects native back navigation and notifies web features about app visibility.
// Owns leave confirmations, WebView history and native lifecycle delivery.
// Does not save notes or manage authentication.
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_dialogs.dart';

class MobileBackGuard extends StatefulWidget {
  final bool dirty;
  final bool canGoBack;
  final WebViewController? controller;
  final Widget child;
  const MobileBackGuard({
    super.key,
    required this.dirty,
    required this.canGoBack,
    required this.controller,
    required this.child,
  });
  @override
  State<MobileBackGuard> createState() => _MobileBackGuardState();
}

class _MobileBackGuardState extends State<MobileBackGuard>
    with WidgetsBindingObserver {
  bool busy = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.resumed) {
      final event = state == AppLifecycleState.paused
          ? 'background'
          : 'foreground';
      unawaited(
        widget.controller?.runJavaScript(
          'if (window.location.origin === "https://cipherwill.com") {'
          'window.dispatchEvent(new Event("cipherwill:$event"));}',
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> back(bool didPop, Object? result) async {
    if (didPop || busy) return;
    busy = true;
    try {
      if (widget.dirty &&
          !await confirmWebViewNavigation(
            context,
            'Your latest changes have not finished saving. Leave anyway?',
          )) {
        return;
      }
      if (!mounted) return;
      if (widget.canGoBack) {
        await widget.controller?.goBack();
      } else {
        await SystemNavigator.pop();
      }
    } finally {
      busy = false;
    }
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: !widget.canGoBack && !widget.dirty,
    onPopInvokedWithResult: back,
    child: widget.child,
  );
}
