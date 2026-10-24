// Keeps the web's birthday facts in a compact secondary Timeline section.
// Owns milestone text and the profile entry for completing a birth date.
// Does not edit birth dates or calculate release conditions.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/app_icons.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/navigation_row.dart';
import 'birthday_schedule.dart';

class BirthdaySummary extends StatelessWidget {
  final Object? stamp;
  const BirthdaySummary({super.key, required this.stamp});
  @override
  Widget build(BuildContext context) {
    final schedule = birthdaySchedule(stamp, DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 32),
        NavigationRow(
          title: 'Birthday',
          icon: AppIcons.birthday,
          detail: schedule == null
              ? 'Add your birth date'
              : dateLabel(schedule.next.millisecondsSinceEpoch) +
                    ' · ' +
                    (schedule.days == 0
                        ? 'Today'
                        : '${schedule.days} days away') +
                    '\nAge ${schedule.age} · Next age ${schedule.age + 1}\nBorn ' +
                    dateLabel(schedule.birth.millisecondsSinceEpoch),
          trailing: const Icon(AppIcons.edit, size: 18),
          onTap: () => context.push('/profile'),
        ),
      ],
    );
  }
}
