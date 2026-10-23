// Matches the web factor row with compact metadata and an action menu.
// Owns current-factor highlighting, key counts and native biometric actions.
// Does not infer saved device-key state or run migrations.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/design_tokens.dart';
import '../../core/api/json_values.dart';
import 'factor_visuals.dart';
import 'session_controller.dart';

class FactorCard extends ConsumerWidget {
  final Json factor;
  final int count;
  final bool busy;
  final VoidCallback rename, migrate, enable, disable, remove;
  const FactorCard({
    super.key,
    required this.factor,
    required this.count,
    required this.busy,
    required this.rename,
    required this.migrate,
    required this.enable,
    required this.disable,
    required this.remove,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicKey = factor['publicKey'].toString();
    final shortKey = publicKey.length > 20
        ? '${publicKey.substring(0, 8)}…${publicKey.substring(publicKey.length - 8)}'
        : publicKey;
    final current = ref.watch(sessionProvider)?.publicKey == publicKey;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: current
              ? CipherwillColors.sage
              : Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(12, 8, 4, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  factor['name'],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'Type: ${factorTitle(factor['type'])}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Key: $shortKey',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Data count: $count',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                if (current)
                  Text(
                    'Current factor',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: CipherwillColors.sage,
                    ),
                  ),
              ],
            ),
          ),
          PopupMenuButton<VoidCallback>(
            tooltip: 'Factor options',
            enabled: !busy,
            onSelected: (action) => action(),
            itemBuilder: (_) => [
              for (final action in [
                ('Rename', rename),
                ('Migrate keys', migrate),
                ('Enable biometrics', enable),
                ('Disable biometrics', disable),
                ('Remove factor', remove),
              ])
                PopupMenuItem(
                  value: action.$2,
                  child: Text(
                    action.$1,
                    style: action.$1 == 'Remove factor'
                        ? TextStyle(color: Theme.of(context).colorScheme.error)
                        : null,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
