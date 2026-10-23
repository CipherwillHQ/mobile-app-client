// Mirrors the working web sidebar destinations and mobile section labels.
// Owns menu ordering and selected-section mapping.
// Does not expose unfinished web features or evaluate server permissions.
import 'package:flutter/material.dart';

typedef AppDestination = (String title, String path, IconData icon);
const dashboardDestinations = <AppDestination>[
  ('Home', '/home', Icons.home_outlined),
  ('Guide', '/guide', Icons.auto_awesome_outlined),
  ('Segments', '/preferences', Icons.category_outlined),
  ('Notifications', '/phones', Icons.notifications_none_outlined),
];
const networkDestinations = <AppDestination>[
  ('Beneficiaries', '/beneficiaries', Icons.person_add_alt_outlined),
  ('Friends & Family', '/friends', Icons.people_outline),
];
const platformDestinations = <AppDestination>[
  ('Timeline', '/timeline', Icons.schedule_outlined),
  ('Billing', '/billing', Icons.receipt_long_outlined),
  ('Security Factors', '/factors', Icons.lock_outline),
  ('Settings', '/settings', Icons.tune_outlined),
];
const mobileDestinations = <AppDestination>[
  ('Home', '/home', Icons.apps_outlined),
  ('Data', '/vault', Icons.folder_outlined),
  ('Network', '/people', Icons.people_outline),
  ('Platform', '/platform', Icons.palette_outlined),
];

String mobileSection(String location) {
  final path = Uri.parse(location).path;
  if (['/vault', '/storage', '/file', '/item'].any(path.startsWith)) {
    return '/vault';
  }
  if ([
    '/people',
    '/beneficiaries',
    '/friends',
    '/executor',
    '/granted-access',
  ].any(path.startsWith)) {
    return '/people';
  }
  if (['/home', '/guide', '/score'].contains(path)) return '/home';
  return '/platform';
}

bool sidebarSelected(String destination, String location) {
  final uri = Uri.parse(location);
  if (uri.path.startsWith('/item/') && destination.startsWith('/vault/')) {
    return destination == '/vault/${uri.queryParameters['type'] ?? 'NOTE'}';
  }
  if (destination == '/vault/FILE' &&
      ['/file', '/storage'].any(uri.path.startsWith)) {
    return true;
  }
  if (destination == '/settings' &&
      ['/profile', '/backup', '/usage'].contains(uri.path)) {
    return true;
  }
  return destination == '/home'
      ? uri.path == destination
      : uri.path == destination || uri.path.startsWith('$destination/');
}
