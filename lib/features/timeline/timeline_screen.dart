// Matches the web Timeline page's birthday, check-in and reminder sections.
// Owns online account/preference rendering and schedule controls.
// Does not edit segments or invoke development-only event APIs.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import 'birthday_summary.dart';
import 'timeline_settings.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Cipherwill Timeline',
    children: [
      AsyncPanel(
        value: ref.watch(accountProvider),
        retry: () => ref.invalidate(accountProvider),
        builder: (account) => AsyncPanel(
          value: ref.watch(preferencesProvider),
          retry: () => ref.invalidate(preferencesProvider),
          builder: (preferences) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BirthdaySummary(stamp: account['birth_date']),
              TimelineSettings(account: account, preferences: preferences),
            ],
          ),
        ),
      ),
    ],
  );
}
