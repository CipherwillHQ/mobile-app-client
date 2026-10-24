// Keeps the update bar across authentication, owner and executor routes.
// Owns startup/foreground checks and draft-aware update requests.
// Does not suspend vault locking during native store handoffs.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/ui/app_notice.dart';
import '../../shared/ui/page_exit_guard.dart';
import 'update_controller.dart';
import 'update_layout.dart';

class AppUpdateHost extends ConsumerStatefulWidget {
  final Widget child;
  const AppUpdateHost({super.key, required this.child});
  @override
  ConsumerState<AppUpdateHost> createState() => _AppUpdateHostState();
}

class _AppUpdateHostState extends ConsumerState<AppUpdateHost>
    with WidgetsBindingObserver {
  final exits = PageExitRegistry();
  late final Timer timer;
  bool foreground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    timer = Timer.periodic(UpdateController.checkInterval, (_) {
      if (foreground) unawaited(ref.read(appUpdateProvider.notifier).check());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(ref.read(appUpdateProvider.notifier).check());
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    foreground = state == AppLifecycleState.resumed;
    if (foreground) {
      unawaited(
        ref
            .read(appUpdateProvider.notifier)
            .check(force: ref.read(appUpdateProvider).available != null),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> update() async {
    // Commit input-driven guard changes before inspecting this frame's drafts.
    await WidgetsBinding.instance.endOfFrame;
    if (!mounted) return;
    if (exits.blocked) {
      showNotice(context, 'Save your changes before updating.');
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    if (!await ref.read(appUpdateProvider.notifier).update() && mounted) {
      showNotice(
        context,
        'Unable to open the update. Please try again.',
        error: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appUpdateProvider);
    return PageExitScope(
      registry: exits,
      child: UpdateLayout(
        visible: state.available != null,
        busy: state.busy,
        onUpdate: update,
        child: widget.child,
      ),
    );
  }
}
