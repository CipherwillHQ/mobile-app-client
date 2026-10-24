// Matches the web factor row with compact metadata and an action menu.
// Owns current-factor highlighting, key counts and native biometric actions.
// Does not infer saved device-key state or run migrations.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/app_icons.dart';
import '../../shared/ui/action_sheet.dart';
import '../../shared/ui/navigation_row.dart';
import '../../core/api/json_values.dart';
import 'factor_visuals.dart';
import 'session_controller.dart';

class FactorCard extends ConsumerWidget {
  final Json factor;
  final int count;
  final bool busy;
  final VoidCallback rename, migrate, enable, disable, remove;
  const FactorCard({
    super.key,
    required this.factor,
    required this.count,
    required this.busy,
    required this.rename,
    required this.migrate,
    required this.enable,
    required this.disable,
    required this.remove,
  });
  Future<void> options(BuildContext context) async {
    final action = await chooseAction<VoidCallback>(
      context,
      title: factor['name'],
      actions: [
        SheetAction(rename, 'Rename', AppIcons.edit),
        SheetAction(migrate, 'Migrate keys', AppIcons.refresh),
        SheetAction(enable, 'Enable biometrics', AppIcons.fingerprint),
        SheetAction(disable, 'Disable biometrics', AppIcons.fingerprint),
        SheetAction(
          remove,
          'Remove factor',
          AppIcons.delete,
          destructive: true,
        ),
      ],
    );
    if (context.mounted) action?.call();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicKey = factor['publicKey'].toString();
    final shortKey = publicKey.length > 20
        ? '${publicKey.substring(0, 8)}…${publicKey.substring(publicKey.length - 8)}'
        : publicKey;
    final current = ref.watch(sessionProvider)?.publicKey == publicKey;
    return NavigationRow(
      title: factor['name'],
      detail:
          '${factorTitle(factor['type'])} · $count keys\n$shortKey${current ? ' · Current factor' : ''}',
      leading: Icon(
        factorIcon(factor['type']),
        size: 22,
        color: current ? Theme.of(context).colorScheme.primary : null,
      ),
      trailing: IconButton(
        tooltip: 'Factor options',
        onPressed: busy ? null : () => options(context),
        icon: const Icon(AppIcons.more),
      ),
    );
  }
}
