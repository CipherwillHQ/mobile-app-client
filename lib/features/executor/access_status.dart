// Interprets the existing backend's will access deadlines and failures.
// Owns active-grant filtering and expired-access classification.
// Does not grant access or change the release protocol.
import '../../core/api/api_failure.dart';
import '../../core/api/json_values.dart';

DateTime? accessDeadline(Json grant) {
  final milliseconds = int.tryParse(grant['expire_at'].toString());
  return milliseconds == null
      ? null
      : DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

bool isActiveAccess(Json grant, {DateTime? now}) =>
    accessDeadline(grant)?.isAfter(now ?? DateTime.now()) == true;

class ExpiredWillAccess extends StateError {
  ExpiredWillAccess() : super('This access has expired.');
}

String? accessFailureReason(Object error) {
  if (error is ExpiredWillAccess) return 'expired';
  if (error is! ApiFailure) return null;
  if (['ACCESS_REVOKED', 'UNAUTHORIZED', 'FORBIDDEN'].contains(error.code) ||
      (error.code == 'BAD_USER_INPUT' &&
          error.message == 'Invalid Access ID')) {
    return 'unavailable';
  }
  return null;
}
