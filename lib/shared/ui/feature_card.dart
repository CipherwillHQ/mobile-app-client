// Presents a flat, labeled web-style row with a clear touch target.
// Owns compact destination hierarchy and clear navigation feedback.
// Does not implement navigation or feature authorization.
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const SizedBox(width: 6),
            trailing ??
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 18,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ],
        ),
      ),
    ),
  );
}
