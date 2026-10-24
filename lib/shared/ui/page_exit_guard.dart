// Registers pages that must finish a draft or save before a global handoff.
// Owns synchronous blocker registration and disposal within the app scope.
// Does not change Back behavior or save and discard feature data.
import 'package:flutter/widgets.dart';

class PageExitRegistry {
  final Set<Object> blockers = {};
  bool get blocked => blockers.isNotEmpty;
  void register(Object owner, bool blocked) {
    if (blocked) {
      blockers.add(owner);
    } else {
      blockers.remove(owner);
    }
  }
}

class PageExitScope extends InheritedWidget {
  final PageExitRegistry registry;
  const PageExitScope({
    super.key,
    required this.registry,
    required super.child,
  });
  static PageExitRegistry? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PageExitScope>()?.registry;
  @override
  bool updateShouldNotify(PageExitScope oldWidget) =>
      registry != oldWidget.registry;
}

class PageExitGuard extends StatefulWidget {
  final bool canLeave;
  final Widget child;
  const PageExitGuard({super.key, required this.canLeave, required this.child});
  @override
  State<PageExitGuard> createState() => _PageExitGuardState();
}

class _PageExitGuardState extends State<PageExitGuard> {
  PageExitRegistry? registry;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    registry?.register(this, false);
    registry = PageExitScope.maybeOf(context);
    registry?.register(this, !widget.canLeave);
  }

  @override
  void didUpdateWidget(PageExitGuard oldWidget) {
    super.didUpdateWidget(oldWidget);
    registry?.register(this, !widget.canLeave);
  }

  @override
  void dispose() {
    registry?.register(this, false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
