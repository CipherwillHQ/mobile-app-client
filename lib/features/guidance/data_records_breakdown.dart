// Shows count-only rows inside the expanded Data records pill.
// Owns a three-row scrolling viewport, the empty state and segments link.
// Does not draw a separate card or load encrypted record contents.
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../app/app_icons.dart';
import '../../core/api/json_values.dart';
import '../vault/categories.dart';
import 'data_records_count_row.dart';

class DataRecordsBreakdown extends StatelessWidget {
  final List<Json> typeCounts;
  final VoidCallback seeSegments;
  const DataRecordsBreakdown({
    super.key,
    required this.typeCounts,
    required this.seeSegments,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final saved = typeCounts
        .where((item) => (item['count'] as int) > 0)
        .toList();
    final rowStyle = theme.textTheme.labelLarge!;
    final rowHeight =
        (MediaQuery.textScalerOf(context).scale(rowStyle.fontSize!) *
                (rowStyle.height ?? 1.2))
            .ceilToDouble() +
        16;
    final rows = Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: saved.isEmpty
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('No data records yet.'),
            )
          : SizedBox(
              height: rowHeight * math.min(3, saved.length),
              child: Scrollbar(
                interactive: false,
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (final item in saved)
                        SizedBox(
                          height: rowHeight,
                          child: DataRecordsCountRow(
                            label:
                                categories
                                    .where(
                                      (category) =>
                                          category.type == item['type'],
                                    )
                                    .firstOrNull
                                    ?.title ??
                                item['type'].toString().replaceAll('_', ' '),
                            count: item['count'] as int,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
    );
    final link = TextButton(
      onPressed: seeSegments,
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.onSurfaceVariant,
        textStyle: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w400,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: const Row(
        children: [
          Expanded(child: Text('See all segments')),
          SizedBox(width: 8),
          Icon(AppIcons.next, size: 14),
        ],
      ),
    );
    return Semantics(
      label: 'Data breakdown',
      explicitChildNodes: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final scrollAll =
              constraints.maxHeight < 140 ||
              MediaQuery.textScalerOf(context).scale(14) > 28;
          final content = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (scrollAll) rows else Flexible(child: rows),
              link,
            ],
          );
          return scrollAll ? SingleChildScrollView(child: content) : content;
        },
      ),
    );
  }
}
