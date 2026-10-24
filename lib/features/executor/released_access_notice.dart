// Calls attention to active beneficiary access when the owner returns.
// Owns the conditional dashboard notice and review-sheet entry point.
// Does not revoke access or infer that a login caused execution.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/guide_panel.dart';
import 'executor_providers.dart';
import 'released_access_review.dart';

class ReleasedAccessNotice extends ConsumerWidget {
  const ReleasedAccessNotice({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(releasedAccessProvider)
      .when(
        skipLoadingOnRefresh: false,
        loading: () => const SizedBox.shrink(),
        error: (_, _) => ErrorPanel(
          message: 'Unable to check access to your will.',
          retry: () => ref.invalidate(releasedAccessProvider),
        ),
        data: (grants) => grants.isEmpty
            ? const SizedBox.shrink()
            : Semantics(
                liveRegion: true,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GuidePanel(
                        title: 'Your will is currently shared',
                        message: grants.length == 1
                            ? '1 beneficiary has access to your will.'
                            : '${grants.length} beneficiaries have access to your will.',
                        icon: AppIcons.unlocked,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => reviewReleasedAccess(context),
                          icon: const Icon(AppIcons.security, size: 18),
                          label: const Text('Review access'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
}
