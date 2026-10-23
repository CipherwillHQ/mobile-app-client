// Presents the backend guidance catalog as native mobile steps
// Owns progress, deferral, resume and retry controls.
// Does not persist plaintext conversations.

import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/security/temp_cleanup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../security/session_controller.dart';
import 'guidance_session.dart';
import 'guidance_input.dart';
import 'rules.dart';

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
      if (mounted) {
        setState(() => busy = false);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          busy = false;
          error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = session!;
    final flow = s.flow;
    final step = s.step;
    if (inputId != step?['id']) {
      inputId = step?['id'];
      answer = null;
    }
    return PageFrame(
      title: 'Your guide',
      children: [
        if (busy) const LinearProgressIndicator(),
        if (error != null) ...[
          Text(error!),
          TextButton(
            onPressed: busy
                ? null
                : () => run(
                    () => flow == null
                        ? s.load()
                        : s.advance(
                            answer: answer,
                            submitted: step?['input'] != null,
                          ),
                  ),
            child: const Text('Retry'),
          ),
        ],
        if (flow == null && !busy)
          const Text(
            'Your available guidance is complete. You can continue editing your vault and planning settings.',
          ),
        if (flow != null) ...[
          Text(flow['title'], style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          if (s.completion != null) ...[
            Text(guidanceText(flow['completion']['title'], s.scope)),
            Text(guidanceText(flow['completion']['subtext'], s.scope)),
          ] else if (step != null) ...[
            Text(
              guidanceText(step['title'], s.scope),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(guidanceText(step['subtext'], s.scope)),
            const SizedBox(height: 20),
            if (step['input'] != null)
              GuidanceInput(
                key: ValueKey(step['id']),
                spec: asJson(step['input']),
                changed: (value) => answer = value,
              ),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: busy
                ? null
                : () => run(
                    () => s.advance(
                      answer: answer,
                      submitted: step?['input'] != null,
                    ),
                  ),
            child: Text(
              s.completion != null
                  ? 'Continue'
                  : step?['continueLabel'] ?? 'Continue',
            ),
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
        for (final choice in jsonList(s.account['deferrals']))
          if (choice['dismissed'] != true)
            TextButton(
              onPressed: busy
                  ? null
                  : () => run(() => s.resume(choice['objectiveId'])),
              child: Text('Resume ' + choice['objectiveId']),
            ),
      ],
    );
  }
}
