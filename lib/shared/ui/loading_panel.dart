// Presents a calm loading surface with meaningful progress semantics.
// Owns placeholder layout shared by asynchronous screens.
// Does not fabricate content or progress percentages.
import 'package:flutter/material.dart';

class LoadingPanel extends StatelessWidget {
  const LoadingPanel({super.key});
  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Loading',
    child: ExcludeSemantics(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(minHeight: 2),
              const SizedBox(height: 24),
              for (final width in [140.0, 220.0, 180.0])
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: width,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
