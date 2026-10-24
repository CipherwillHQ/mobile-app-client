// Gives top-level mobile hubs a brief section-switch crossfade.
// Owns shared transition timing for non-editor destinations.
// Does not keep inactive vault editors or animate account authorization gates.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/ui/motion.dart';

Page<void> sectionPage(GoRouterState state, Widget child) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 150),
      reverseTransitionDuration: const Duration(milliseconds: 150),
      child: child,
      transitionsBuilder: sectionTransition,
    );

Widget sectionTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) => AppMotion.reduced(context)
    ? child
    : FadeTransition(opacity: animation, child: child);
