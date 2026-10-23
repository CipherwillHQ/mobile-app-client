// Presents the active guidance step using the server's wording.
// Owns step hierarchy, input and completion presentation.
// Does not advance the protocol or save answers itself.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/icon_badge.dart';
import '../../shared/ui/motion.dart';
import 'guidance_input.dart';
import 'rules.dart';

class GuidanceStepPanel extends StatelessWidget {
  final Json flow;
  final Json? step;
  final Json scope;
  final bool complete;
  final int completedSteps;
  final bool busy;
  final ValueChanged<dynamic> changed;
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
  });
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconBadge(
              complete ? Icons.check_rounded : Icons.auto_awesome_outlined,
              size: 54,
            ),
          ),
          const SizedBox(height: 20),
          Text(flow['title'], style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: StatusPill(
              complete ? 'Step complete' : '$completedSteps steps completed',
              icon: complete
                  ? Icons.check_circle_outline
                  : Icons.route_outlined,
            ),
          ),
          const SizedBox(height: 22),
          AnimatedSwitcher(
            duration: AppMotion.duration(context),
            child: Text(
              guidanceText(
                complete ? flow['completion']['title'] : step?['title'],
                scope,
              ),
              key: ValueKey(complete ? 'complete' : step?['id']),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            guidanceText(
              complete ? flow['completion']['subtext'] : step?['subtext'],
              scope,
            ),
          ),
          const SizedBox(height: 24),
          if (!complete && step?['input'] != null) ...[
            GuidanceInput(
              key: ValueKey(step!['id']),
              spec: asJson(step!['input']),
              changed: changed,
            ),
            const SizedBox(height: 24),
          ],
          FilledButton.icon(
            onPressed: busy ? null : advance,
            icon: const Icon(Icons.arrow_forward_rounded),
            label: Text(
              busy
                  ? 'Please wait…'
                  : complete
                  ? 'Continue'
                  : step?['continueLabel'] ?? 'Continue',
            ),
          ),
        ],
      ),
    ),
  );
}
