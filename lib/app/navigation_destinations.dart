// Mirrors the working web sidebar destinations with native mobile icons.
// Owns menu ordering and selected-page mapping.
// Does not expose unfinished web features or evaluate server permissions.
import 'app_icons.dart';
import 'package:flutter/material.dart';

typedef AppDestination = (String title, String path, IconData icon);
const dashboardDestinations = <AppDestination>[
  ('Home', '/home', AppIcons.home),
  ('Guide', '/guide', AppIcons.guide),
  ('Segments', '/preferences', AppIcons.segments),
  ('Notifications', '/phones', AppIcons.notifications),
];
const networkDestinations = <AppDestination>[
  ('Beneficiaries', '/beneficiaries', AppIcons.addPerson),
  ('Friends & Family', '/friends', AppIcons.people),
];
const platformDestinations = <AppDestination>[
  ('Timeline', '/timeline', AppIcons.timeline),
  ('Billing', '/billing', AppIcons.billing),
  ('Security Factors', '/factors', AppIcons.lock),
  ('Settings', '/settings', AppIcons.settings),
];
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
