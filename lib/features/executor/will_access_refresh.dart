// Refreshes dashboard access metadata on return, resume and pull to refresh.
// Owns refresh registration for owner and received-will widgets.
// Does not retain grants offline or read protected will contents.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/navigation_scope.dart';
import '../../shared/ui/page_refresh.dart';
import 'executor_providers.dart';

class WillAccessRefresh extends ConsumerStatefulWidget {
  final Widget child;
  const WillAccessRefresh({super.key, required this.child});
  @override
  ConsumerState<WillAccessRefresh> createState() => _WillAccessRefreshState();
}

class _WillAccessRefreshState extends ConsumerState<WillAccessRefresh>
    with WidgetsBindingObserver {
  PageRefreshScope? scope;
  String? location;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nextScope = PageRefreshScope.maybeOf(context);
    if (scope != nextScope) {
      scope?.callbacks.remove(refresh);
      scope = nextScope;
      scope?.callbacks.add(refresh);
    }
    final nextLocation = NavigationScope.maybeOf(context)?.location;
    if (location != null &&
        location != nextLocation &&
        ['/home', '/executor'].contains(Uri.parse(nextLocation ?? '').path)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(refresh());
      });
    }
    location = nextLocation;
  }

  Future<void> refresh() async {
    ref.invalidate(receivedWillsProvider);
    ref.invalidate(releasedAccessProvider);
    try {
      await Future.wait([
        ref.read(receivedWillsProvider.future),
        ref.read(releasedAccessProvider.future),
      ]);
    } catch (_) {
      // The access widgets render each failed query with its own retry action.
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed &&
        ModalRoute.of(context)?.isCurrent != false) {
      unawaited(refresh());
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    scope?.callbacks.remove(refresh);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
    customSemanticsActions: {
      const CustomSemanticsAction(label: 'Refresh will access'): refresh,
    },
    child: widget.child,
  );
}
