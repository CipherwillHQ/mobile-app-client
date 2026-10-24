// Composes the active Guide slide and its web-style progress footer.
// Owns retry, skip, pause and progress presentation.
// Does not execute guidance operations or own draft answers.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import 'guidance_session.dart';
import 'guidance_step_panel.dart';
import 'rules.dart';
import '../../shared/ui/action_sheet.dart';

class GuidanceActiveSlide extends StatelessWidget {
  final GuidanceSession session;
  final bool busy, introduction;
  final String? error;
  final int displayForMs;
  final ValueChanged<dynamic> changed;
  final dynamic answer;
  final VoidCallback advance, retry, skip, defer;
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
  });
  Future<void> options(BuildContext context) async {
    final step = session.step, flow = session.flow;
    final choice = await chooseAction(
      context,
      actions: [
        if (!introduction && step?['input']?['skippable'] == true)
          const SheetAction('skip', 'Skip this question', AppIcons.next),
        if (flow?['skippable'] == true)
          SheetAction(
            'defer',
            introduction ? 'Skip' : 'Do this later',
            AppIcons.timeline,
          ),
      ],
    );
    if (!context.mounted) return;
    if (choice == 'skip') skip();
    if (choice == 'defer') defer();
  }

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
              (flow['skippable'] == true ||
                  (!introduction && step?['input']?['skippable'] == true)))
            TextButton.icon(
              onPressed: () => options(context),
              icon: const Icon(AppIcons.more, size: 18),
              label: const Text('Options'),
            ),
        ] else
          const Text('Preparing your setup…'),
        const SizedBox(height: 24),
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
                        ? AppIcons.dot
                        : AppIcons.pending,
                    size: 10,
                    color: session.visited.contains(question['id'])
                        ? Theme.of(context).colorScheme.primary
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
