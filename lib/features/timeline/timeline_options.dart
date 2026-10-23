// Defines the check-in and reminder intervals offered by the web Timeline page.
// Owns selector labels and the existing units used by preferences.
// Does not calculate or execute server release events.
const checkInOptions = {
  '365': 'Year',
  '180': '6 Months',
  '90': '3 Months',
  '30': 'Month',
  '14': '2 Weeks',
  '7': 'Week',
};
const reminderOptions = {
  '259200000': '3 days',
  '432000000': '5 days',
  '604800000': '7 days',
  '864000000': '10 days',
  '1209600000': '14 days',
  '2592000000': '1 Month',
  '5184000000': '2 Months',
  '7776000000': '3 Months',
  '8640000000': '100 Days',
  '15552000000': '6 Months',
  '17280000000': '200 Days',
  '31536000000': '1 Year',
};
const timelineTitles = {
  'first_reminder_after_ms': 'First Check-in Reminder',
  'second_reminder_after_ms': 'Second Check-in Reminder',
  'last_reminder_after_ms': 'Last Check-in Reminder',
  'will_release_after_ms': 'Will Release to Beneficiary',
  'will_revoke_after_ms': 'Will Revoke Access',
};
