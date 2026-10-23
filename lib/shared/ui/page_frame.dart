// Provides consistent mobile page spacing and navigation
// Owns scaffold and scrollable content.
// Does not fetch account data.
import 'package:flutter/material.dart';
import 'motion.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  final String? subtitle;
  const PageFrame({
    super.key,
    required this.title,
    required this.children,
    this.actions,
    this.subtitle,
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title), actions: actions),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(22, 4, 22, 28),
            children: [
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              for (var index = 0; index < children.length; index++)
                Reveal(order: index, child: children[index]),
            ],
          ),
        ),
      ),
    ),
  );
}
