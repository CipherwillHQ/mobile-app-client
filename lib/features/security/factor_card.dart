// Presents one security factor and its explicitly requested actions.
// Owns readable labels, key counts and biometric controls.
// Does not infer whether a device key exists or run migrations.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/icon_badge.dart';
import 'factor_visuals.dart';

class FactorCard extends StatelessWidget {
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
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconBadge(factorIcon(factor['type'])),
            title: Text(factor['name']),
            subtitle: Text(
              factorTitle(factor['type']) + ' · $count encrypted keys',
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              TextButton.icon(
                onPressed: busy ? null : rename,
                icon: const Icon(Icons.edit_outlined, size: 18),
                label: const Text('Rename'),
              ),
              TextButton.icon(
                onPressed: busy ? null : migrate,
                icon: const Icon(Icons.sync_rounded, size: 18),
                label: const Text('Migrate keys'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: busy ? null : enable,
            icon: const Icon(Icons.fingerprint_rounded),
            label: const Text('Enable biometrics'),
          ),
          TextButton(
            onPressed: busy ? null : disable,
            child: const Text('Disable biometrics'),
          ),
          const Divider(),
          TextButton(
            onPressed: busy ? null : remove,
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Remove factor'),
          ),
        ],
      ),
    ),
  );
}
