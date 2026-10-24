// Checks native parent destinations for existing mobile and web deep links.
// Owns direct-entry hierarchy and owner/executor context regressions.
// Does not authorize reads or replace route-level draft guards.
import 'package:flutter_test/flutter_test.dart';
import 'parent_destination.dart';

void main() {
  test(
    'hubs remain roots and details return to their familiar task location',
    () {
      for (final path in ['/home', '/vault', '/people', '/platform']) {
        expect(parentDestination(path), isNull);
      }
      for (final entry in {
        '/vault/NOTE': '/vault',
        '/item/note': '/vault/NOTE',
        '/item/password?type=PASSWORD': '/vault/PASSWORD',
        '/item/password/sharing?type=PASSWORD': '/item/password?type=PASSWORD',
        '/item/file/sharing?type=FILE': '/file/file',
        '/people/add?friend=true': '/friends',
        '/people/add?friend=false': '/beneficiaries',
        '/beneficiaries/person': '/beneficiaries',
        '/beneficiaries': '/people',
        '/friends': '/people',
        '/profile': '/settings',
        '/backup': '/settings',
        '/usage': '/settings',
        '/account-actions': '/settings',
        '/settings': '/platform',
        '/timeline': '/platform',
        '/billing': '/platform',
        '/factors': '/platform',
        '/upgrade': '/billing',
        '/preferences': '/home',
        '/phones': '/home',
      }.entries) {
        expect(parentDestination(entry.key), entry.value, reason: entry.key);
      }
    },
  );
  test('released items and folders retain executor context', () {
    for (final entry in {
      '/executor': '/people',
      '/executor/grant': '/executor',
      '/executor/grant/category/NOTE': '/executor/grant',
      '/executor/grant/item/record': '/executor/grant',
      '/storage?access=grant': '/executor/grant',
      '/storage?folder=folder&access=grant': '/storage?access=grant',
      '/file/file?access=grant': '/storage?access=grant',
      '/storage?folder=folder': '/storage',
      '/file/file': '/storage',
    }.entries) {
      expect(parentDestination(entry.key), entry.value, reason: entry.key);
    }
  });
}
