// Presents a compact destination within a settings group.
// Owns icon, label, description and navigation affordance.
// Does not load data or grant access to a feature.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/navigation_row.dart';

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
  Widget build(BuildContext context) => NavigationRow(
    icon: icon,
    title: title,
    detail: description,
    onTap: () => context.push(route),
  );
}
