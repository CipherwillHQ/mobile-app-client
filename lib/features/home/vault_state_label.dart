// Shows the actual vault-factor state without exposing secret data.
// Owns the dashboard's security status label.
// Does not manufacture encryption state or unlock factors.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/design_tokens.dart';
import '../../shared/ui/status_pill.dart';
import '../security/session_controller.dart';

class VaultStateLabel extends ConsumerWidget {
  const VaultStateLabel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => Align(
    alignment: Alignment.centerLeft,
    child: StatusPill(
      ref.watch(sessionProvider) == null
          ? 'No encryption factor unlocked'
          : 'Vault unlocked',
      color: ref.watch(sessionProvider) == null
          ? CipherwillColors.amber
          : CipherwillColors.sage,
      icon: ref.watch(sessionProvider) == null
          ? Icons.lock_open_outlined
          : Icons.shield_outlined,
    ),
  );
}
