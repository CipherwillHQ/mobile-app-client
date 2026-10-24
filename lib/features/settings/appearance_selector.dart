// Provides native light, dark and system appearance controls.
// Owns responsive selection presentation.
// Does not reset the user's saved appearance preference.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'appearance.dart';

class AppearanceSelector extends ConsumerWidget {
  const AppearanceSelector({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      for (final entry in const [
        (ThemeMode.system, 'System', AppIcons.system),
        (ThemeMode.light, 'Light', AppIcons.light),
        (ThemeMode.dark, 'Dark', AppIcons.dark),
      ])
        ChoiceChip(
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          avatar: Icon(entry.$3, size: 18),
          label: Text(entry.$2),
          selected: ref.watch(appearanceProvider) == entry.$1,
          onSelected: (_) =>
              ref.read(appearanceProvider.notifier).select(entry.$1),
        ),
    ],
  );
}
