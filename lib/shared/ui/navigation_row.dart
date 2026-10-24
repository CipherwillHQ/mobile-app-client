// Renders flat mobile rows for destinations, people and vault metadata.
// Owns growing touch targets, optional details and consistent trailing controls.
// Does not fetch data or implement the row's action.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';

class NavigationRow extends StatelessWidget {
  final String title;
  final String? detail;
  final IconData? icon;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  const NavigationRow({
    super.key,
    required this.title,
    this.detail,
    this.icon,
    this.leading,
    this.trailing,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10),
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: detail?.isNotEmpty == true ? 64 : 56,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: Row(
          children: [
            if (leading != null || icon != null) ...[
              leading ?? Icon(icon, size: 22),
              const SizedBox(width: 14),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  if (detail?.isNotEmpty == true) ...[
                    const SizedBox(height: 3),
                    Text(detail!, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ],
              ),
            ),
            if (trailing != null || onTap != null) ...[
              const SizedBox(width: 8),
              trailing ?? const Icon(AppIcons.next, size: 18),
            ],
          ],
        ),
      ),
    ),
  );
}
