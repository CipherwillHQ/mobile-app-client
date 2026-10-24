// Defines the check-in and reminder intervals offered by the web Timeline page.
// Owns concise selector labels, interval context and existing preference units.
// Does not calculate or execute server release events.
const checkInOptions = {
  '365': '1 year',
  '180': '6 months',
  '90': '3 months',
  '30': '1 month',
  '14': '2 weeks',
  '7': '1 week',
};
const reminderOptions = {
  '259200000': '3 days',
  '432000000': '5 days',
  '604800000': '7 days',
  '864000000': '10 days',
  '1209600000': '14 days',
  '2592000000': '1 month',
  '5184000000': '2 months',
  '7776000000': '3 months',
  '8640000000': '100 days',
  '15552000000': '6 months',
  '17280000000': '200 days',
  '31536000000': '1 year',
};
const timelineDescriptions = {
  'first_reminder_after_ms': 'After your check-in window ends.',
  'second_reminder_after_ms': 'After the first reminder.',
  'last_reminder_after_ms': 'After the second reminder.',
  'will_release_after_ms':
      'After the final reminder, your beneficiaries receive access.',
  'will_revoke_after_ms':
      'After access is released, beneficiaries lose access and your account is deleted.',
};
