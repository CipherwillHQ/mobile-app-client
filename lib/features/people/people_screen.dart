// Mirrors the web Network hub with compact contact destinations.
// Owns navigation to beneficiaries, friends and family.
// Does not grant access or expose released vault records.
import 'package:flutter/material.dart';
import '../../app/navigation_destinations.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/destination_grid.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Network',
    children: [DestinationGrid(destinations: networkDestinations)],
  );
}
