// Displays a concise state alongside an explicit icon and label.
// Owns compact status presentation in headers and forms.
// Does not determine whether content is encrypted or saved.
import 'package:flutter/material.dart';
import '../../app/design_tokens.dart';

class StatusPill extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const StatusPill(
    this.label, {
    super.key,
    this.icon = Icons.shield_outlined,
    this.color = CipherwillColors.sage,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
    decoration: BoxDecoration(
      color: color.withValues(alpha: .1),
      borderRadius: BorderRadius.circular(40),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).brightness == Brightness.dark
              ? Color.lerp(color, Colors.white, .45)
              : color,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
