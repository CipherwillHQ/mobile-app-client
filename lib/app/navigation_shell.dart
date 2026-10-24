// Frames familiar web pages with native mobile sidebar navigation.
// Owns protected menu access without permanent footer navigation.
// Does not cache hidden vault screens or bypass account locking.

import 'package:flutter/material.dart';
import 'app_sidebar.dart';
import 'navigation_scope.dart';

class NavigationShell extends StatefulWidget {
  final Widget child;
  final String location;
  const NavigationShell({
    super.key,
    required this.child,
    required this.location,
  });
  @override
  State<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  final scaffold = GlobalKey<ScaffoldState>();
  void openMenu() => scaffold.currentState?.openDrawer();
  @override
  Widget build(BuildContext context) {
    if (Uri.parse(widget.location).path == '/upgrade') return widget.child;
    return Scaffold(
      key: scaffold,
      resizeToAvoidBottomInset: false,
      drawer: AppSidebar(location: widget.location),
      drawerEnableOpenDragGesture: false,
      body: NavigationScope(
        openMenu: openMenu,
        location: widget.location,
        child: widget.child,
      ),
    );
  }
}
