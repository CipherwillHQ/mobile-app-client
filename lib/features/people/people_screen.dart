// Mirrors the web Network hub with compact contact destinations.
// Owns navigation to contacts and the separate executor workspace.
// Does not grant access or expose released vault records.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/navigation_destinations.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/destination_grid.dart';
import '../../shared/ui/feature_card.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Network',
    children: [
      const DestinationGrid(destinations: networkDestinations),
      const SizedBox(height: 24),
      FeatureCard(
        title: 'Executor workspace',
        subtitle: 'Wills released to you',
        icon: Icons.lock_open_outlined,
        onTap: () => context.push('/executor'),
      ),
    ],
  );
}
