// Mirrors the web Guide's centered opening and return overview slide.
// Owns account status pills, reusable banners, setup and deferred task selection.
// Does not select objectives or read encrypted records.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import 'guidance_overview_data.dart';
import '../../shared/ui/banner_area.dart';
import 'email_verification_banner.dart';
import 'data_records_metric.dart';
import '../../shared/ui/animated_wrap.dart';

class GuidanceOverview extends ConsumerWidget {
  final bool busy, available, failed;
  final List<Json> deferred, catalog;
  final VoidCallback start, verifyEmail;
  final ValueChanged<String> resume;
  const GuidanceOverview({
    super.key,
    required this.busy,
    required this.available,
    required this.failed,
    required this.deferred,
    required this.catalog,
    required this.start,
    required this.verifyEmail,
    required this.resume,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(guidanceOverviewProvider);
    if (data.isLoading) {
      return const Center(child: Text('Preparing your account overview…'));
    }
    if (data.hasError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("We couldn't load your account overview."),
          TextButton(
            onPressed: () => ref.invalidate(guidanceOverviewProvider),
            child: const Text('Retry'),
          ),
        ],
      );
    }
    final overview = data.value!;
    final verified = overview['emailVerified'] == true;
    final name = overview['firstName'] ?? '';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your Cipherwill Status',
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 28),
        Text(
          (name.isEmpty ? '' : name + ', ') +
              "here's where your Cipherwill stands. Continue your setup, one step at a time.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 28),
        AnimatedWrap(
          children: [
            for (final metric in [
              ('score', 'Score', '/score'),
              ('itemCount', 'Data records', '/preferences'),
              ('beneficiaryCount', 'Beneficiaries', '/beneficiaries'),
              ('factorCount', 'Security factors', '/factors'),
            ])
              if (metric.$1 == 'itemCount')
                DataRecordsMetric(
                  count: overview['itemCount'] as int,
                  typeCounts: jsonList(overview['typeCounts']),
                )
              else
                ActionChip(
                  onPressed: () => context.push(metric.$3),
                  label: Text(
                    overview[metric.$1].toString() +
                        (metric.$1 == 'score' ? ' / 950 ' : ' ') +
                        metric.$2,
                  ),
                ),
            if (deferred.isNotEmpty)
              PopupMenuButton<String>(
                onSelected: busy ? null : resume,
                itemBuilder: (_) => [
                  for (final choice in deferred)
                    PopupMenuItem(
                      value: choice['objectiveId'],
                      child: Text(
                        catalog
                                .where((f) => f['id'] == choice['objectiveId'])
                                .firstOrNull?['title'] ??
                            choice['objectiveId'],
                      ),
                    ),
                ],
                child: Chip(
                  label: Text(deferred.length.toString() + ' Do later'),
                ),
              ),
          ],
        ),
        const SizedBox(height: 28),
        BannerArea(
          children: [
            if (!verified) EmailVerificationBanner(verify: verifyEmail),
          ],
        ),
        if (busy || available || failed)
          FilledButton(
            onPressed: busy ? null : start,
            child: Text(
              busy ? 'Preparing setup…' : 'Continue Cipherwill Setup',
            ),
          ),
        if (failed)
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Setup couldn't load. Continue to retry.",
              textAlign: TextAlign.center,
            ),
          ),
        if (!busy && !available && !failed)
          Text(
            deferred.isEmpty
                ? 'Your available guidance is complete.'
                : 'You have tasks in Do later. Resume them whenever you are ready.',
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
