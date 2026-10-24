// Handles system and header Back consistently, including direct links.
// Owns parent fallback and a page's explicit unsaved-change callback.
// Does not confirm, save or discard feature data itself.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageBackScope extends StatelessWidget {
  final String? parent;
  final bool canLeave;
  final VoidCallback? onBlockedBack;
  final Widget child;
  const PageBackScope({
    super.key,
    required this.parent,
    required this.child,
    this.canLeave = true,
    this.onBlockedBack,
  });
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: canLeave && (parent == null || Navigator.of(context).canPop()),
    onPopInvokedWithResult: (didPop, _) {
      if (didPop) return;
      if (!canLeave) {
        onBlockedBack?.call();
      } else if (parent != null) {
        GoRouter.maybeOf(context)?.go(parent!);
      }
    },
    child: child,
  );
}
