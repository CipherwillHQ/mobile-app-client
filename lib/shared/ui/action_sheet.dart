// Presents labeled secondary actions in a native, scrollable sheet.
// Owns safe insets, cancellation and destructive-action styling.
// Does not execute actions or replace feature-level confirmations.
import 'package:flutter/material.dart';

class SheetAction<T> {
  final T value;
  final String label;
  final IconData icon;
  final bool destructive;
  const SheetAction(
    this.value,
    this.label,
    this.icon, {
    this.destructive = false,
  });
}

Future<T?> chooseAction<T>(
  BuildContext context, {
  String? title,
  required List<SheetAction<T>> actions,
}) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (context) => SafeArea(
    top: false,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        12,
        0,
        12,
        MediaQuery.viewInsetsOf(context).bottom + 12,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * .8,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              for (final action in actions)
                ListTile(
                  minTileHeight: 56,
                  leading: Icon(action.icon, size: 22),
                  title: Text(action.label),
                  textColor: action.destructive
                      ? Theme.of(context).colorScheme.error
                      : null,
                  iconColor: action.destructive
                      ? Theme.of(context).colorScheme.error
                      : null,
                  onTap: () => Navigator.of(context).pop(action.value),
                ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);
