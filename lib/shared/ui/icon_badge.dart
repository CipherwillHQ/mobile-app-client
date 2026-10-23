// Gives labeled cards a consistent, softly tinted icon treatment.
// Owns decorative icon sizing and surface contrast.
// Does not supply accessible names for interactive controls.
import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double size;
  const IconBadge(this.icon, {super.key, this.color, this.size = 48});
  @override
  Widget build(BuildContext context) {
    final tint = color ?? Theme.of(context).colorScheme.primary;
    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: tint.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(size * .3),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).brightness == Brightness.dark
              ? Color.lerp(tint, Colors.white, .4)
              : tint,
          size: size * .46,
        ),
      ),
    );
  }
}
