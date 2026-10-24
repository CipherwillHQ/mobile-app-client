// Mirrors the web Dashboard's greeting, setup, data and planning sections.
// Owns owner overview navigation using existing online metadata.
// Does not decrypt vault records or grant beneficiary access.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../executor/dashboard_access.dart';
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
          icon: const Icon(AppIcons.person),
        ),
      ],
      children: [
        Text(
          name.isEmpty ? 'Hello!' : 'Hello, $name!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        const DashboardAccess(),
        const DashboardSetup(),
        const DashboardMetrics(),
        const SizedBox(height: 16),
        const VaultStateLabel(),
        FeatureCard(
          title: 'Security factors',
          subtitle: '',
          icon: AppIcons.security,
          onTap: () => context.push('/factors'),
        ),
        const Divider(),
        const PlanningSummary(),
        const Divider(),
        FeatureCard(
          title: 'Segments',
          subtitle: '',
          icon: AppIcons.segments,
          onTap: () => context.push('/preferences'),
        ),
      ],
    );
  }
}
