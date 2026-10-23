// Displays action feedback above navigation and keeps it through route changes.
// Owns the app notification scope, dismissal timer and accessible toast.
// Does not log errors, persist messages or alter account state.
import 'dart:async';
import 'package:flutter/material.dart';

class NoticeScope extends InheritedWidget {
  final void Function(String, bool) show;
  const NoticeScope({super.key, required this.show, required super.child});
  static NoticeScope? maybeOf(BuildContext context) =>
      context.getInheritedWidgetOfExactType<NoticeScope>();
  @override
  bool updateShouldNotify(NoticeScope oldWidget) => false;
}

void showNotice(BuildContext context, String message, {bool error = false}) {
  final scope = NoticeScope.maybeOf(context);
  if (scope != null) {
    scope.show(message, error);
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class AppNoticeHost extends StatefulWidget {
  final Widget child;
  const AppNoticeHost({super.key, required this.child});
  @override
  State<AppNoticeHost> createState() => _AppNoticeHostState();
}

class _AppNoticeHostState extends State<AppNoticeHost> {
  Timer? timer;
  String? message;
  bool error = false;
  void dismiss() {
    timer?.cancel();
    if (mounted) setState(() => message = null);
  }

  void show(String value, bool failed) {
    if (!mounted) return;
    timer?.cancel();
    setState(() {
      message = value;
      error = failed;
    });
    timer = Timer(const Duration(seconds: 6), dismiss);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => NoticeScope(
    show: show,
    child: Stack(
      children: [
        widget.child,
        if (message != null)
          Positioned(
            top: 0,
            left: 12,
            right: 12,
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Semantics(
                    liveRegion: true,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.surface,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              error
                                  ? Icons.error_outline
                                  : Icons.check_circle_outline,
                              color: error
                                  ? Theme.of(context).colorScheme.error
                                  : Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                message!,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Semantics(
                              label: 'Dismiss notification',
                              button: true,
                              child: IconButton(
                                onPressed: dismiss,
                                icon: const Icon(Icons.close, size: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
