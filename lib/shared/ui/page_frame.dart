// Provides consistent mobile page spacing and navigation
// Owns scaffold and scrollable content.
// Does not fetch account data.
import 'package:flutter/material.dart';
import 'motion.dart';
import '../../app/navigation_scope.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  final String? subtitle;
  final Widget? tabs;
  const PageFrame({
    super.key,
    required this.title,
    required this.children,
    this.actions,
    this.subtitle,
    this.tabs,
  });
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      actions: actions,
      leading: NavigationScope.maybeOf(context) == null
          ? null
          : IconButton(
              tooltip: 'Open menu',
              icon: const Icon(Icons.menu_rounded),
              onPressed: NavigationScope.maybeOf(context)!.openMenu,
            ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(
          height: 1,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    ),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              ?tabs,
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
