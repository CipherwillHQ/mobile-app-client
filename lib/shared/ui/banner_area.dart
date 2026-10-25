// Stacks inline account notices in a reusable banner area.
// Owns consistent banner width and spacing, collapsing when empty.
// Does not choose banners or handle their actions.
import 'package:flutter/material.dart';

class BannerArea extends StatelessWidget {
  final List<Widget> children;
  const BannerArea({super.key, required this.children});
  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    return Semantics(
      label: 'Account notices',
      container: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: children,
          ),
        ),
      ),
    );
  }
}
