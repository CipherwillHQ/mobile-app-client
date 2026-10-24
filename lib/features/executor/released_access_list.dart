// Lists the owner's active released grants in review surfaces.
// Owns query failures, empty state and beneficiary rows.
// Does not expose executor permissions or alter stored grants optimistically.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/loading_panel.dart';
import 'executor_providers.dart';
import 'released_access_row.dart';

class ReleasedAccessList extends ConsumerWidget {
  const ReleasedAccessList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(releasedAccessProvider)
      .when(
        skipLoadingOnRefresh: false,
        loading: () => const LoadingPanel(),
        error: (_, _) =>
            ErrorPanel(retry: () => ref.invalidate(releasedAccessProvider)),
        data: (grants) => grants.isEmpty
            ? const EmptyState(
                title: 'No active access',
                message: 'Your will has no active beneficiary access.',
                icon: AppIcons.lock,
              )
            : Column(
                children: [
                  for (final grant in grants)
                    ReleasedAccessRow(key: ValueKey(grant['id']), grant: grant),
                ],
              ),
      );
}
