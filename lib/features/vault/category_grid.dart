// Displays enabled and restricted vault categories as responsive native cards.
// Owns category presentation, filtering and navigation affordances.
// Does not override account restrictions or encrypt records.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/icon_badge.dart';
import '../../shared/ui/empty_state.dart';
import 'categories.dart';
import 'category_visuals.dart';
import 'asset_category.dart';

class CategoryGrid extends StatelessWidget {
  final Json preferences;
  final Map<String, int> counts;
  final String query;
  const CategoryGrid({
    super.key,
    required this.preferences,
    required this.counts,
    this.query = '',
  });
  @override
  Widget build(BuildContext context) {
    final visible = categories
        .where(
          (category) =>
              category.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    if (visible.isEmpty) {
      return const EmptyState(
        title: 'No matching categories',
        message: 'Try another category name.',
        icon: Icons.search_rounded,
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns =
            constraints.maxWidth >= 320 &&
                MediaQuery.textScalerOf(context).scale(14) <= 20
            ? 2
            : 1;
        final width = (constraints.maxWidth - (columns - 1) * 12) / columns;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final category in visible)
              SizedBox(
                width: width,
                child: CategoryTile(
                  category: category,
                  enabled:
                      category.preference == null ||
                      preferences[category.preference] == true,
                  count: counts[category.type],
                ),
              ),
          ],
        );
      },
    );
  }
}

class CategoryTile extends StatelessWidget {
  final AssetCategory category;
  final bool enabled;
  final int? count;
  const CategoryTile({
    super.key,
    required this.category,
    required this.enabled,
    this.count,
  });
  @override
  Widget build(BuildContext context) {
    final visual = visualFor(category.type);
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.push('/vault/' + category.type),
        child: Container(
          constraints: const BoxConstraints(minHeight: 206),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconBadge(visual.icon, color: visual.color),
                  const Spacer(),
                  Icon(
                    Icons.arrow_outward_rounded,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                category.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text(
                visual.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Text(
                !enabled
                    ? 'Enable in Settings'
                    : count != null
                    ? '$count ${count == 1 ? 'item' : 'items'}'
                    : category.premium
                    ? 'Premium category'
                    : 'Included in your vault',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
