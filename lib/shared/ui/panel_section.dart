// Groups related controls in flat web-style page sections.
// Owns section spacing, titles and optional explanatory text.
// Does not fetch data or change form semantics.
import 'package:flutter/material.dart';

class PanelSection extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;
  const PanelSection({
    super.key,
    required this.title,
    this.description,
    required this.children,
  });
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        if (description != null) ...[
          const SizedBox(height: 6),
          Text(description!, style: Theme.of(context).textTheme.bodySmall),
        ],
        const SizedBox(height: 12),
        ...children,
      ],
    ),
  );
}
