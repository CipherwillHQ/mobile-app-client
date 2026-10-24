// Verifies installed versus store version comparison across release formats.
// Owns legacy short versions, prereleases, build metadata and invalid input.
// Does not compare Android version codes or query live stores.
import 'package:flutter_test/flutter_test.dart';
import 'store_version.dart';

void main() {
  for (final sample in const [
    ('1.0.0', '1.0.1', true),
    ('1.9.0', '1.10.0', true),
    ('2.0.0', '1.9.0', false),
    ('1.0.0', '1.0.0', false),
    ('1.0.0', '1.0', false),
    ('1.0', '1.0.1', true),
    ('1', '1.0.0', false),
    ('1.0.0-beta.2', '1.0.0', true),
    ('1.0.0', '1.0.0-beta.2', false),
    ('1.0.0+3', '1.0.0+4', false),
    ('bad', '2.0.0', false),
    ('1.0.0', 'bad', false),
    ('1.0.0', '1.1.0.0', false),
  ]) {
    test('${sample.$1} to ${sample.$2}: update ${sample.$3}', () {
      expect(hasNewerStoreVersion(sample.$1, sample.$2), sample.$3);
    });
  }
}
