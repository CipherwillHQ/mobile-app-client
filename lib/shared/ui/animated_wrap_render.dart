// Animates a wrap's actual space and child offsets after layout changes.
// Owns interpolation while preserving Flutter's normal wrap measurement.
// Does not scale text, clip controls or manage widget state.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderAnimatedWrap extends RenderWrap {
  final AnimationController animation;
  Map<RenderBox, Offset> targets = {};
  Map<RenderBox, Tween<Offset>> movements = {};
  Size? targetSize;
  Tween<Size>? space;
  RenderAnimatedWrap({
    required this.animation,
    required TextDirection textDirection,
  }) : super(
         alignment: WrapAlignment.center,
         spacing: 8,
         runSpacing: 8,
         crossAxisAlignment: WrapCrossAlignment.end,
         textDirection: textDirection,
       );
  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    animation.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    animation.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void performLayout() {
    final currentProgress = Curves.easeOutCubic.transform(animation.value);
    final previousSize = hasSize
        ? constraints.constrain(space?.transform(currentProgress) ?? size)
        : null;
    final children = getChildrenAsList();
    final previous = {
      for (final child in children)
        child:
            movements[child]?.transform(currentProgress) ??
            (child.parentData! as WrapParentData).offset,
    };
    super.performLayout();
    final nextSize = size;
    final next = {
      for (final child in children)
        child: (child.parentData! as WrapParentData).offset,
    };
    if (previousSize == null || animation.duration == Duration.zero) {
      targets = next;
      targetSize = nextSize;
      movements = {};
      space = null;
      return;
    }
    if (nextSize != targetSize || !mapEquals(next, targets)) {
      movements = {
        for (final child in children)
          child: Tween(
            begin: previous[child] ?? next[child]!,
            end: next[child]!,
          ),
      };
      space = Tween(begin: previousSize, end: nextSize);
      targets = next;
      targetSize = nextSize;
      animation.removeListener(markNeedsLayout);
      animation.forward(from: 0);
      animation.addListener(markNeedsLayout);
    }
    final progress = Curves.easeOutCubic.transform(animation.value);
    if (space != null) size = constraints.constrain(space!.transform(progress));
    for (final child in children) {
      final movement = movements[child];
      if (movement != null) {
        (child.parentData! as WrapParentData).offset = movement.transform(
          progress,
        );
      }
    }
  }
}
