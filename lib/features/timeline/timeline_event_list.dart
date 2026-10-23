// Presents the web timeline's dated reminder/release rows and reset action.
// Owns event labels and current interval buttons.
// Does not edit preferences or authorize Premium features.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import 'timeline_options.dart';
import 'timeline_service.dart';

class TimelineEventList extends StatelessWidget {
  final Json account, preferences;
  final bool busy;
  final ValueChanged<String> edit;
  final VoidCallback reset;
  const TimelineEventList({
    super.key,
    required this.account,
    required this.preferences,
    required this.busy,
    required this.edit,
    required this.reset,
  });
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (final event in plannedEvents(account, preferences))
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                timelineTitles[event.$1]!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text('Date: ' + dateLabel(event.$2.millisecondsSinceEpoch)),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: busy ? null : () => edit(event.$1),
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: Text(
                    (int.parse(
                                  (preferences[event.$1] ??
                                          timelineDefaults[event.$1])
                                      .toString(),
                                ) ~/
                                86400000)
                            .toString() +
                        ' days',
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      Text(
        'Reset timeline to defaults',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const Text('Restore the recommended safety schedule.'),
      TextButton.icon(
        onPressed: busy ? null : reset,
        icon: const Icon(Icons.refresh),
        label: const Text('Reset to defaults'),
      ),
    ],
  );
}
