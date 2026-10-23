// Checks selected navigation sections for owner and executor detail routes.
// Owns menu and bottom-bar selection semantics across deep links.
// Does not test server access permissions.
import 'package:flutter_test/flutter_test.dart';
import 'navigation_destinations.dart';

void main() {
  test('data items and released storage keep their section', () {
    expect(mobileSection('/item/a?type=PASSWORD'), '/vault');
    expect(sidebarSelected('/vault/PASSWORD', '/item/a?type=PASSWORD'), isTrue);
    expect(sidebarSelected('/vault/NOTE', '/item/a?type=PASSWORD'), isFalse);
    expect(sidebarSelected('/vault/FILE', '/storage?folder=f'), isTrue);
    expect(mobileSection('/executor/grant/category/NOTE'), '/people');
  });
  test('settings tabs and nested people routes keep menu selection', () {
    for (final path in ['/profile', '/backup', '/usage']) {
      expect(mobileSection(path), '/platform');
      expect(sidebarSelected('/settings', path), isTrue);
    }
    expect(sidebarSelected('/beneficiaries', '/beneficiaries/person'), isTrue);
    expect(sidebarSelected('/home', '/guide'), isFalse);
  });
}
