// Presents the sidebar's three theme modes in one compact icon rail.
// Owns animated selection, labeled tap targets and reduced-motion support.
// Does not change appearance persistence or account state.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/settings/appearance.dart';
import '../features/settings/appearance_options.dart';
import '../shared/ui/motion.dart';

class SidebarThemeSwitcher extends ConsumerWidget {
  const SidebarThemeSwitcher({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(appearanceProvider);
    final theme = Theme.of(context);
    final index = appearanceOptions.indexWhere((entry) => entry.mode == mode);
    return Container(
      width: 156,
      height: 56,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border.all(color: theme.colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedAlign(
            alignment: Alignment(index - 1.0, 0),
            duration: AppMotion.reduced(context)
                ? Duration.zero
                : const Duration(milliseconds: 160),
            curve: Curves.easeOutCubic,
            child: FractionallySizedBox(
              widthFactor: 1 / appearanceOptions.length,
              heightFactor: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .04),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              for (final entry in appearanceOptions)
                Expanded(
                  child: IconButton(
                    key: ValueKey('sidebar-theme-${entry.mode.name}'),
                    isSelected: mode == entry.mode,
                    tooltip: entry.label,
                    onPressed: () => ref
                        .read(appearanceProvider.notifier)
                        .select(entry.mode),
                    style: IconButton.styleFrom(
                      minimumSize: const Size(48, 48),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    icon: Icon(
                      entry.icon,
                      size: 20,
                      color: mode == entry.mode
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
