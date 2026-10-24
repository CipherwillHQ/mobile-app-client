// Keeps a selected file's real pending-save state beside the storage list.
// Owns concise progress, incomplete-save feedback and the existing retry action.
// Does not invent upload percentages or allocate a new upload identifier.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/navigation_row.dart';

class PendingUploadRow extends StatelessWidget {
  final String name;
  final bool saving;
  final VoidCallback retry;
  const PendingUploadRow({
    super.key,
    required this.name,
    required this.saving,
    required this.retry,
  });
  @override
  Widget build(BuildContext context) => NavigationRow(
    title: name,
    detail: saving ? 'Saving encrypted file…' : 'Save incomplete',
    icon: AppIcons.file,
    trailing: saving
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : TextButton(onPressed: retry, child: const Text('Retry')),
  );
}
