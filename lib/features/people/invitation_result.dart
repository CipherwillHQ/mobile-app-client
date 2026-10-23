// Interprets the web invitation contract before adding a relationship.
// Owns truthful email feedback and retry-required outcomes.
// Does not treat guest creation as successful email delivery.
import '../../core/api/json_values.dart';

String invitationMessage(Json outcome) => switch (outcome['status']) {
  'sent' => 'Invitation email sent.',
  'already_sent' => 'An invitation email was already sent to this address.',
  'failed' =>
    outcome['reason']?.toString() ??
        'Invitation email failed. Retry or add without emailing.',
  'skipped' =>
    'Invitation email skipped. ' +
        (outcome['reason']?.toString() ?? 'No email was sent.'),
  _ => throw StateError(
    'Invitation outcome unavailable. Retry before adding this person.',
  ),
};
void checkInvitation(Json person, bool sendEmail) {
  if (person['id'] == null) {
    throw StateError('Unable to add person. Please retry.');
  }
  final outcome = asJson(person['invitation_email']);
  final message = invitationMessage(outcome);
  if (outcome['status'] == 'failed' ||
      (sendEmail &&
          outcome['status'] == 'skipped' &&
          person['__typename'] != 'User')) {
    throw StateError(message + ' Retry or turn off Send invitation email.');
  }
}
