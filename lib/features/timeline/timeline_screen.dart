// Shows scheduled will events and cumulative reminder dates.
// Owns native timeline presentation and account check-in action.
// Does not release wills locally or call development-only APIs.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/planning_intervals.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/feature_card.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/empty_state.dart';
import 'timeline_service.dart';
import 'timeline_entry.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Cipherwill Timeline',
    children: [
      const GuidePanel(
        title: 'Stay connected',
        message:
            'Your activity and saved intervals determine the reminder and release schedule.',
        icon: Icons.schedule_rounded,
      ),
      const SectionHeading('Next scheduled event'),
      RemotePanel(
        operation: 'GET_NEXT_WILL_EVENT',
        builder: (r) {
          final event = r['getNextWillEvent'];
          if (event == null) {
            return const EmptyState(
              title: 'No pending event',
              message: 'Your next scheduled event will appear here.',
              icon: Icons.event_available_outlined,
            );
          }
          final e = asJson(event);
          return FeatureCard(
            title: e['type'].toString().replaceAll('_', ' '),
            subtitle: dateLabel(e['execution_time'], includeTime: true),
            icon: Icons.event_outlined,
            trailing: const Icon(Icons.schedule),
          );
        },
      ),
      const SectionHeading('Your planning schedule'),
      RemotePanel(
        operation: 'GET_PREFERENCES',
        builder: (r) {
          final p = asJson(r['getPreferences']);
          final account = ref.watch(accountProvider).value;
          if (account == null) return const Text('Loading account…');
          final events = plannedEvents(account, p);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                for (var index = 0; index < events.length; index++)
                  TimelineEntry(
                    title: planningLabels[events[index].$1]!,
                    date: dateLabel(
                      events[index].$2.millisecondsSinceEpoch,
                      includeTime: true,
                    ),
                    last: index == events.length - 1,
                  ),
              ],
            ),
          );
        },
      ),
      const SizedBox(height: 20),
      FilledButton.icon(
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
        icon: const Icon(Icons.refresh_rounded),
        label: const Text('Refresh account activity'),
      ),
      const SizedBox(height: 12),
      OutlinedButton.icon(
        onPressed: () => context.push('/preferences'),
        icon: const Icon(Icons.tune_rounded),
        label: const Text('Edit planning settings'),
      ),
    ],
  );
}
