// Mirrors the web Platform hub's four primary destinations.
// Owns compact navigation to timeline, billing, security and settings.
// Does not perform account mutations or load private vault data.
import 'package:flutter/material.dart';
import '../../app/navigation_destinations.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/destination_grid.dart';

class PlatformScreen extends StatelessWidget {
  const PlatformScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Platform',
    children: [DestinationGrid(destinations: platformDestinations)],
  );
}
