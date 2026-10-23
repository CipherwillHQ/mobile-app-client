// Presents objective introductions, questions and completions as centered slides.
// Owns web wording, simple inputs and in-flow action controls.
// Does not advance the protocol or save answers itself.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import 'guidance_input.dart';
import 'rules.dart';

class GuidanceStepPanel extends StatelessWidget {
  final Json flow, scope;
  final Json? step;
  final bool complete, busy, introduction;
  final int completedSteps;
  final ValueChanged<dynamic> changed;
  final dynamic answer;
  final VoidCallback advance;
  const GuidanceStepPanel({
    super.key,
    required this.flow,
    required this.step,
    required this.scope,
    required this.complete,
    required this.completedSteps,
    required this.busy,
    required this.changed,
    required this.advance,
    this.introduction = false,
    this.answer,
  });
  @override
  Widget build(BuildContext context) {
    final title = introduction
        ? flow['title']
        : complete
        ? flow['completion']['title']
        : step?['title'];
    final subtext = introduction
        ? flow['description']
        : complete
        ? flow['completion']['subtext']
        : step?['subtext'];
    final timed =
        !introduction &&
        ((complete ? flow['completion']['displayForMs'] : step?['displayForMs'])
                    as num? ??
                0) >
            0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          guidanceText(title, scope),
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        Text(
          guidanceText(subtext, scope),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 28),
        if (!introduction && !complete && step?['input'] != null) ...[
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: GuidanceInput(
              key: ValueKey(step!['id']),
              spec: asJson(step!['input']),
              changed: changed,
              value: answer,
            ),
          ),
          const SizedBox(height: 28),
        ],
        if (busy)
          const CircularProgressIndicator()
        else if (!timed)
          FilledButton(
            onPressed: advance,
            child: Text(
              introduction
                  ? 'Start'
                  : complete
                  ? 'Continue'
                  : step?['continueLabel'] ?? 'Continue',
            ),
          ),
      ],
    );
  }
}
