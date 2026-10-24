// Shows allowed categories for an active released will.
// Owns online access checks and category navigation.
// Does not infer grants from owner subscription preferences.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/navigation_row.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/empty_state.dart';
import '../vault/categories.dart';
import '../vault/category_visuals.dart';
import 'executor_location.dart';
import 'executor_providers.dart';

class GrantedCategoriesScreen extends ConsumerWidget {
  final String id;
  const GrantedCategoriesScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Will overview',
    children: [
      AsyncPanel(
        value: ref.watch(grantedCountsProvider(id)),
        retry: () => ref.invalidate(grantedCountsProvider(id)),
        builder: (counts) => counts.isEmpty
            ? const EmptyState(
                title: 'No available items',
                message: 'This will has no items available to you.',
                icon: AppIcons.folder,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final count in counts)
                    NavigationRow(
                      title: categoryFor(count['type']).title,
                      detail: '${count['count']} items',
                      leading: Icon(
                        visualFor(count['type']).icon,
                        color: visualFor(count['type']).color,
                        size: 22,
                      ),
                      onTap: () => context.push(
                        executorCategoryLocation(id, count['type']),
                      ),
                    ),
                ],
              ),
      ),
    ],
  );
}
