// Shows one read-only type count in the data breakdown.
// Owns single-line labels, full-label tooltips and aligned numeric values.
// Does not load counts or navigate to individual records.
import 'package:flutter/material.dart';

class DataRecordsCountRow extends StatelessWidget {
  final String label;
  final int count;
  const DataRecordsCountRow({
    super.key,
    required this.label,
    required this.count,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
          child: Tooltip(
            message: label,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          '$count',
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
