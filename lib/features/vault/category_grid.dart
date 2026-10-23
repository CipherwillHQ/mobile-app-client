// Matches the web Manage Data page's enabled segment groups.
// Owns compact category tiles and preference-aware ordering.
// Does not change plan restrictions or decrypt records.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/destination_grid.dart';
import 'category_sections.dart';
import 'category_visuals.dart';

class CategoryGrid extends StatelessWidget {
  final Json preferences;
  const CategoryGrid({super.key, required this.preferences});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (final section in categorySections)
        if (enabledCategories(preferences, section.$2).isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Text(
              section.$1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          DestinationGrid(
            destinations: [
              for (final category in enabledCategories(preferences, section.$2))
                (
                  category.title,
                  '/vault/${category.type}',
                  visualFor(category.type).icon,
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
    ],
  );
}
