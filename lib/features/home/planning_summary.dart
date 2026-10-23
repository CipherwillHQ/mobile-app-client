// Presents online guidance progress and the next server-scheduled will event.
// Owns small Home summaries and their navigation targets.
// Does not decrypt assets or determine release conditions locally.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/time.dart';
import '../../shared/ui/remote_panel.dart';

class PlanningSummary extends StatelessWidget {
  const PlanningSummary({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      RemotePanel(
        operation: 'GUIDANCE_BOOTSTRAP',
        builder: (result) => Card(
          child: ListTile(
            leading: const Icon(Icons.auto_awesome_outlined),
            title: const Text('Your guide'),
            subtitle: Text(
              jsonList(result['getGuidedActionCompletions']).length.toString() +
                  ' completed steps · ' +
                  jsonList(
                    result['getGuidedActionDeferrals'],
                  ).length.toString() +
                  ' saved for later',
            ),
            onTap: () => context.push('/guide'),
          ),
        ),
      ),
      RemotePanel(
        operation: 'GET_NEXT_WILL_EVENT',
        builder: (result) {
          final event = result['getNextWillEvent'];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Will timeline'),
              subtitle: Text(
                event == null
                    ? 'No pending event'
                    : event['type'].toString().replaceAll('_', ' ') +
                          ' · ' +
                          localTime(event['execution_time']),
              ),
              onTap: () => context.push('/timeline'),
            ),
          );
        },
      ),
    ],
  );
}
