// Shows real server-provided vault counts and account score.
// Owns responsive metric cards and accessible number animation.
// Does not invent progress percentages or decrypt asset contents.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/icon_badge.dart';
import '../../shared/ui/motion.dart';
import '../../app/design_tokens.dart';
import 'account_score.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final stacked =
          constraints.maxWidth < 320 ||
          MediaQuery.textScalerOf(context).scale(14) > 21;
      final children = [
        RemotePanel(
          operation: 'GET_METAMODEL_TYPE_COUNTS',
          builder: (result) => MetricCard(
            label: 'Vault items',
            value: jsonList(
              result['getMetamodelTypeCounts'],
            ).fold<int>(0, (total, item) => total + (item['count'] as int)),
            icon: Icons.inventory_2_outlined,
            color: CipherwillColors.blue,
          ),
        ),
        RemotePanel(
          operation: 'GET_USER_SCORE',
          builder: (result) => MetricCard(
            label: 'Account score',
            value: accountScore(result['getUserScore']),
            icon: Icons.auto_awesome_outlined,
            color: CipherwillColors.sage,
            onTap: () => context.push('/score'),
          ),
        ),
      ];
      return stacked
          ? Column(children: children)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: children[0]),
                const SizedBox(width: 12),
                Expanded(child: children[1]),
              ],
            );
    },
  );
}

class MetricCard extends StatelessWidget {
  final String label;
  final int value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;
  const MetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconBadge(icon, color: color, size: 38),
            const SizedBox(height: 16),
            Semantics(
              label: '$value $label',
              child: ExcludeSemantics(
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: value.toDouble()),
                  duration: AppMotion.duration(context),
                  curve: Curves.easeOutCubic,
                  builder: (_, number, _) => Text(
                    number.round().toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    ),
  );
}
