// Edits timeline preferences in their web-defined location and units.
// Owns busy state, premium reminder restrictions and confirmed default reset.
// Does not bypass backend plan authorization or mutate live release events.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/planning_intervals.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/choice_sheet.dart';
import 'check_in_schedule.dart';
import 'timeline_event_list.dart';
import '../../shared/ui/remote_panel.dart';
import 'timeline_options.dart';
import 'timeline_service.dart';

class TimelineSettings extends ConsumerStatefulWidget {
  final Json account;
  final Json preferences;
  const TimelineSettings({
    super.key,
    required this.account,
    required this.preferences,
  });
  @override
  ConsumerState<TimelineSettings> createState() => _TimelineSettingsState();
}

class _TimelineSettingsState extends ConsumerState<TimelineSettings> {
  bool busy = false;
  Future<void> update(String key, String value) async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, () async {
      await ref.read(apiProvider).run('UPDATE_PREFERENCES', {
        'key': key,
        'value': value,
      });
      ref.invalidate(preferencesProvider);
      ref.invalidate(remoteProvider);
    }, success: 'Timeline preference saved.');
    if (mounted) setState(() => busy = false);
  }

  Future<void> editCheckIn() async {
    if (busy) return;
    final interval =
        (int.tryParse(
                  widget.preferences['check_in_interval']?.toString() ?? '',
                ) ??
                365)
            .toString();
    final value = await chooseValue(
      context,
      title: 'Check-in interval',
      description: 'Start reminders after this much inactivity.',
      selected: interval,
      options: {
        ...checkInOptions,
        if (!checkInOptions.containsKey(interval)) interval: '$interval days',
      },
    );
    if (value != null && value != interval && mounted) {
      await update('check_in_interval', value);
    }
  }

  Future<void> editReminder(String key) async {
    if (busy) return;
    if (widget.account['plan'] != 'premium') {
      await showDialog<void>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Premium timeline settings'),
          content: const Text(
            'Upgrade to customize your reminder and release intervals.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog),
              child: const Text('Close'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialog);
                context.push('/upgrade');
              },
              child: const Text('Upgrade'),
            ),
          ],
        ),
      );
      return;
    }
    final selected = (widget.preferences[key] ?? timelineDefaults[key])
        .toString();
    final value = await chooseValue(
      context,
      title: planningLabels[key]!,
      description: timelineDescriptions[key]!,
      selected: selected,
      options: {
        ...reminderOptions,
        if (!reminderOptions.containsKey(selected))
          selected: '${intervalDays(key, selected).floor()} days',
      },
    );
    if (value != null && value != selected && mounted) await update(key, value);
  }

  Future<void> reset() async {
    if (busy) return;
    if (widget.account['plan'] != 'premium') {
      await editReminder('first_reminder_after_ms');
      return;
    }
    if (!await confirm(
          context,
          'Restore the recommended reminder intervals: 3, 30, 60, 10 and 100 days?',
        ) ||
        !mounted) {
      return;
    }
    setState(() => busy = true);
    await perform(context, () async {
      await resetTimeline(ref.read(apiProvider));
      ref.invalidate(preferencesProvider);
      ref.invalidate(remoteProvider);
    }, success: 'Timeline preferences reset to defaults.');
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CheckInSchedule(
          account: widget.account,
          preferences: widget.preferences,
          now: now,
          busy: busy,
          edit: editCheckIn,
        ),
        TimelineEventList(
          account: widget.account,
          preferences: widget.preferences,
          now: now,
          busy: busy,
          edit: editReminder,
          reset: reset,
        ),
      ],
    );
  }
}
