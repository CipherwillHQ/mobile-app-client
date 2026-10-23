// Checks the actual JSON score contract used by the web client.
// Owns valid totals and malformed-response regression coverage.
// Does not exercise server score award rules.
import 'package:flutter_test/flutter_test.dart';
import 'account_score.dart';

void main() {
  test('sums score components without converting to a percentage', () {
    expect(accountScore('{"base":300,"firstName":100,"premium":50}'), 450);
    expect(accountScore('{}'), 0);
  });
  test('rejects invalid score representations', () {
    for (final value in [450, '450', '[]', 'null', '{"base":"300"}', '{']) {
      expect(() => accountScore(value), throwsFormatException);
    }
  });
}
