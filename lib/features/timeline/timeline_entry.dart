// Draws one editable stage on a continuous, flat planning rail.
// Owns stage icons, date transitions and an accessible whole-row action.
// Does not calculate dates or change reminder preferences.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/motion.dart';

class TimelineEntry extends StatelessWidget {
  final String title, date, interval;
  final IconData icon;
  final Color accent;
  final bool first, last;
  final VoidCallback? onTap;
  const TimelineEntry({
    super.key,
    required this.title,
    required this.date,
    required this.interval,
    required this.icon,
    required this.accent,
    required this.first,
    required this.last,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: 'Edit ${title.toLowerCase()} interval',
      child: Semantics(
        button: true,
        enabled: onTap != null,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Stack(
              children: [
                Positioned(
                  left: 15.5,
                  top: first ? 28 : 0,
                  bottom: last ? null : 0,
                  height: last ? 28 : null,
                  width: 1,
                  child: ColoredBox(color: theme.colorScheme.outlineVariant),
                ),
                Container(
                  constraints: const BoxConstraints(minHeight: 80),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.alphaBlend(
                            accent.withValues(alpha: .1),
                            theme.colorScheme.surface,
                          ),
                        ),
                        child: Icon(icon, size: 18, color: accent),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            AnimatedSwitcher(
                              duration: AppMotion.duration(context),
                              child: Align(
                                key: ValueKey('$date-$interval'),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '$date · $interval',
                                  style: theme.textTheme.bodySmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 4, 0),
                        child: Icon(
                          AppIcons.edit,
                          size: 16,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
