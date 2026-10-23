// Matches the web Secured Data breakdown using server category counts.
// Owns count labels and the total without oversized metric cards.
// Does not decrypt items or infer account completion.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/remote_panel.dart';
import '../vault/categories.dart';

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
                  Icons.verified_user_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  'Secured Data',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text("You've secured ${counts.length} types of data"),
            const SizedBox(height: 12),
            for (final item in counts)
              InkWell(
                onTap: () => context.push('/vault/${item['type']}'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          categories
                                  .where((c) => c.type == item['type'])
                                  .firstOrNull
                                  ?.title ??
                              item['type'].toString().replaceAll('_', ' '),
                        ),
                      ),
                      Text(
                        item['count'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            const Divider(),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Total Secured Data Points',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  total.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
