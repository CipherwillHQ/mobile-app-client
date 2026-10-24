// Validates each selected-will route before showing its navigation or contents.
// Owns online rechecks on resume, refresh, route change and expiry.
// Does not decrypt records or preserve a hidden authorized screen.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/loading_panel.dart';
import '../../shared/ui/page_frame.dart';
import '../security/session_controller.dart';
import 'access_status.dart';
import 'executor_providers.dart';
import 'executor_repository.dart';
import 'unavailable_access.dart';

class ExecutorAccessGate extends ConsumerStatefulWidget {
  final String id;
  final String location;
  final Widget Function(Json, Future<void> Function()) builder;
  const ExecutorAccessGate({
    super.key,
    required this.id,
    required this.location,
    required this.builder,
  });
  @override
  ConsumerState<ExecutorAccessGate> createState() => _ExecutorAccessGateState();
}

class _ExecutorAccessGateState extends ConsumerState<ExecutorAccessGate>
    with WidgetsBindingObserver {
  Json? grant;
  Object? error;
  Timer? expiry;
  int revision = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(check());
  }

  @override
  void didUpdateWidget(ExecutorAccessGate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.location != widget.location || oldWidget.id != widget.id) {
      unawaited(check());
    }
  }

  Future<void> check() async {
    final current = ++revision;
    expiry?.cancel();
    setState(() {
      grant = null;
      error = null;
    });
    try {
      final value = await ExecutorRepository(
        ref.read(apiProvider),
        ref.read(sessionProvider.notifier).lease(),
      ).access(widget.id);
      if (!mounted || revision != current) return;
      ref.invalidate(grantedCountsProvider(widget.id));
      setState(() => grant = value);
      expiry = Timer(
        accessDeadline(value)!.difference(DateTime.now()),
        () => unawaited(check()),
      );
    } catch (failure) {
      if (!mounted || revision != current) return;
      if (returnToSharedWills(context, failure)) return;
      setState(() => error = failure);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) unawaited(check());
  }

  @override
  void dispose() {
    revision++;
    expiry?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    grant = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => grant != null
      ? widget.builder(grant!, check)
      : PageFrame(
          title: 'Will access',
          focused: true,
          footer: OutlinedButton(
            onPressed: () => context.go('/executor'),
            child: const Text('Shared wills'),
          ),
          children: [
            if (error != null)
              ErrorPanel(
                message: 'Unable to check will access. Please retry.',
                retry: check,
              )
            else
              const LoadingPanel(),
          ],
        );
}
