// Checks existing web links preserve native destinations and identifiers.
// Owns URI translation regression coverage for cold and warm links.
// Does not bypass account gates or claim device domain association.

import 'package:flutter_test/flutter_test.dart';
import 'deep_links.dart';

void main() {
  test('all owner web category and item links translate', () {
    for (final entry in webAssetTypes.entries) {
      expect(
        cipherwillLocation(Uri.parse('/app/data/${entry.key}')),
        '/vault/${entry.value}',
      );
      final location = Uri.parse(
        cipherwillLocation(
          Uri.parse('/app/data/${entry.key}/record%2Fone?new=true'),
        )!,
      );
      expect(location.pathSegments, ['item', 'record/one']);
      expect(location.queryParameters, {'type': entry.value});
    }
  });
  test('all executor category and item links retain grant and item IDs', () {
    for (final entry in webAssetTypes.entries) {
      expect(
        cipherwillLocation(Uri.parse('/executor/grant/${entry.key}')),
        '/executor/grant/category/${entry.value}',
      );
      final location = Uri.parse(
        cipherwillLocation(
          Uri.parse('/executor/grant%2Fone/${entry.key}/record%3Fone'),
        )!,
      );
      expect(location.pathSegments, [
        'executor',
        'grant/one',
        'item',
        'record?one',
      ]);
    }
  });
  test('owner storage files and folders preserve escaped IDs', () {
    expect(cipherwillLocation(Uri.parse('/app/data/storage')), '/storage');
    expect(
      cipherwillLocation(Uri.parse('/app/data/storage/folder')),
      '/storage',
    );
    expect(
      cipherwillLocation(Uri.parse('/app/data/storage/file%20one')),
      '/file/file%20one',
    );
    final location = Uri.parse(
      cipherwillLocation(Uri.parse('/app/data/storage/folder/folder%26one'))!,
    );
    expect(location.path, '/storage');
    expect(location.queryParameters, {'folder': 'folder&one'});
  });
  test('executor storage paths preserve grant scope', () {
    expect(
      cipherwillLocation(Uri.parse('/executor/grant/storage')),
      '/storage?access=grant',
    );
    for (final part in ['folder', 'object']) {
      expect(
        cipherwillLocation(Uri.parse('/executor/grant/storage/$part')),
        '/storage?access=grant',
      );
      final location = Uri.parse(
        cipherwillLocation(
          Uri.parse('/executor/grant%26one/storage/$part/file%3Fone'),
        )!,
      );
      expect(location.queryParameters['access'], 'grant&one');
      if (part == 'folder') {
        expect(location.queryParameters['folder'], 'file?one');
      } else {
        expect(location.pathSegments, ['file', 'file?one']);
      }
    }
  });
  test('web pages and settings tabs have native destinations', () {
    expect(cipherwillLocation(Uri.parse('/app')), '/home');
    expect(cipherwillLocation(Uri.parse('/app/data/')), '/vault');
    for (final entry in webPageRoutes.entries) {
      expect(cipherwillLocation(Uri.parse('/app/${entry.key}')), entry.value);
    }
    expect(
      cipherwillLocation(Uri.parse('/app/beneficiaries/person%2Fone')),
      '/beneficiaries/person%2Fone',
    );
    expect(
      cipherwillLocation(Uri.parse('/app/settings?tab=profile')),
      '/profile',
    );
    expect(
      cipherwillLocation(Uri.parse('/app/settings?tab=backup')),
      '/backup',
    );
    expect(cipherwillLocation(Uri.parse('/app/settings')), '/settings');
    expect(cipherwillLocation(Uri.parse('/app/settings?tab=usage')), '/usage');
  });
  test(
    'verification returns use the account gate without requiring a code',
    () {
      for (final link in [
        '/auth',
        '/auth/verify-email',
        '/login',
        'https://www.cipherwill.com/auth/verify-email',
      ]) {
        expect(cipherwillLocation(Uri.parse(link)), '/home');
      }
    },
  );
  test('Firebase action codes route separately and do not loop', () {
    final location = cipherwillLocation(
      Uri.parse(
        'https://auth.cipherwill.com/__/auth/action?mode=resetPassword'
        '&oobCode=code%2Bone&apiKey=public&continueUrl=https%3A%2F%2Fcipherwill.com',
      ),
    )!;
    final uri = Uri.parse(location);
    expect(uri.path, '/auth-action');
    expect(uri.queryParameters, {
      'mode': 'resetPassword',
      'oobCode': 'code+one',
    });
    expect(cipherwillLocation(uri), isNull);
    expect(
      cipherwillLocation(Uri.parse('/auth?mode=verifyEmail&oobCode=verify')),
      '/auth-action?mode=verifyEmail&oobCode=verify',
    );
  });
  test('custom scheme wallet and native destinations do not loop', () {
    expect(cipherwillLocation(Uri.parse('cipherwill://wallet')), '/home');
    expect(
      cipherwillLocation(Uri.parse('cipherwill://executor/grant')),
      '/executor/grant',
    );
    expect(
      cipherwillLocation(Uri.parse('cipherwill://app/data/notes/record')),
      '/item/record?type=NOTE',
    );
    expect(cipherwillLocation(Uri.parse('/executor/grant')), isNull);
    expect(cipherwillLocation(Uri.parse('/vault/NOTE')), isNull);
    expect(cipherwillLocation(Uri.parse('/item/record?type=NOTE')), isNull);
  });
  test(
    'unsupported paths and unrelated hosts cannot alias protected routes',
    () {
      for (final link in [
        '/app/chat',
        '/app/wishes',
        '/app/end-of-life',
        '/hq',
        '/pricing',
        '/app/data/notes/record/unknown',
      ]) {
        expect(cipherwillLocation(Uri.parse(link)), isNull);
      }
      for (final link in [
        '/vault/INVALID',
        '/item/record?type=INVALID',
        '/executor/grant/category/INVALID',
      ]) {
        expect(cipherwillLocation(Uri.parse(link)), '/unavailable-link');
      }
      expect(
        cipherwillLocation(Uri.parse('https://example.com/app/data/notes')),
        '/unavailable-link',
      );
      expect(
        cipherwillLocation(Uri.parse('http://cipherwill.com/app')),
        '/unavailable-link',
      );
    },
  );
}
