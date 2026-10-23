// Converts existing planning fields between storage units and days
// Owns the days-only check-in interval exception.
// Does not validate server scheduling limits.

double intervalDays(String key, dynamic value) =>
    num.parse(value.toString()).toDouble() /
    (key == 'check_in_interval' ? 1 : 86400000);
String intervalValue(String key, double days) =>
    (days * (key == 'check_in_interval' ? 1 : 86400000)).round().toString();

const planningLabels = {
  'check_in_interval': 'Check-in interval',
  'first_reminder_after_ms': 'First reminder',
  'second_reminder_after_ms': 'Second reminder',
  'last_reminder_after_ms': 'Final reminder',
  'will_release_after_ms': 'Release access',
  'will_revoke_after_ms': 'Revoke access',
};
