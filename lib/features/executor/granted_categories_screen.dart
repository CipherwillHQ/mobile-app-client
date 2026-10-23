// Shows allowed categories for an active released will.
// Owns online access checks and category navigation.
// Does not infer grants from owner subscription preferences.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/feature_card.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/empty_state.dart';
import '../people/person_identity.dart';
import '../security/session_controller.dart';
import '../vault/categories.dart';
import '../vault/category_visuals.dart';
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
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Released will',
    children: [
      AsyncPanel(
        value: ref.watch(grantProvider(id)),
        retry: () => ref.invalidate(grantProvider(id)),
        builder: (grant) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: StatusPill(
                'Read-only access',
                icon: Icons.visibility_outlined,
              ),
            ),
            const SizedBox(height: 12),
            RemotePanel(
              operation: 'GET_PERSON',
              variables: {'id': grant['user']},
              builder: (p) => PersonIdentity(
                person: asJson(p['getPerson']),
                caption: 'Items this donor has entrusted to you.',
              ),
            ),
            const SizedBox(height: 12),
            RemotePanel(
              operation: 'GET_GRANTED_METAMODEL_TYPE_COUNTS',
              variables: {'access_id': id},
              builder: (r) {
                final counts = jsonList(
                  r['getGrantedMetamodelTypeCounts'],
                ).where((count) => count['count'] > 0).toList();
                if (counts.isEmpty) {
                  return const EmptyState(
                    title: 'No available items',
                    message: 'This will has no items available to you.',
                    icon: Icons.inventory_2_outlined,
                  );
                }
                return Column(
                  children: [
                    for (final count in counts)
                      FeatureCard(
                        title: categoryFor(count['type']).title,
                        subtitle: '${count['count']} items · Read-only',
                        icon: visualFor(count['type']).icon,
                        color: visualFor(count['type']).color,
                        onTap: () => context.push(
                          count['type'] == 'FILE'
                              ? '/storage?access=' + id
                              : '/executor/' +
                                    id +
                                    '/category/' +
                                    count['type'],
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    ],
  );
}
