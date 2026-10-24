// Shows a compact, nondismissible store-update action at the app's bottom.
// Owns theme-aware presentation and large-text reflow.
// Does not detect updates or cover the page's own footer controls.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';

class UpdateBar extends StatelessWidget {
  final bool busy;
  final VoidCallback onUpdate;
  const UpdateBar({super.key, required this.busy, required this.onUpdate});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final message = Semantics(
      liveRegion: true,
      child: Row(
        children: [
          Icon(AppIcons.download, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'New update available',
              style: theme.textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
    final button = FilledButton(
      onPressed: busy ? null : onUpdate,
      child: Text(busy ? 'Opening…' : 'Update'),
    );
    return Material(
      color: theme.colorScheme.primaryContainer,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: theme.colorScheme.outlineVariant),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Center(
            heightFactor: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) =>
                      MediaQuery.textScalerOf(context).scale(13) > 22
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            message,
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: button,
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(child: message),
                            const SizedBox(width: 12),
                            button,
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
