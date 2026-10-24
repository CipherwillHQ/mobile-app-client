// Presents contextual guidance as a flat web-style page notice.
// Owns compact icon, title and explanatory text spacing.
// Does not make security or release decisions.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';

class GuidePanel extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  const GuidePanel({
    super.key,
    required this.title,
    required this.message,
    this.icon = AppIcons.tip,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 22,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
