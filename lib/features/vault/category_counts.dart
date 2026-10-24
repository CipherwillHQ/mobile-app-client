// Presents existing category counts in compact, neutral mobile rows.
// Owns responsive count layout shared by Dashboard and beneficiary details.
// Does not derive counts or change category permissions.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../core/api/json_values.dart';
import 'categories.dart';
import 'category_visuals.dart';

class CategoryCounts extends StatelessWidget {
  final List<Json> counts;
  final ValueChanged<String>? onSelected;
  const CategoryCounts({super.key, required this.counts, this.onSelected});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = MediaQuery.textScalerOf(context).scale(13) > 20 ? 1 : 2;
      final width = (constraints.maxWidth - (columns - 1) * 12) / columns;
      return Wrap(
        spacing: 12,
        runSpacing: 4,
        children: [
          for (final count in counts)
            SizedBox(
              width: width,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: onSelected == null
                      ? null
                      : () => onSelected!(count['type']),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          categoryVisuals[count['type']]?.icon ?? AppIcons.file,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            categories
                                    .where(
                                      (category) =>
                                          category.type == count['type'],
                                    )
                                    .firstOrNull
                                    ?.title ??
                                count['type'],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          count['count'].toString(),
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
