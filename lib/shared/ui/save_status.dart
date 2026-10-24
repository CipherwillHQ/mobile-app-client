// Shows the actual draft or server-commit state beside editable content.
// Owns compact status text and accessible announcements for all text assets.
// Does not infer success from local changes or start a save.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';

class SaveStatus extends StatelessWidget {
  final String status;
  const SaveStatus(this.status, {super.key});
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    child: Row(
      children: [
        Icon(
          status == 'Saved'
              ? AppIcons.done
              : status == 'Saving…'
              ? AppIcons.refresh
              : AppIcons.info,
          size: 16,
          color: status.startsWith('Save failed')
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            status,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: status.startsWith('Save failed')
                  ? Theme.of(context).colorScheme.error
                  : null,
            ),
          ),
        ),
      ],
    ),
  );
}
