// Checks title search without touching encrypted asset contents.
// Owns case, whitespace and nonmatching-label regression coverage.
// Does not issue additional page requests.
import 'package:flutter_test/flutter_test.dart';
import 'metadata_search.dart';

void main() {
  test('searches both web title and name metadata', () {
    expect(
      metadataMatches({'metadata': '{"title":"Family note"}'}, ' FAMILY '),
      true,
    );
    expect(
      metadataMatches({'metadata': '{"name":"Email account"}'}, 'mail'),
      true,
    );
    expect(
      metadataMatches({'metadata': '{"name":"Email account"}'}, 'bank'),
      false,
    );
  });
}
