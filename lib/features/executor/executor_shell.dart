// Frames execution as a separate mobile navigation context.
// Owns its drawer and donor header across text, folders and files.
// Does not bypass the outer account and factor gates.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/navigation_scope.dart';
import '../../core/api/json_values.dart';
import 'executor_access_gate.dart';
import 'executor_access_header.dart';
import 'executor_access_scope.dart';
import 'executor_location.dart';
import 'executor_sidebar.dart';
import 'executor_providers.dart';
import 'unavailable_access.dart';

class ExecutorShell extends StatelessWidget {
  final String location;
  final Widget child;
  const ExecutorShell({super.key, required this.location, required this.child});
  @override
  Widget build(BuildContext context) {
    final id = executorAccessId(location);
    if (id == null) return ExecutorFrame(location: location, child: child);
    return ExecutorAccessGate(
      id: id,
      location: location,
      builder: (grant, refresh) => ExecutorFrame(
        location: location,
        grant: grant,
        refresh: refresh,
        child: child,
      ),
    );
  }
}

class ExecutorFrame extends ConsumerStatefulWidget {
  final String location;
  final Json? grant;
  final Future<void> Function()? refresh;
  final Widget child;
  const ExecutorFrame({
    super.key,
    required this.location,
    this.grant,
    this.refresh,
    required this.child,
  });
  @override
  ConsumerState<ExecutorFrame> createState() => _ExecutorFrameState();
}

class _ExecutorFrameState extends ConsumerState<ExecutorFrame> {
  final scaffold = GlobalKey<ScaffoldState>();
  void openMenu() => scaffold.currentState?.openDrawer();
  @override
  Widget build(BuildContext context) {
    final id = executorAccessId(widget.location);
    if (id != null && widget.grant != null) {
      ref.listen(grantedCountsProvider(id), (_, next) {
        if (!next.hasError) return;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) returnToSharedWills(context, next.error!);
        });
      });
    }
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      drawer: ExecutorSidebar(location: widget.location, grant: widget.grant),
      body: NavigationScope(
        openMenu: openMenu,
        location: widget.location,
        header: widget.grant == null
            ? null
            : ExecutorAccessHeader(
                grant: widget.grant!,
                refresh: widget.refresh,
              ),
        child: widget.grant == null
            ? widget.child
            : ExecutorAccessScope(grant: widget.grant!, child: widget.child),
      ),
    );
  }
}
