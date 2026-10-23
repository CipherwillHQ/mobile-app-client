// Checks readable storage labels against the backend string contract.
// Owns unit conversion and unavailable-value coverage.
// Does not mock storage authorization.
import 'package:flutter_test/flutter_test.dart';
import 'byte_label.dart';

void main() {
  test('formats separate byte counters', () {
    expect(byteLabel('0'), '0 B');
    expect(byteLabel('1024'), '1.00 KB');
    expect(byteLabel('1048576'), '1.00 MB');
    expect(byteLabel('1073741824'), '1.00 GB');
    expect(byteLabel({}), 'Unavailable');
    expect(byteLabel('-1'), 'Unavailable');
  });
}
