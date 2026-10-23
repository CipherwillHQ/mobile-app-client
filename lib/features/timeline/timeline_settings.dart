// Edits timeline preferences in their web-defined location and units.
// Owns busy state, premium reminder restrictions and confirmed default reset.
// Does not bypass backend plan authorization or mutate live release events.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/actions.dart';
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

  Future<void> editReminder(String key) async {
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
    final value = await showDialog<String>(
      context: context,
      builder: (dialog) => SimpleDialog(
        title: Text('Change ' + timelineTitles[key]!),
        children: [
          for (final entry in reminderOptions.entries)
            SimpleDialogOption(
              onPressed: () => Navigator.pop(dialog, entry.key),
              child: Text(entry.value),
            ),
        ],
      ),
    );
    if (value != null && mounted) await update(key, value);
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
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      CheckInSchedule(
        account: widget.account,
        preferences: widget.preferences,
        busy: busy,
        update: update,
      ),
      TimelineEventList(
        account: widget.account,
        preferences: widget.preferences,
        busy: busy,
        edit: editReminder,
        reset: reset,
      ),
    ],
  );
}
