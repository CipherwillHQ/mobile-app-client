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
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: active ? const Color(0xff003ecb) : Colors.transparent,
                width: 4,
              ),
            ),
          ),
          child: ListTile(
            dense: true,
            minTileHeight: 48,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: Icon(destination.$3, size: 20),
            title: Text(
              destination.$1,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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
