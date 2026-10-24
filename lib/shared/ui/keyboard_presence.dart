// Preserves keyboard visibility when a global footer consumes its insets.
// Owns the original keyboard state for responsive page content.
// Does not resize scaffolds or add keyboard padding.
import 'package:flutter/widgets.dart';

class KeyboardPresence extends InheritedWidget {
  final bool visible;
  const KeyboardPresence({
    super.key,
    required this.visible,
    required super.child,
  });
  static bool isVisible(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<KeyboardPresence>()?.visible ??
      MediaQuery.viewInsetsOf(context).bottom > 0;
  @override
  bool updateShouldNotify(KeyboardPresence oldWidget) =>
      visible != oldWidget.visible;
}
