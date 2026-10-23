// Gives sensitive tasks a calm, contextual explanation.
// Owns the web-inspired clay guide treatment and accessible label.
// Does not make security or release decisions.
import 'package:flutter/material.dart';
import '../../app/design_tokens.dart';
import 'icon_badge.dart';

class GuidePanel extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  const GuidePanel({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.lightbulb_outline_rounded,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: CipherwillColors.clay.withValues(alpha: .08),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconBadge(icon, color: CipherwillColors.clay, size: 38),
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
