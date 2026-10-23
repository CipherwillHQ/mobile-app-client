// Checks invitation email outcomes using the current web contract.
// Owns failure and skipped-delivery gates before relationship creation.
// Does not call email providers or backend mutations.
import 'package:flutter_test/flutter_test.dart';
import 'invitation_result.dart';

void main() {
  test('sent and already-sent invitations can add a guest', () {
    for (final status in ['sent', 'already_sent']) {
      checkInvitation({
        'id': 'guest',
        '__typename': 'Guest',
        'invitation_email': {'status': status},
      }, true);
    }
  });
  test(
    'failed delivery blocks adding until retry or explicit email opt-out',
    () {
      expect(
        () => checkInvitation({
          'id': 'guest',
          '__typename': 'Guest',
          'invitation_email': {'status': 'failed', 'reason': 'Delivery failed'},
        }, true),
        throwsStateError,
      );
      expect(
        () => checkInvitation({
          'id': 'guest',
          '__typename': 'Guest',
          'invitation_email': {'status': 'skipped'},
        }, true),
        throwsStateError,
      );
      checkInvitation({
        'id': 'guest',
        '__typename': 'Guest',
        'invitation_email': {'status': 'skipped'},
      }, false);
      checkInvitation({
        'id': 'user',
        '__typename': 'User',
        'invitation_email': {'status': 'skipped'},
      }, true);
    },
  );
  test('missing response outcome never reports success', () {
    expect(() => checkInvitation({'id': 'guest'}, true), throwsStateError);
    expect(() => checkInvitation({}, false), throwsStateError);
  });
}
