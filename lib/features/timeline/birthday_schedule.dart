// Calculates the birthday summary displayed on the web Timeline page.
// Owns age, upcoming birthday and days remaining using local calendar dates.
// Does not treat missing birth dates as valid account information.
class BirthdaySchedule {
  final DateTime birth;
  final DateTime next;
  final int age;
  final int days;
  const BirthdaySchedule(this.birth, this.next, this.age, this.days);
}

BirthdaySchedule? birthdaySchedule(Object? stamp, DateTime now) {
  final millis = int.tryParse(stamp?.toString() ?? '');
  if (millis == null || millis == 0) return null;
  final birth = DateTime.fromMillisecondsSinceEpoch(millis);
  final today = DateTime(now.year, now.month, now.day);
  var next = DateTime(now.year, birth.month, birth.day);
  final age = now.year - birth.year - (today.isBefore(next) ? 1 : 0);
  if (next.isBefore(today)) {
    next = DateTime(now.year + 1, birth.month, birth.day);
  }
  final days = DateTime.utc(
    next.year,
    next.month,
    next.day,
  ).difference(DateTime.utc(today.year, today.month, today.day)).inDays;
  return BirthdaySchedule(birth, next, age, days);
}
