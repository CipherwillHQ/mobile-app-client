// Uses the established web defaults and authenticated check-in behavior.
// Owns reminder preference reset and cumulative event dates.
// Does not invoke development-only event triggers.
import '../../core/api/api_client.dart';
import '../../core/api/json_values.dart';

const timelineDefaults = {
  'first_reminder_after_ms': '259200000',
  'second_reminder_after_ms': '2592000000',
  'last_reminder_after_ms': '5184000000',
  'will_release_after_ms': '864000000',
  'will_revoke_after_ms': '8640000000',
};
Future<void> resetTimeline(ApiClient api) async {
  for (final entry in timelineDefaults.entries) {
    await api.run('UPDATE_PREFERENCES', {
      'key': entry.key,
      'value': entry.value,
    });
  }
}

List<(String, DateTime)> plannedEvents(Json account, Json preferences) {
  var timestamp =
      int.parse(account['last_accessed'].toString()) +
      int.parse(preferences['check_in_interval'].toString()) * 86400000;
  return [
    for (final key in timelineDefaults.keys)
      (
        key,
        DateTime.fromMillisecondsSinceEpoch(
          timestamp += int.parse(preferences[key].toString()),
        ),
      ),
  ];
}
