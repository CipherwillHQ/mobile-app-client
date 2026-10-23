// Shows consistent item metadata in owner and executor lists.
// Owns category icon, date label and navigation feedback.
// Does not read encrypted item contents.
import 'package:flutter/material.dart';
import 'category_visuals.dart';
import '../../shared/ui/feature_card.dart';
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
  Widget build(BuildContext context) => FeatureCard(
    title: title,
    subtitle: readOnly
        ? 'Read-only · ' + dateLabel(updated)
        : 'Updated ' + dateLabel(updated),
    icon: visualFor(type).icon,
    color: visualFor(type).color,
    onTap: onTap,
  );
}
