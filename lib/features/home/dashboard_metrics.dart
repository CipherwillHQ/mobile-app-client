// Matches the web Secured Data breakdown using server category counts.
// Owns count labels and the total without oversized metric cards.
// Does not decrypt items or infer account completion.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/remote_panel.dart';
import '../vault/category_counts.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});
  @override
  Widget build(BuildContext context) => RemotePanel(
    operation: 'GET_METAMODEL_TYPE_COUNTS',
    builder: (result) {
      final counts = jsonList(result['getMetamodelTypeCounts']);
      final total = counts.fold<int>(
        0,
        (sum, item) => sum + (item['count'] as int),
      );
      if (total == 0) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  AppIcons.verified,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Secured Data',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  total.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            CategoryCounts(
              counts: counts,
              onSelected: (type) => context.push('/vault/$type'),
            ),
          ],
        ),
      );
    },
  );
}
