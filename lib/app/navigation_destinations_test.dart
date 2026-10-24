// Checks sidebar selection for owner and executor detail routes.
// Owns selected-page semantics across existing deep links.
// Does not test server access permissions.
import 'package:flutter_test/flutter_test.dart';
import 'navigation_destinations.dart';

void main() {
  test('data items and released storage keep their section', () {
    expect(sidebarSelected('/vault/PASSWORD', '/item/a?type=PASSWORD'), isTrue);
    expect(sidebarSelected('/vault/NOTE', '/item/a?type=PASSWORD'), isFalse);
    expect(sidebarSelected('/vault/FILE', '/storage?folder=f'), isTrue);
    expect(
      sidebarSelected('/executor', '/executor/grant/category/NOTE'),
      isTrue,
    );
  });
  test('settings tabs and nested people routes keep menu selection', () {
    for (final path in ['/profile', '/backup', '/usage']) {
      expect(sidebarSelected('/settings', path), isTrue);
    }
    expect(sidebarSelected('/beneficiaries', '/beneficiaries/person'), isTrue);
    expect(sidebarSelected('/home', '/guide'), isFalse);
  });
}
