// Presents the owner's released grants in a focused mobile sheet.
// Owns review layout and the explicit limitation of revocation.
// Does not change the release schedule or export will data.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import 'released_access_list.dart';

Future<void> reviewReleasedAccess(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const ReleasedAccessReview(),
    );

class ReleasedAccessReview extends StatelessWidget {
  const ReleasedAccessReview({super.key});
  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .8,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Review access',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  tooltip: 'Close access review',
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(AppIcons.close),
                ),
              ],
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Revoking stops future access. Downloaded copies cannot be recalled.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 12),
                    const ReleasedAccessList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
