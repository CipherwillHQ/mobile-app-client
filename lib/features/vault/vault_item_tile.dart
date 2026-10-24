// Presents owner and executor items as compact metadata rows.
// Owns category icons, update dates and a visible read-only indicator.
// Does not read decrypted asset contents.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'category_visuals.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/navigation_row.dart';

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
  Widget build(BuildContext context) => NavigationRow(
    title: title,
    icon: visualFor(type).icon,
    detail: dateLabel(updated),
    trailing: readOnly
        ? const Tooltip(
            message: 'Read-only access',
            child: Icon(AppIcons.lock, size: 18),
          )
        : null,
    onTap: onTap,
  );
}
