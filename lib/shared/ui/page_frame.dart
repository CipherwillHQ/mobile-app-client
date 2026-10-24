// Gives mobile pages compact headers and keyboard-aware content.
// Owns safe-area spacing, native Back and an optional task action area.
// Does not fetch account data.
import 'package:flutter/material.dart';
import '../../app/navigation_scope.dart';
import '../../app/parent_destination.dart';
import 'page_back_scope.dart';
import 'page_header.dart';
import 'page_refresh.dart';

class PageFrame extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget>? actions;
  final String? subtitle;
  final Widget? tabs;
  final Widget? footer;
  final bool focused;
  final bool canLeave;
  final VoidCallback? onBlockedBack;
  const PageFrame({
    super.key,
    required this.title,
    required this.children,
    this.actions,
    this.subtitle,
    this.tabs,
    this.footer,
    this.focused = false,
    this.canLeave = true,
    this.onBlockedBack,
  });
  @override
  Widget build(BuildContext context) {
    final location = NavigationScope.maybeOf(context)?.location;
    final parent = location == null ? null : parentDestination(location);
    return PageBackScope(
      parent: parent,
      canLeave: canLeave,
      onBlockedBack: onBlockedBack,
      child: Scaffold(
        appBar: PageHeader(
          title: title,
          parent: parent,
          focused: focused,
          actions: actions,
        ),
        bottomNavigationBar: footer == null
            ? null
            : Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.viewInsetsOf(context).bottom,
                ),
                child: SafeArea(
                  top: false,
                  child: Center(
                    heightFactor: 1,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        child: SizedBox(width: double.infinity, child: footer),
                      ),
                    ),
                  ),
                ),
              ),
        body: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 760),
              child: PageRefresh(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  children: [
                    ?tabs,
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          subtitle!,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ),
                    ...children,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
