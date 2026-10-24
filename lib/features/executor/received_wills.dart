// Shows active received wills as a contextual dashboard entry.
// Owns conditional visibility and donor-specific opening actions.
// Does not display expired grants or load protected assets.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/section_heading.dart';
import 'access_status.dart';
import 'executor_providers.dart';
import 'received_will_row.dart';

class ReceivedWills extends ConsumerWidget {
  const ReceivedWills({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(receivedWillsProvider)
      .when(
        skipLoadingOnRefresh: false,
        loading: () => const SizedBox.shrink(),
        error: (_, _) => ErrorPanel(
          message: 'Unable to check wills shared with you.',
          retry: () => ref.invalidate(receivedWillsProvider),
        ),
        data: (grants) {
          final active = grants.where(isActiveAccess).toList();
          if (active.isEmpty) return const SizedBox.shrink();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeading(
                'Wills shared with you',
                action: 'View all',
                onAction: () => context.push('/executor'),
              ),
              for (final grant in active) ReceivedWillRow(grant: grant),
              const Divider(),
            ],
          );
        },
      );
}
