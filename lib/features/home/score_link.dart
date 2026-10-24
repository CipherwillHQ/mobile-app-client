// Displays the web dashboard's compact account-score entry point.
// Owns a score link backed by the existing score operation.
// Does not calculate new awards or show fabricated loading values.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../shared/ui/remote_panel.dart';
import 'account_score.dart';

class ScoreLink extends ConsumerWidget {
  const ScoreLink({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(remoteProvider(('GET_USER_SCORE', '{}'))).value;
    if (score == null) return const SizedBox.shrink();
    return TextButton.icon(
      onPressed: () => context.push('/score'),
      icon: const Icon(AppIcons.score, size: 16),
      label: Text(accountScore(score['getUserScore']).toString()),
    );
  }
}
