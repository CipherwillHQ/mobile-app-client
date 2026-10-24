// Leads Timeline with the estimated next check-in and a compact interval edit.
// Owns date hierarchy, last activity and pending-save feedback.
// Does not save preferences or replace the backend's event schedule.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/motion.dart';

class CheckInSchedule extends StatelessWidget {
  final Json account, preferences;
  final DateTime now;
  final bool busy;
  final VoidCallback edit;
  const CheckInSchedule({
    super.key,
    required this.account,
    required this.preferences,
    required this.now,
    required this.busy,
    required this.edit,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final interval =
        int.tryParse(preferences['check_in_interval']?.toString() ?? '') ?? 365;
    final date = dateLabel(
      now.add(Duration(days: interval)).millisecondsSinceEpoch,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                AppIcons.calendar,
                size: 18,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Next check-in',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedSwitcher(
            duration: AppMotion.duration(context),
            child: Align(
              key: ValueKey(date),
              alignment: Alignment.centerLeft,
              child: Text(
                date,
                style: theme.textTheme.headlineLarge!.copyWith(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('Estimated from today', style: theme.textTheme.bodySmall),
          Align(
            alignment: Alignment.centerLeft,
            child: Tooltip(
              message: 'Edit check-in interval',
              child: TextButton.icon(
                onPressed: busy ? null : edit,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                ),
                iconAlignment: IconAlignment.end,
                icon: const Icon(AppIcons.edit, size: 16),
                label: Text('Every $interval days'),
              ),
            ),
          ),
          if (busy)
            Text('Saving schedule…', style: theme.textTheme.bodySmall)
          else if (account['last_accessed'] != null)
            Text(
              'Last check-in · ' + dateLabel(account['last_accessed']),
              style: theme.textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
