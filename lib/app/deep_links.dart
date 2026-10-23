// Translates existing Cipherwill web links into native navigation.
// Owns route aliases and safe identifier/query encoding.
// Does not grant access or process Firebase action codes.

const webAssetTypes = {
  'notes': 'NOTE',
  'passwords': 'PASSWORD',
  'email-accounts': 'EMAIL_ACCOUNT',
  'device-locks': 'DEVICE_LOCK',
  'bank-accounts': 'BANK_ACCOUNT',
  'payment-cards': 'PAYMENT_CARD',
  'seed-phrases': 'SEED_PHRASE',
  'defi-staking': 'DEFI_STAKING',
};

const webPageRoutes = {
  'beneficiaries': '/beneficiaries',
  'friends': '/friends',
  'network': '/people',
  'platform': '/platform',
  'factors': '/factors',
  'backup': '/backup',
  'timeline': '/timeline',
  'guide': '/guide',
  'score': '/score',
  'profile': '/profile',
  'segments': '/preferences',
  'notifications': '/phones',
  'billing': '/billing',
};

String nativeLocation(List<String> segments, {Map<String, String>? query}) =>
    Uri(
      pathSegments: ['', ...segments],
      queryParameters: query == null || query.isEmpty ? null : query,
    ).toString();

String? cipherwillLocation(Uri uri) {
  if (uri.hasScheme &&
      uri.scheme != 'cipherwill' &&
      (uri.scheme != 'https' ||
          !{
            'cipherwill.com',
            'www.cipherwill.com',
            'auth.cipherwill.com',
          }.contains(uri.host))) {
    return '/unavailable-link';
  }
  final segments = [
    if (uri.scheme == 'cipherwill' && uri.host.isNotEmpty) uri.host,
    ...uri.pathSegments,
  ];
  if (segments.isNotEmpty && segments.last.isEmpty) segments.removeLast();
  final path = '/' + segments.join('/');
  final type = uri.queryParameters['type'];
  if ((segments.firstOrNull == 'vault' &&
          segments.length == 2 &&
          !webAssetTypes.containsValue(segments[1]) &&
          segments[1] != 'FILE') ||
      (segments.firstOrNull == 'item' &&
          type != null &&
          !webAssetTypes.containsValue(type)) ||
      (segments.firstOrNull == 'executor' &&
          segments.length == 4 &&
          segments[2] == 'category' &&
          !webAssetTypes.containsValue(segments[3]) &&
          segments[3] != 'FILE')) {
    return '/unavailable-link';
  }
  if ({
    '/auth',
    '/auth/verify-email',
    '/auth/action',
    '/__/auth/action',
    '/auth-action',
  }.contains(path)) {
    final code = uri.queryParameters['oobCode'];
    final mode = uri.queryParameters['mode'];
    if (code != null && code.isNotEmpty && mode != null && mode.isNotEmpty) {
      final location = nativeLocation(
        ['auth-action'],
        query: {'mode': mode, 'oobCode': code},
      );
      return location == uri.toString() ? null : location;
    }
    return path == '/auth-action' ? null : '/home';
  }
  if (path == '/' || path == '/wallet' || path == '/login') return '/home';
  if (segments.firstOrNull == 'app') {
    if (segments.length == 1) return '/home';
    if (segments.length == 2) {
      if (segments[1] == 'data') return '/vault';
      if (segments[1] == 'settings') {
        return switch (uri.queryParameters['tab']?.toLowerCase()) {
          'profile' => '/profile',
          'backup' => '/backup',
          'usage' => '/usage',
          _ => '/settings',
        };
      }
      return webPageRoutes[segments[1]];
    }
    if (segments[1] == 'beneficiaries' && segments.length == 3) {
      return nativeLocation(['beneficiaries', segments[2]]);
    }
    if (segments[1] == 'data') {
      return ownerAssetLocation(segments.sublist(2));
    }
  }
  if (segments.firstOrNull == 'executor' && segments.length >= 3) {
    return executorAssetLocation(segments[1], segments.sublist(2));
  }
  if (uri.scheme == 'cipherwill') {
    final location = nativeLocation(segments, query: uri.queryParameters);
    return location == uri.toString() ? null : location;
  }
  return null;
}

String? ownerAssetLocation(List<String> segments) {
  final type = webAssetTypes[segments.first];
  if (type != null) {
    if (segments.length == 1) return nativeLocation(['vault', type]);
    if (segments.length == 2) {
      return nativeLocation(['item', segments[1]], query: {'type': type});
    }
  }
  if (segments.first == 'storage') {
    if (segments.length == 1) return '/storage';
    if (segments.length == 2) {
      return segments[1] == 'folder'
          ? '/storage'
          : nativeLocation(['file', segments[1]]);
    }
    if (segments.length == 3 && segments[1] == 'folder') {
      return nativeLocation(['storage'], query: {'folder': segments[2]});
    }
  }
  return null;
}

String? executorAssetLocation(String access, List<String> segments) {
  final type = webAssetTypes[segments.first];
  if (type != null) {
    if (segments.length == 1) {
      return nativeLocation(['executor', access, 'category', type]);
    }
    if (segments.length == 2) {
      return nativeLocation(['executor', access, 'item', segments[1]]);
    }
  }
  if (segments.first == 'storage') {
    if (segments.length == 1 ||
        (segments.length == 2 && {'folder', 'object'}.contains(segments[1]))) {
      return nativeLocation(['storage'], query: {'access': access});
    }
    if (segments.length == 3 && segments[1] == 'folder') {
      return nativeLocation(
        ['storage'],
        query: {'access': access, 'folder': segments[2]},
      );
    }
    if (segments.length == 3 && segments[1] == 'object') {
      return nativeLocation(['file', segments[2]], query: {'access': access});
    }
  }
  return null;
}
