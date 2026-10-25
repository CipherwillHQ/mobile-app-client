// Wraps status controls while smoothly moving them as their sizes change.
// Owns the animation lifecycle and the same centered eight-pixel spacing.
// Does not render controls or choose account actions.
import 'package:flutter/material.dart';
import 'animated_wrap_render.dart';
import 'motion.dart';

class AnimatedWrap extends StatefulWidget {
  final List<Widget> children;
  const AnimatedWrap({super.key, required this.children});
  @override
  State<AnimatedWrap> createState() => _AnimatedWrapState();
}

class _AnimatedWrapState extends State<AnimatedWrap>
    with SingleTickerProviderStateMixin {
  late final animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 280),
  );
  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animation.duration = AppMotion.duration(context);
    return _AnimatedWrapChildren(
      animation: animation,
      children: widget.children,
    );
  }
}

class _AnimatedWrapChildren extends MultiChildRenderObjectWidget {
  final AnimationController animation;
  const _AnimatedWrapChildren({
    required this.animation,
    required super.children,
  });
  @override
  RenderAnimatedWrap createRenderObject(BuildContext context) =>
      RenderAnimatedWrap(
        animation: animation,
        textDirection: Directionality.of(context),
      );
  @override
  void updateRenderObject(
    BuildContext context,
    RenderAnimatedWrap renderObject,
  ) => renderObject.textDirection = Directionality.of(context);
}
