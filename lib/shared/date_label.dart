// Formats backend timestamps into readable native date labels.
// Owns locale-aware date presentation and missing-date labels.
// Does not change server timestamps or scheduling.
import 'package:intl/intl.dart';

String dateLabel(Object? value, {bool includeTime = false}) {
  final milliseconds = int.tryParse(value?.toString() ?? '');
  if (milliseconds == null) return 'Date unavailable';
  final date = DateTime.fromMillisecondsSinceEpoch(milliseconds).toLocal();
  return includeTime
      ? DateFormat.yMMMd().add_jm().format(date)
      : DateFormat.yMMMd().format(date);
}
