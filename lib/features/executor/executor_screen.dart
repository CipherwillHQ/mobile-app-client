// Lists released wills and donor information for the beneficiary.
// Owns executor entry points and read-only presentation.
// Does not read protected asset contents.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/navigation_scope.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/empty_state.dart';
import 'access_status.dart';
import 'executor_providers.dart';
import 'received_will_row.dart';
import 'will_access_refresh.dart';

class ExecutorScreen extends ConsumerWidget {
  const ExecutorScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notice = Uri.parse(
      NavigationScope.maybeOf(context)?.location ?? '',
    ).queryParameters['notice'];
    return PageFrame(
      title: 'Execution dashboard',
      children: [
        if (notice != null)
          GuidePanel(
            title: notice == 'expired'
                ? 'Access ended'
                : 'This will is unavailable',
            message: 'Choose another shared will or return to your dashboard.',
            icon: AppIcons.lock,
          ),
        WillAccessRefresh(
          child: AsyncPanel(
            value: ref.watch(receivedWillsProvider),
            retry: () => ref.invalidate(receivedWillsProvider),
            builder: (grants) {
              if (grants.isEmpty) {
                return Column(
                  children: [
                    const EmptyState(
                      title: 'No wills shared with you',
                      message:
                          'Received wills appear here when access is released.',
                      icon: AppIcons.beneficiary,
                    ),
                    TextButton(
                      onPressed: () => context.go('/home'),
                      child: const Text('My dashboard'),
                    ),
                  ],
                );
              }
              final active = grants.where(isActiveAccess).length;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '$active available ${active == 1 ? 'will' : 'wills'} · Read-only',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  for (final grant in grants) ReceivedWillRow(grant: grant),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
