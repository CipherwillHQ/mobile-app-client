// Shows Cipherwill's existing mark and native wordmark.
// Owns consistent brand sizing and contrast.
// Does not replace account identity or security status.
import 'package:flutter/material.dart';

class AppBrand extends StatelessWidget {
  final bool light;
  final bool compact;
  const AppBrand({super.key, this.light = false, this.compact = false});
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/mark-${light ? 'white' : 'black'}.png',
        width: 28,
        height: 28,
        excludeFromSemantics: true,
      ),
      if (!compact) ...[
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            'Cipherwill',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              letterSpacing: -.7,
              color: light
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    ],
  );
}
