// Adapts existing feature destinations to the shared flat mobile row.
// Owns compatibility with current page labels and contextual details.
// Does not choose destinations or authorize feature actions.
import 'package:flutter/material.dart';
import 'navigation_row.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;
  const FeatureCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.color,
    this.trailing,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) => NavigationRow(
    title: title,
    detail: subtitle,
    icon: icon,
    trailing: trailing,
    onTap: onTap,
  );
}
