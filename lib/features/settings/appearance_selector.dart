// Provides native light, dark and system appearance controls.
// Owns responsive selection presentation.
// Does not reset the user's saved appearance preference.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'appearance.dart';
import 'appearance_options.dart';

class AppearanceSelector extends ConsumerWidget {
  const AppearanceSelector({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      for (final entry in appearanceOptions)
        ChoiceChip(
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          labelPadding: const EdgeInsets.symmetric(horizontal: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          avatar: Icon(entry.icon, size: 18),
          label: Text(entry.label),
          selected: ref.watch(appearanceProvider) == entry.mode,
          onSelected: (_) =>
              ref.read(appearanceProvider.notifier).select(entry.mode),
        ),
    ],
  );
}
