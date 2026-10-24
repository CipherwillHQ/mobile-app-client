// Verifies expiry boundaries and actionable will-permission failures.
// Owns fail-closed deadlines and the distinction from network errors.
// Does not infer release conditions or contact the backend.
import 'package:flutter_test/flutter_test.dart';
import '../../core/api/api_failure.dart';
import 'access_status.dart';

void main() {
  test('a grant is active only before its backend deadline', () {
    final now = DateTime.utc(2026, 10, 24);
    final milliseconds = now.millisecondsSinceEpoch;
    expect(isActiveAccess({'expire_at': '$milliseconds'}, now: now), isFalse);
    expect(
      isActiveAccess({'expire_at': '${milliseconds + 1}'}, now: now),
      isTrue,
    );
    expect(isActiveAccess({'expire_at': 'invalid'}, now: now), isFalse);
    expect(isActiveAccess({}, now: now), isFalse);
  });
  test('revoked and expired grants are separated from retryable failures', () {
    expect(accessFailureReason(ExpiredWillAccess()), 'expired');
    expect(
      accessFailureReason(
        const ApiFailure('BAD_USER_INPUT', 'Invalid Access ID'),
      ),
      'unavailable',
    );
    expect(
      accessFailureReason(const ApiFailure('FORBIDDEN', 'No access')),
      'unavailable',
    );
    expect(
      accessFailureReason(const ApiFailure('NETWORK', 'Connection failed')),
      isNull,
    );
    expect(
      accessFailureReason(const ApiFailure('BAD_USER_INPUT', 'Invalid item')),
      isNull,
    );
    expect(accessFailureReason(StateError('Vault locked')), isNull);
  });
}
