// Displays the web check-in interval selector and activity dates.
// Owns check-in text and selectable web interval values.
// Does not save preferences or calculate birthday information.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/panel_section.dart';
import 'timeline_options.dart';

class CheckInSchedule extends StatelessWidget {
  final Json account, preferences;
  final bool busy;
  final void Function(String, String) update;
  const CheckInSchedule({
    super.key,
    required this.account,
    required this.preferences,
    required this.busy,
    required this.update,
  });
  @override
  Widget build(BuildContext context) {
    final interval =
        (int.tryParse(preferences['check_in_interval']?.toString() ?? '') ??
                365)
            .toString();
    return PanelSection(
      title: 'Check In Interval',
      children: [
        const Text(
          "We regularly check whether you've logged into Cipherwill. If you stay inactive, we send reminders before granting your beneficiaries access to your data.",
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: interval,
          decoration: const InputDecoration(
            labelText: "Start sending reminders if I'm inactive for",
          ),
          items: [
            for (final entry in {
              ...checkInOptions,
              if (!checkInOptions.containsKey(interval))
                interval: interval + ' days',
            }.entries)
              DropdownMenuItem(value: entry.key, child: Text(entry.value)),
          ],
          onChanged: busy
              ? null
              : (value) {
                  if (value != null) update('check_in_interval', value);
                },
        ),
        const SizedBox(height: 16),
        if (account['last_accessed'] != null)
          Text('Last Check In was on: ' + dateLabel(account['last_accessed'])),
        Text(
          'Next Check In is before: ' +
              dateLabel(
                DateTime.now()
                    .add(Duration(days: int.parse(interval)))
                    .millisecondsSinceEpoch,
              ) +
              ' (' +
              interval +
              ' days)',
        ),
      ],
    );
  }
}
