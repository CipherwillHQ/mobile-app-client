// Highlights the owner's next planning action without exposing vault contents.
// Owns the dashboard's branded hero and verified vault-state label.
// Does not manufacture completion metrics or release conditions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/design_tokens.dart';
import '../../shared/ui/status_pill.dart';
import '../security/session_controller.dart';

class HomeHero extends ConsumerWidget {
  const HomeHero({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff0a2461), CipherwillColors.blue],
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          right: -54,
          top: -55,
          child: ExcludeSemantics(
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: .08),
                  width: 35,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'A LITTLE TODAY. A LOT OF PEACE TOMORROW.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 10,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffc2d4ff),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your legacy,\none step at a time.',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 14),
              Text(
                'Make a thoughtful plan for the things and people that matter.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffd6e0ff),
                ),
              ),
              const SizedBox(height: 22),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: CipherwillColors.blue,
                ),
                onPressed: () => context.push('/guide'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text('Continue your guide'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class VaultStateLabel extends ConsumerWidget {
  const VaultStateLabel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => StatusPill(
    ref.watch(sessionProvider) == null
        ? 'No encryption factor unlocked'
        : 'Vault unlocked',
    color: ref.watch(sessionProvider) == null
        ? CipherwillColors.amber
        : CipherwillColors.sage,
    icon: ref.watch(sessionProvider) == null
        ? Icons.lock_open_outlined
        : Icons.shield_outlined,
  );
}
