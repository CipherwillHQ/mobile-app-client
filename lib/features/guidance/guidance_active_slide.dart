// Composes the active Guide slide and its web-style progress footer.
// Owns retry, skip, pause and progress presentation.
// Does not execute guidance operations or own draft answers.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import 'guidance_session.dart';
import 'guidance_step_panel.dart';
import 'rules.dart';

class GuidanceActiveSlide extends StatelessWidget {
  final GuidanceSession session;
  final bool busy, introduction;
  final String? error;
  final int displayForMs;
  final ValueChanged<dynamic> changed;
  final dynamic answer;
  final VoidCallback advance, retry, skip, defer, pause;
  const GuidanceActiveSlide({
    super.key,
    required this.session,
    this.answer,
    required this.busy,
    required this.introduction,
    required this.error,
    required this.displayForMs,
    required this.changed,
    required this.advance,
    required this.retry,
    required this.skip,
    required this.defer,
    required this.pause,
  });
  @override
  Widget build(BuildContext context) {
    final flow = session.flow, step = session.step;
    final complete = session.completion != null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (error != null) ...[
          Text(error!, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: busy ? null : retry,
            child: const Text('Retry'),
          ),
        ] else if (flow != null) ...[
          GuidanceStepPanel(
            flow: flow,
            step: step,
            scope: session.scope,
            complete: complete,
            completedSteps: session.visited.length,
            busy: busy,
            introduction: introduction,
            changed: changed,
            answer: answer,
            advance: advance,
          ),
          if (!busy &&
              !complete &&
              !introduction &&
              step?['input']?['skippable'] == true)
            TextButton(
              onPressed: skip,
              child: const Text('Skip this question'),
            ),
          if (!busy && !complete && flow['skippable'] == true)
            TextButton(
              onPressed: defer,
              child: Text(introduction ? 'Skip' : 'Do this later'),
            ),
        ] else
          const Text('Preparing your setup…'),
        const SizedBox(height: 36),
        TextButton(
          onPressed: busy ? null : pause,
          child: const Text("Let's do this later"),
        ),
        if (flow != null && error == null && !introduction)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final question in jsonList(
                flow['steps'],
              ).where((q) => matches(q['when'], session.scope)))
                Semantics(
                  label: session.visited.contains(question['id'])
                      ? 'Completed step'
                      : 'Remaining step',
                  child: Icon(
                    session.visited.contains(question['id'])
                        ? Icons.circle
                        : Icons.circle_outlined,
                    size: 10,
                    color: session.visited.contains(question['id'])
                        ? Colors.green
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        if (!introduction && !busy && displayForMs > 0)
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text('Continuing…'),
          ),
      ],
    );
  }
}
