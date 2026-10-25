// Grows the Data records pill inside its parent with a subtle shadow.
// Owns the shared surface, size transition and collapse row below the counts.
// Does not measure surrounding controls or manage routes.
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../core/api/json_values.dart';
import 'data_records_breakdown.dart';

class DataRecordsPillMenu extends StatelessWidget {
  final int count;
  final List<Json> typeCounts;
  final Size originalSize;
  final Animation<double> animation;
  final VoidCallback close, seeSegments;
  const DataRecordsPillMenu({
    super.key,
    required this.count,
    required this.typeCounts,
    required this.originalSize,
    required this.animation,
    required this.close,
    required this.seeSegments,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) => AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          final progress = Curves.easeOutCubic.transform(animation.value);
          final width = math.min(
            math.max(256, originalSize.width),
            constraints.maxWidth,
          );
          return Container(
            width: lerpDouble(originalSize.width, width, progress),
            decoration: BoxDecoration(
              color:
                  theme.chipTheme.backgroundColor ?? theme.colorScheme.surface,
              border: Border.all(
                color:
                    theme.chipTheme.side?.color ??
                    theme.colorScheme.outlineVariant,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .08 * progress),
                  blurRadius: 14 * progress,
                  offset: Offset(0, 4 * progress),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizeTransition(
                      sizeFactor: animation.drive(
                        CurveTween(curve: Curves.easeOutCubic),
                      ),
                      axisAlignment: 1,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 280),
                        child: DataRecordsBreakdown(
                          typeCounts: typeCounts,
                          seeSegments: seeSegments,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: originalSize.height - 2,
                      child: Tooltip(
                        message: 'Close data breakdown',
                        child: InkWell(
                          onTap: close,
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    '$count Data records',
                                    style:
                                        theme.chipTheme.labelStyle ??
                                        theme.textTheme.labelLarge,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(TablerIcons.chevron_down, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
