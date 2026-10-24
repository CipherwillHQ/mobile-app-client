// Supplies freshly validated grant metadata to shared-will pages.
// Owns the selected donor context and beneficiary exclusion identifier.
// Does not replace authorization before protected server reads.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';

class ExecutorAccessScope extends InheritedWidget {
  final Json grant;
  const ExecutorAccessScope({
    super.key,
    required this.grant,
    required super.child,
  });
  static Json? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ExecutorAccessScope>()?.grant;
  static bool permits(BuildContext context, String id) =>
      maybeOf(context)?['id'] == id;
  @override
  bool updateShouldNotify(ExecutorAccessScope oldWidget) =>
      grant != oldWidget.grant;
}
