// Checks readable identities for members, guests and incomplete profiles.
// Owns full-name ordering and safe fallback coverage.
// Does not infer account status.
import 'package:flutter_test/flutter_test.dart';
import 'person_name.dart';

void main() {
  test('prefers the available name to a duplicated email heading', () {
    expect(
      personName({
        'first_name': 'Sam',
        'last_name': 'Taylor',
        'email': 'sam@example.com',
      }),
      'Sam Taylor',
    );
    expect(
      personName({'first_name': 'Alex', 'email': 'alex@example.com'}),
      'Alex',
    );
    expect(personName({'email': 'sam@example.com'}), 'sam@example.com');
    expect(personName({'first_name': ' ', 'last_name': ' Taylor '}), 'Taylor');
  });
}
