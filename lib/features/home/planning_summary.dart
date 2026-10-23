// Presents online guidance progress and the next scheduled will event.
// Owns Home summaries and navigation targets.
// Does not decrypt assets or determine release conditions locally.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/time.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/feature_card.dart';
import '../../app/design_tokens.dart';

class PlanningSummary extends StatelessWidget {
  const PlanningSummary({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      RemotePanel(
        operation: 'GUIDANCE_BOOTSTRAP',
        builder: (result) => FeatureCard(
          title: 'Your guide',
          subtitle:
              '${jsonList(result['getGuidedActionCompletions']).length} completed steps · '
              '${jsonList(result['getGuidedActionDeferrals']).length} saved for later',
          icon: Icons.auto_awesome_outlined,
          color: CipherwillColors.sage,
          onTap: () => context.push('/guide'),
        ),
      ),
      RemotePanel(
        operation: 'GET_NEXT_WILL_EVENT',
        builder: (result) {
          final event = result['getNextWillEvent'];
          return FeatureCard(
            title: 'Will timeline',
            subtitle: event == null
                ? 'No pending event'
                : event['type'].toString().replaceAll('_', ' ') +
                      ' · ' +
                      localTime(event['execution_time']),
            icon: Icons.schedule_rounded,
            color: CipherwillColors.clay,
            onTap: () => context.push('/timeline'),
          );
        },
      ),
    ],
  );
}
