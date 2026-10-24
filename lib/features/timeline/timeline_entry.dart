// Draws one accessible chronological planning entry.
// Owns timeline markers, connecting rules and date hierarchy.
// Does not calculate dates or alter reminder intervals.
import 'package:flutter/material.dart';

class TimelineEntry extends StatelessWidget {
  final String title;
  final String date;
  final bool last;
  final Widget? action;
  const TimelineEntry({
    super.key,
    required this.title,
    required this.date,
    required this.last,
    this.action,
  });
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            if (!last)
              Expanded(
                child: Container(
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
          ],
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 5),
                Text(date, style: Theme.of(context).textTheme.bodySmall),
                ?action,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
