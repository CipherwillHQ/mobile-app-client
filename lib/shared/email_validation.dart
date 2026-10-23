// Validates email addresses before search or invitation requests.
// Owns the simple email format used by client forms.
// Does not verify mailbox existence or normalize stored addresses.
bool validEmail(String value) =>
    RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(value.trim());
