// Formats backend millisecond timestamps for local display
// Owns timestamp parsing and labels.
// Does not change server scheduling.

String localTime(dynamic value) {
  if (value == null) return 'Not scheduled';
  final milliseconds = int.tryParse(value.toString());
  if (milliseconds == null) return 'Not scheduled';
  return DateTime.fromMillisecondsSinceEpoch(milliseconds).toLocal().toString();
}
