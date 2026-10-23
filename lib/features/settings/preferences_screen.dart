// Edits existing segment and planning preferences
// Owns backend preference values and schedule refresh.
// Does not implement new plan rules.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/planning_intervals.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../vault/categories.dart';
import '../timeline/timeline_service.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});
  Future<void> update(
    BuildContext context,
    WidgetRef ref,
    String key,
    String value,
  ) => perform(context, () async {
    await ref.read(apiProvider).run('UPDATE_PREFERENCES', {
      'key': key,
      'value': value,
    });
    ref.invalidate(preferencesProvider);
    ref.invalidate(remoteProvider);
  }, success: 'Preference saved.');
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Planning and segments',
    children: [
      AsyncPanel(
        value: ref.watch(preferencesProvider),
        retry: () => ref.invalidate(preferencesProvider),
        builder: (p) => Column(
          children: [
            for (final category in categories)
              if (category.preference != null)
                SwitchListTile(
                  title: Text(category.title),
                  subtitle: category.premium
                      ? const Text('Existing Premium subscription required')
                      : null,
                  value: p[category.preference] == true,
                  onChanged: (value) => update(
                    context,
                    ref,
                    category.preference!,
                    value.toString(),
                  ),
                ),
            SwitchListTile(
              title: const Text('Promotional emails'),
              value: p['promotional_emails'] == true,
              onChanged: (value) =>
                  update(context, ref, 'promotional_emails', value.toString()),
            ),
            for (final key in [
              'check_in_interval',
              'first_reminder_after_ms',
              'second_reminder_after_ms',
              'last_reminder_after_ms',
              'will_release_after_ms',
              'will_revoke_after_ms',
            ])
              ListTile(
                title: Text(planningLabels[key]!),
                subtitle: Text(intervalDays(key, p[key]).toString() + ' days'),
                trailing: const Icon(Icons.edit_outlined),
                onTap: () => perform(context, () async {
                  final value = await prompt(
                    context,
                    'Interval in days',
                    initial: intervalDays(key, p[key]).toString(),
                  );
                  if (value == null) return;
                  final days = double.parse(value);
                  if (!days.isFinite || days < 0) {
                    throw StateError('Enter a valid interval.');
                  }
                  if (!context.mounted) return;
                  await update(context, ref, key, intervalValue(key, days));
                }),
              ),
          ],
        ),
      ),
      TextButton(
        onPressed: () => perform(context, () async {
          if (!await confirm(
            context,
            'Reset your will timeline to the current defaults?',
          )) {
            return;
          }
          await resetTimeline(ref.read(apiProvider));
          ref.invalidate(remoteProvider);
        }, success: 'Timeline reset.'),
        child: const Text('Reset timeline'),
      ),
    ],
  );
}
