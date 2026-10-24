// Exposes the current page and native drawer to nested headers.
// Owns explicit navigation dependencies within the protected shell.
// Does not authorize routes or keep an unlocked vault session.
import 'package:flutter/material.dart';

class NavigationScope extends InheritedWidget {
  final VoidCallback openMenu;
  final String location;
  final Widget? header;
  const NavigationScope({
    super.key,
    required this.openMenu,
    required this.location,
    this.header,
    required super.child,
  });
  static NavigationScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<NavigationScope>();
  @override
  bool updateShouldNotify(NavigationScope oldWidget) =>
      openMenu != oldWidget.openMenu ||
      location != oldWidget.location ||
      header != oldWidget.header;
}
