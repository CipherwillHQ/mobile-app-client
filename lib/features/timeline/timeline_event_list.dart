// Presents the web's cumulative reminders and beneficiary access stages.
// Owns concise stage labels, interval context and the default-reset action.
// Does not execute events or authorize Premium preference changes.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../app/design_tokens.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/planning_intervals.dart';
import 'timeline_service.dart';
import 'timeline_entry.dart';

class TimelineEventList extends StatelessWidget {
  final Json account, preferences;
  final DateTime now;
  final bool busy;
  final ValueChanged<String> edit;
  final VoidCallback reset;
  const TimelineEventList({
    super.key,
    required this.account,
    required this.preferences,
    required this.now,
    required this.busy,
    required this.edit,
    required this.reset,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final events = plannedEvents(account, preferences, now: now);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 24),
        Row(
          children: [
            Expanded(
              child: Text(
                'If you stay inactive',
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              tooltip: 'Reset timeline to defaults',
              onPressed: busy ? null : reset,
              icon: const Icon(AppIcons.refresh, size: 20),
            ),
          ],
        ),
        for (var index = 0; index < events.length; index++)
          TimelineEntry(
            key: ValueKey(events[index].$1),
            title: planningLabels[events[index].$1]!,
            date: dateLabel(events[index].$2.millisecondsSinceEpoch),
            interval:
                '${intervalDays(events[index].$1, preferences[events[index].$1] ?? timelineDefaults[events[index].$1]).floor()} days later',
            icon: switch (index) {
              3 => AppIcons.beneficiary,
              4 => AppIcons.lock,
              _ => AppIcons.notifications,
            },
            accent: switch (index) {
              3 => CipherwillColors.violet,
              4 => theme.colorScheme.onSurfaceVariant,
              _ => theme.colorScheme.primary,
            },
            first: index == 0,
            last: index == events.length - 1,
            onTap: busy ? null : () => edit(events[index].$1),
          ),
      ],
    );
  }
}
