// Connects a page's pull gesture to its active paginated metadata lists.
// Owns refresh callback lifetimes without retaining lists across routes.
// Does not cache decrypted data or change pagination contracts.
import 'package:flutter/material.dart';

class PageRefreshScope extends InheritedWidget {
  final Set<Future<void> Function()> callbacks;
  const PageRefreshScope({
    super.key,
    required this.callbacks,
    required super.child,
  });
  static PageRefreshScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PageRefreshScope>();
  @override
  bool updateShouldNotify(PageRefreshScope oldWidget) =>
      callbacks != oldWidget.callbacks;
}

class PageRefresh extends StatefulWidget {
  final Widget child;
  const PageRefresh({super.key, required this.child});
  @override
  State<PageRefresh> createState() => _PageRefreshState();
}

class _PageRefreshState extends State<PageRefresh> {
  final callbacks = <Future<void> Function()>{};
  Future<void> refresh() =>
      Future.wait(callbacks.toList().map((callback) => callback()));
  @override
  void dispose() {
    callbacks.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageRefreshScope(
    callbacks: callbacks,
    child: RefreshIndicator(
      onRefresh: refresh,
      notificationPredicate: (notification) =>
          callbacks.isNotEmpty && notification.depth == 0,
      child: widget.child,
    ),
  );
}
