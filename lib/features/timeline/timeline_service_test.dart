// Checks timeline estimates and birthday summaries against the web behavior.
// Owns cumulative intervals, default values and local calendar edge cases.
// Does not execute live scheduled events.
import 'package:flutter_test/flutter_test.dart';
import 'timeline_service.dart';
import 'birthday_schedule.dart';

void main() {
  test('timeline uses today plus check-in and cumulative reminders', () {
    final now = DateTime(2026, 10, 24, 12);
    final events = plannedEvents(
      {'last_accessed': '1'},
      {'check_in_interval': 30, ...timelineDefaults},
      now: now,
    );
    expect(events.first.$2, now.add(const Duration(days: 33)));
    expect(events.last.$2, now.add(const Duration(days: 233)));
    expect(events.map((e) => e.$1), timelineDefaults.keys);
  });
  test('missing preferences use the same default schedule', () {
    final now = DateTime(2026, 10, 24);
    expect(
      plannedEvents({}, {}, now: now).first.$2,
      now.add(const Duration(days: 368)),
    );
  });
  test('birthday summary handles before, on and after birthday', () {
    final stamp = DateTime(2000, 10, 24).millisecondsSinceEpoch.toString();
    final before = birthdaySchedule(stamp, DateTime(2026, 10, 23))!;
    expect(before.age, 25);
    expect(before.days, 1);
    final birthday = birthdaySchedule(stamp, DateTime(2026, 10, 24, 18))!;
    expect(birthday.age, 26);
    expect(birthday.days, 0);
    final after = birthdaySchedule(stamp, DateTime(2026, 10, 25))!;
    expect(after.age, 26);
    expect(after.next, DateTime(2027, 10, 24));
  });
  test('missing birth date shows incomplete profile', () {
    for (final value in [null, '0', 'invalid']) {
      expect(birthdaySchedule(value, DateTime(2026)), isNull);
    }
  });
}
