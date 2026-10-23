// Shows allowed asset categories for an active released will
// Owns access checks and category navigation.
// Does not infer grants from owner subscription preferences.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../security/session_controller.dart';
import '../vault/categories.dart';
import 'executor_repository.dart';

final grantProvider = FutureProvider.autoDispose.family<Json, String>(
  (ref, id) => ExecutorRepository(
    ref.watch(apiProvider),
    ref.read(sessionProvider.notifier).lease(),
  ).access(id),
);

class GrantedCategoriesScreen extends ConsumerWidget {
  final String id;
  const GrantedCategoriesScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grant = ref.watch(grantProvider(id));
    if (grant.hasError) {
      return const PageFrame(
        title: 'Access unavailable',
        children: [Text('This grant may have expired or been revoked.')],
      );
    }
    if (grant.isLoading) {
      return const PageFrame(
        title: 'Released will',
        children: [Center(child: CircularProgressIndicator())],
      );
    }
    return PageFrame(
      title: 'Released will',
      children: [
        RemotePanel(
          operation: 'GET_PERSON',
          variables: {'id': grant.value!['user']},
          builder: (p) => ListTile(
            title: Text(label(asJson(p['getPerson']))),
            subtitle: const Text('Read-only donor workspace'),
          ),
        ),
        RemotePanel(
          operation: 'GET_GRANTED_METAMODEL_TYPE_COUNTS',
          variables: {'access_id': id},
          builder: (r) => Column(
            children: [
              for (final count in jsonList(r['getGrantedMetamodelTypeCounts']))
                if (count['count'] > 0)
                  Card(
                    child: ListTile(
                      title: Text(categoryFor(count['type']).title),
                      trailing: Text(count['count'].toString()),
                      onTap: () => context.push(
                        count['type'] == 'FILE'
                            ? '/storage?access=' + id
                            : '/executor/' + id + '/category/' + count['type'],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
