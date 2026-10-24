// Presents one compact header for browsing, details and focused tasks.
// Owns labeled Back/menu controls and accessible full page titles.
// Does not load data or decide whether drafts may be discarded.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../app/navigate_back.dart';
import '../../app/navigation_scope.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? parent;
  final bool focused;
  final List<Widget>? actions;
  const PageHeader({
    super.key,
    required this.title,
    required this.parent,
    this.focused = false,
    this.actions,
  });
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  Widget build(BuildContext context) {
    final navigation = NavigationScope.maybeOf(context);
    return AppBar(
      titleSpacing: 0,
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      automaticallyImplyLeading: false,
      leading: parent != null || focused
          ? IconButton(
              tooltip: 'Back',
              icon: const Icon(AppIcons.back),
              onPressed: () => navigateBack(context, fallback: parent),
            )
          : navigation == null
          ? null
          : IconButton(
              tooltip: 'Open menu',
              icon: const Icon(AppIcons.menu),
              onPressed: navigation.openMenu,
            ),
      actions: [
        ...?actions,
        if (parent != null && !focused && navigation != null)
          IconButton(
            tooltip: 'Open menu',
            icon: const Icon(AppIcons.menu),
            onPressed: navigation.openMenu,
          ),
        const SizedBox(width: 4),
      ],
    );
  }
}
