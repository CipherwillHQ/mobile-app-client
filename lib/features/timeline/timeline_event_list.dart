// Presents the web timeline's dated reminder/release rows and reset action.
// Owns event labels and current interval buttons.
// Does not edit preferences or authorize Premium features.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import 'timeline_options.dart';
import 'timeline_service.dart';
import 'timeline_entry.dart';
import '../../shared/ui/navigation_row.dart';

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
  Widget build(BuildContext context) {
    final events = plannedEvents(account, preferences);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var index = 0; index < events.length; index++)
          TimelineEntry(
            title: timelineTitles[events[index].$1]!,
            date: dateLabel(events[index].$2.millisecondsSinceEpoch),
            last: index == events.length - 1,
            action: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: busy ? null : () => edit(events[index].$1),
                icon: const Icon(AppIcons.edit, size: 18),
                label: Text(
                  (int.parse(
                                (preferences[events[index].$1] ??
                                        timelineDefaults[events[index].$1])
                                    .toString(),
                              ) ~/
                              86400000)
                          .toString() +
                      ' days',
                ),
              ),
            ),
          ),
        NavigationRow(
          title: 'Reset to defaults',
          detail: 'Restore the recommended schedule',
          onTap: busy ? null : reset,
          icon: AppIcons.refresh,
        ),
      ],
    );
  }
}
