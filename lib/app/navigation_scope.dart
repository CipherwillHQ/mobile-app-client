// Exposes the current dashboard drawer to nested page headers.
// Owns explicit menu-opening dependencies within the protected shell.
// Does not authorize routes or keep an unlocked vault session.
import 'package:flutter/material.dart';

class NavigationScope extends InheritedWidget {
  final VoidCallback openMenu;
  const NavigationScope({
    super.key,
    required this.openMenu,
    required super.child,
  });
  static NavigationScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavigationScope>();
  @override
  bool updateShouldNotify(NavigationScope oldWidget) =>
      openMenu != oldWidget.openMenu;
}
