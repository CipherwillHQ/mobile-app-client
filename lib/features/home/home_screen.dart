// Shows the account overview and planning entry points
// Owns dashboard navigation and public metrics.
// Does not decrypt vault contents on the home screen.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import 'planning_summary.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(accountProvider).value ?? {};
    return PageFrame(
      title: 'Cipherwill',
      children: [
        Text(
          'Welcome, ' + (user['first_name'] ?? user['email'] ?? '').toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        const Text('Your legacy, one manageable step at a time.'),
        const SizedBox(height: 20),
        const PlanningSummary(),
        RemotePanel(
          operation: 'GET_USER_SCORE',
          builder: (r) => Card(
            child: ListTile(
              title: const Text('Account score'),
              trailing: Text(r['getUserScore'].toString()),
            ),
          ),
        ),
        RemotePanel(
          operation: 'GET_METAMODEL_TYPE_COUNTS',
          builder: (r) => Card(
            child: ListTile(
              title: const Text('Vault items'),
              trailing: Text(
                (r['getMetamodelTypeCounts'] as List)
                    .fold<int>(
                      0,
                      (total, item) => total + (item['count'] as int),
                    )
                    .toString(),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Security factors'),
            onTap: () => context.push('/factors'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.vpn_key_outlined),
            title: const Text('Granted access'),
            subtitle: const Text(
              'Review and revoke released access to your will',
            ),
            onTap: () => context.push('/granted-access'),
          ),
        ),
      ],
    );
  }
}
