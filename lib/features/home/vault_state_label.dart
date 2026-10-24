// Shows the actual vault-factor state without exposing secret data.
// Owns the dashboard's security status label.
// Does not manufacture encryption state or unlock factors.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/design_tokens.dart';
import '../../shared/ui/status_pill.dart';
import '../security/session_controller.dart';

class VaultStateLabel extends ConsumerWidget {
  const VaultStateLabel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unlocked = ref.watch(sessionProvider) != null;
    final factors = ref.watch(factorsProvider).value;
    if (!unlocked && factors == null) return const SizedBox.shrink();
    final factorless = !unlocked && factors!.isEmpty;
    return Align(
      alignment: Alignment.centerLeft,
      child: StatusPill(
        unlocked
            ? 'Vault unlocked'
            : factorless
            ? 'No security factors'
            : 'Vault locked',
        color: unlocked
            ? CipherwillColors.sage
            : factorless
            ? Theme.of(context).colorScheme.onSurfaceVariant
            : CipherwillColors.amber,
        icon: unlocked
            ? AppIcons.security
            : factorless
            ? AppIcons.unlocked
            : AppIcons.lock,
      ),
    );
  }
}
