// Presents the owner's overview with clear planning and security entry points.
// Owns dashboard layout and native navigation.
// Does not decrypt vault contents or invent account metrics.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/section_heading.dart';
import '../../shared/ui/feature_card.dart';
import 'planning_summary.dart';
import 'home_hero.dart';
import 'dashboard_metrics.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider).value ?? {};
    final name = account['first_name']?.toString() ?? '';
    return PageFrame(
      title: 'Cipherwill',
      actions: [
        IconButton(
          tooltip: 'Your profile',
          onPressed: () => context.push('/profile'),
          icon: const Icon(Icons.person_outline_rounded),
        ),
      ],
      children: [
        Text(
          name.isEmpty ? 'Welcome home.' : 'Welcome home, $name.',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 10),
        const Align(alignment: Alignment.centerLeft, child: VaultStateLabel()),
        const SizedBox(height: 24),
        const HomeHero(),
        const SectionHeading('Your overview'),
        const DashboardMetrics(),
        const SectionHeading('Keep your plan moving'),
        const PlanningSummary(),
        const SectionHeading('Stay in control'),
        FeatureCard(
          title: 'Security factors',
          subtitle: 'Your keys, recovery and biometric access',
          icon: Icons.shield_outlined,
          onTap: () => context.push('/factors'),
        ),
        FeatureCard(
          title: 'Granted access',
          subtitle: 'Review and revoke released access to your will',
          icon: Icons.vpn_key_outlined,
          onTap: () => context.push('/granted-access'),
        ),
      ],
    );
  }
}
