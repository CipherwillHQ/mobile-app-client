// Presents the backend guidance catalog as native mobile steps.
// Owns progress, deferral, resume and retry controls.
// Does not persist plaintext conversations or duplicate eligibility rules.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/security/temp_cleanup.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/loading_panel.dart';
import '../../shared/ui/section_heading.dart';
import '../security/session_controller.dart';
import 'guidance_session.dart';
import 'guidance_step_panel.dart';

class GuidanceScreen extends ConsumerStatefulWidget {
  const GuidanceScreen({super.key});
  @override
  ConsumerState<GuidanceScreen> createState() => _GuidanceScreenState();
}

class _GuidanceScreenState extends ConsumerState<GuidanceScreen> {
  GuidanceSession? session;
  bool busy = true;
  String? error;
  dynamic answer;
  String? inputId;
  @override
  void initState() {
    super.initState();
    session = GuidanceSession(
      ref.read(apiProvider),
      ref.read(sessionProvider.notifier).lease(),
    );
    run(() => session!.load());
  }

  @override
  void dispose() {
    session?.clear();
    unawaited(cleanupPickedFiles());
    answer = null;
    super.dispose();
  }

  Future<void> run(Future<void> Function() action) async {
    setState(() {
      busy = true;
      error = null;
    });
    try {
      await action();
      if (mounted) setState(() => busy = false);
    } catch (e) {
      if (mounted) {
        setState(() {
          busy = false;
          error = e.toString();
        });
      }
    }
  }

  Future<void> advance() => run(
    () => session!.flow == null
        ? session!.load()
        : session!.advance(
            answer: answer,
            submitted: session!.step?['input'] != null,
          ),
  );
  @override
  Widget build(BuildContext context) {
    final s = session!;
    final flow = s.flow;
    final step = s.step;
    if (inputId != step?['id']) {
      inputId = step?['id'];
      answer = null;
    }
    final deferred = jsonList(
      s.account['deferrals'],
    ).where((choice) => choice['dismissed'] != true).toList();
    return PageFrame(
      title: 'Your guide',
      subtitle: 'Thoughtful steps towards a prepared digital legacy.',
      children: [
        if (busy && flow == null) const LoadingPanel(),
        if (error != null)
          ErrorPanel(message: error!, retry: busy ? null : advance),
        if (flow == null && !busy && error == null)
          const EmptyState(
            title: 'You’re up to date',
            message:
                'Your available guidance is complete. You can keep editing your vault and planning settings.',
            icon: Icons.check_circle_outline_rounded,
          ),
        if (flow != null) ...[
          if (busy) const LinearProgressIndicator(),
          GuidanceStepPanel(
            flow: flow,
            step: step,
            scope: s.scope,
            complete: s.completion != null,
            completedSteps: s.visited.length,
            busy: busy,
            changed: (value) => answer = value,
            advance: advance,
          ),
          if (s.completion == null && step?['input']?['skippable'] == true)
            TextButton(
              onPressed: busy
                  ? null
                  : () => run(() => s.advance(answer: null, submitted: true)),
              child: const Text('Skip this question'),
            ),
          if (s.completion == null && flow['skippable'] == true)
            TextButton(
              onPressed: busy ? null : () => run(s.defer),
              child: const Text('Do this later'),
            ),
        ],
        if (deferred.isNotEmpty) const SectionHeading('Saved for later'),
        for (final choice in deferred)
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmark_border_rounded),
              title: Text(
                s.catalog
                        .where((entry) => entry['id'] == choice['objectiveId'])
                        .firstOrNull?['title'] ??
                    choice['objectiveId'],
              ),
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: busy
                  ? null
                  : () => run(() => s.resume(choice['objectiveId'])),
            ),
          ),
      ],
    );
  }
}
