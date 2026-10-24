// Presents a single preference choice in a native mobile sheet.
// Owns selected semantics, scrollable options and accessible dismissal.
// Does not save values or enforce feature permissions.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import 'motion.dart';

Future<String?> chooseValue(
  BuildContext context, {
  required String title,
  required String description,
  required Map<String, String> options,
  required String selected,
}) => showModalBottomSheet<String>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  sheetAnimationStyle: AnimationStyle(
    duration: AppMotion.duration(context),
    reverseDuration: AppMotion.duration(context),
  ),
  builder: (_) => ChoiceSheet(
    title: title,
    description: description,
    options: options,
    selected: selected,
  ),
);

class ChoiceSheet extends StatelessWidget {
  final String title, description, selected;
  final Map<String, String> options;
  const ChoiceSheet({
    super.key,
    required this.title,
    required this.description,
    required this.options,
    required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          0,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 16,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * .8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Semantics(
                      header: true,
                      child: Text(title, style: theme.textTheme.titleLarge),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close selection',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(AppIcons.close),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        description,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    for (final option in options.entries)
                      Container(
                        decoration: BoxDecoration(
                          color: option.key == selected
                              ? theme.colorScheme.primary.withValues(alpha: .07)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          minTileHeight: 56,
                          title: Text(option.value),
                          selected: option.key == selected,
                          selectedColor: theme.colorScheme.primary,
                          trailing: option.key == selected
                              ? const Icon(AppIcons.check, size: 20)
                              : null,
                          onTap: () => Navigator.of(context).pop(option.key),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
