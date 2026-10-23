// Displays the web's birthdate schedule or its incomplete-profile prompt.
// Owns age, birthday dates and profile navigation.
// Does not edit birth dates or calculate will release conditions.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/panel_section.dart';
import 'birthday_schedule.dart';

class BirthdaySummary extends StatelessWidget {
  final Object? stamp;
  const BirthdaySummary({super.key, required this.stamp});
  @override
  Widget build(BuildContext context) {
    final schedule = birthdaySchedule(stamp, DateTime.now());
    return PanelSection(
      title: 'Schedule (based on Birthdate)',
      children: [
        if (schedule == null)
          const Text('Add your birth date to see your birthday schedule.')
        else ...[
          Wrap(
            spacing: 24,
            runSpacing: 20,
            children: [
              for (final metric in [
                (schedule.days, 'days until your next birthday'),
                (schedule.age, 'years — your current age'),
                (schedule.age + 1, 'years on your next birthday'),
              ])
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metric.$1.toString(),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(metric.$2),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Birth date: ' + dateLabel(schedule.birth.millisecondsSinceEpoch),
          ),
          Text(
            'Next birthday: ' + dateLabel(schedule.next.millisecondsSinceEpoch),
          ),
        ],
        TextButton(
          onPressed: () => context.push('/profile'),
          child: const Text('Edit profile'),
        ),
      ],
    );
  }
}
