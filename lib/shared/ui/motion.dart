// Adds quiet entrance and navigation motion with accessible fallbacks.
// Owns shared timing and reduced-motion behavior.
// Does not retain outgoing account gates or decrypted screens.
import 'package:flutter/material.dart';

abstract final class AppMotion {
  static Widget slideTransition(Widget child, Animation<double> animation) =>
      AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (_, content) => Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(
              (animation.status == AnimationStatus.reverse ? -70 : 70) *
                  (1 - Curves.easeOut.transform(animation.value)),
              0,
            ),
            child: content,
          ),
        ),
      );
  static bool reduced(BuildContext context) =>
      MediaQuery.disableAnimationsOf(context) ||
      MediaQuery.accessibleNavigationOf(context);
  static Duration duration(BuildContext context) =>
      reduced(context) ? Duration.zero : const Duration(milliseconds: 280);
}

class Reveal extends StatelessWidget {
  final Widget child;
  final int order;
  const Reveal({super.key, required this.child, this.order = 0});
  @override
  Widget build(BuildContext context) {
    if (AppMotion.reduced(context)) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 420),
      curve: Interval(order.clamp(0, 6) * .05, 1, curve: Curves.easeOutCubic),
      child: child,
      builder: (_, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, 12 * (1 - value)),
          child: child,
        ),
      ),
    );
  }
}

class CipherwillPageTransitions extends PageTransitionsBuilder {
  const CipherwillPageTransitions();
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (AppMotion.reduced(context)) return child;
    final curved = animation.drive(CurveTween(curve: Curves.easeOutCubic));
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: curved.drive(
          Tween(begin: const Offset(0, .025), end: Offset.zero),
        ),
        child: child,
      ),
    );
  }
}
