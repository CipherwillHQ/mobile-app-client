// Presents a compact destination within a settings group.
// Owns icon, label, description and navigation affordance.
// Does not load data or grant access to a feature.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsDestination extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  const SettingsDestination(
    this.title,
    this.description,
    this.icon,
    this.route, {
    super.key,
  });
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    minVerticalPadding: 12,
    leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
    title: Text(title),
    subtitle: Text(description),
    trailing: const Icon(Icons.chevron_right_rounded, size: 20),
    onTap: () => context.push(route),
  );
}
