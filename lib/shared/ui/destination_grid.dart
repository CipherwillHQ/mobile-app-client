// Renders the web mobile hubs as compact icon-and-title tiles.
// Owns responsive columns, accessible touch targets and navigation.
// Does not evaluate account eligibility or display private asset values.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/navigation_destinations.dart';

class DestinationGrid extends StatelessWidget {
  final List<AppDestination> destinations;
  const DestinationGrid({super.key, required this.destinations});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final largeText = MediaQuery.textScalerOf(context).scale(14) > 22;
      final columns = largeText
          ? 1
          : constraints.maxWidth >= 600
          ? 3
          : 2;
      final width = (constraints.maxWidth - (columns - 1) * 12) / columns;
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final destination in destinations)
            SizedBox(
              width: width,
              child: Material(
                color: Theme.of(context).cardTheme.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => context.push(destination.$2),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 128),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(destination.$3, size: 26),
                        const SizedBox(height: 8),
                        Text(
                          destination.$1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}
