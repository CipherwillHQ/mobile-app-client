// Uses native history before falling back to a page's parent destination.
// Owns safe Back requests for direct links and pushed task screens.
// Does not bypass a route's PopScope or discard a draft.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_scope.dart';
import 'parent_destination.dart';

Future<void> navigateBack(BuildContext context, {String? fallback}) async {
  if (await Navigator.of(context).maybePop() || !context.mounted) return;
  final location = NavigationScope.maybeOf(context)?.location;
  final parent =
      fallback ?? (location == null ? null : parentDestination(location));
  if (parent != null) GoRouter.maybeOf(context)?.go(parent);
}
