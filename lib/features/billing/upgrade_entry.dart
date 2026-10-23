// Offers free accounts the existing web-managed Premium upgrade.
// Owns navigation, duplicate-tap prevention and returned checkout feedback.
// Does not implement native checkout or change the account plan locally.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/panel_section.dart';
import 'billing_refresh.dart';
import 'upgrade_contract.dart';

class UpgradeEntry extends ConsumerStatefulWidget {
  const UpgradeEntry({super.key});
  @override
  ConsumerState<UpgradeEntry> createState() => _UpgradeEntryState();
}

class _UpgradeEntryState extends ConsumerState<UpgradeEntry> {
  bool opening = false;
  Future<void> open() async {
    if (opening) return;
    setState(() => opening = true);
    final result = await context.push<UpgradeResult>('/upgrade');
    if (!mounted) return;
    setState(() => opening = false);
    if (result != null) showUpgradeResult(context, ref, result);
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(accountProvider).value?['plan'] != 'free') {
      return const SizedBox.shrink();
    }
    return PanelSection(
      title: 'More room for your legacy',
      children: [
        const Text(
          'Explore Premium and upgrade through Cipherwill’s secure web checkout.',
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: opening ? null : open,
          icon: const Icon(Icons.workspace_premium_outlined),
          label: const Text('Upgrade to Premium'),
        ),
      ],
    );
  }
}
