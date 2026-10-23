// Matches flat web notes rows and compact cards for other data types.
// Owns owner/executor metadata labels and accessible navigation.
// Does not read decrypted asset contents.
import 'package:flutter/material.dart';
import 'category_visuals.dart';
import '../../shared/date_label.dart';

class VaultItemTile extends StatelessWidget {
  final String title;
  final String type;
  final Object? updated;
  final bool readOnly;
  final VoidCallback onTap;
  const VaultItemTile({
    super.key,
    required this.title,
    required this.type,
    this.updated,
    this.readOnly = false,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final note = type == 'NOTE';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: note ? 2 : 6),
      child: Material(
        color: note ? Colors.transparent : Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(note ? 8 : 16),
          side: note
              ? BorderSide.none
              : BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    if (!note) ...[
                      Icon(visualFor(type).icon, size: 18),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (readOnly) const Icon(Icons.lock_outline, size: 16),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  (readOnly
                          ? 'Read-only · '
                          : note
                          ? ''
                          : 'Updated ') +
                      dateLabel(updated),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
