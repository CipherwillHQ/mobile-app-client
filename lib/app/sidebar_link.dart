// Renders a compact web-style sidebar destination.
// Owns active selection, accessible labels and drawer-close navigation.
// Does not bypass the account gate when changing pages.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_destinations.dart';

class SidebarLink extends StatelessWidget {
  final AppDestination destination;
  final String location;
  const SidebarLink({
    super.key,
    required this.destination,
    required this.location,
  });
  @override
  Widget build(BuildContext context) {
    final active = sidebarSelected(destination.$2, location);
    return Semantics(
      selected: active,
      child: Material(
        color: active
            ? Theme.of(context).colorScheme.primaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: ListTile(
            minTileHeight: 48,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(
              destination.$3,
              size: 20,
              color: active ? Theme.of(context).colorScheme.primary : null,
            ),
            title: Text(
              destination.$1,
              style: TextStyle(
                fontSize: 14,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                color: active ? Theme.of(context).colorScheme.primary : null,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              context.go(destination.$2);
            },
          ),
        ),
      ),
    );
  }
}
