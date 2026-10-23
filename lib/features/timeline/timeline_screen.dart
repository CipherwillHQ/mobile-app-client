// Shows the scheduled will event and cumulative reminder dates.
// Owns native timeline presentation and account check-in action.
// Does not release wills locally or call development-only APIs.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/time.dart';
import '../../shared/planning_intervals.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import 'timeline_service.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Will timeline',
    children: [
      RemotePanel(
        operation: 'GET_NEXT_WILL_EVENT',
        builder: (r) {
          final event = r['getNextWillEvent'];
          if (event == null) return const Text('No pending event.');
          final e = asJson(event);
          return Card(
            child: ListTile(
              title: Text(e['type'].toString().replaceAll('_', ' ')),
              subtitle: Text(localTime(e['execution_time'])),
            ),
          );
        },
      ),
      RemotePanel(
        operation: 'GET_PREFERENCES',
        builder: (r) {
          final p = asJson(r['getPreferences']);
          final account = ref.watch(accountProvider).value;
          if (account == null) return const Text('Loading account…');
          return Column(
            children: [
              for (final event in plannedEvents(account, p))
                ListTile(
                  title: Text(planningLabels[event.$1]!),
                  subtitle: Text(event.$2.toLocal().toString()),
                ),
            ],
          );
        },
      ),
      FilledButton(
        onPressed: () => perform(
          context,
          () async {
            await ref.read(firebaseProvider).currentUser!.getIdToken(true);
            await ref.read(apiProvider).account();
            ref.invalidate(accountProvider);
            ref.invalidate(remoteProvider);
          },
          success:
              'Connected to Cipherwill. Activity updates may take a moment.',
        ),
        child: const Text('Refresh account activity'),
      ),
      TextButton(
        onPressed: () => context.push('/preferences'),
        child: const Text('Edit planning settings'),
      ),
    ],
  );
}
