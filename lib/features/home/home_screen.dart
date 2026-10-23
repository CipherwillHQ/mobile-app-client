// Mirrors the web Dashboard's greeting, setup, data and planning sections.
// Owns owner overview navigation using existing online metadata.
// Does not decrypt vault records or grant beneficiary access.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/feature_card.dart';
import 'planning_summary.dart';
import 'vault_state_label.dart';
import 'dashboard_metrics.dart';
import 'dashboard_setup.dart';
import 'score_link.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider).value ?? {};
    final name = account['first_name']?.toString() ?? '';
    return PageFrame(
      title: 'Dashboard',
      actions: [
        if (MediaQuery.textScalerOf(context).scale(14) < 22) const ScoreLink(),
        IconButton(
          tooltip: 'Your profile',
          onPressed: () => context.push('/profile'),
          icon: const Icon(Icons.person_outline_rounded),
        ),
      ],
      children: [
        Text(
          name.isEmpty ? 'Hello!' : 'Hello, $name!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        const DashboardSetup(),
        const DashboardMetrics(),
        const SizedBox(height: 16),
        const VaultStateLabel(),
        FeatureCard(
          title: 'Security factors',
          subtitle: 'Manage your keys and biometric access',
          icon: Icons.shield_outlined,
          onTap: () => context.push('/factors'),
        ),
        const Divider(),
        const PlanningSummary(),
        const Divider(),
        FeatureCard(
          title: 'Segments',
          subtitle: 'Choose the information you want to secure',
          icon: Icons.category_outlined,
          onTap: () => context.push('/preferences'),
        ),
        FeatureCard(
          title: 'Granted beneficiary access',
          subtitle: 'Review and revoke access to your will',
          icon: Icons.vpn_key_outlined,
          onTap: () => context.push('/granted-access'),
        ),
        FeatureCard(
          title: 'Executor workspace',
          subtitle: 'View wills released to you',
          icon: Icons.lock_open_outlined,
          onTap: () => context.push('/executor'),
        ),
      ],
    );
  }
}
