// Shows Cipherwill's existing mark and native wordmark.
// Owns consistent brand sizing and contrast.
// Does not replace account identity or security status.
import 'package:flutter/material.dart';

class AppBrand extends StatelessWidget {
  const AppBrand({super.key});
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/mark-white.png',
        width: 28,
        height: 28,
        excludeFromSemantics: true,
      ),
      const SizedBox(width: 10),
      const Flexible(
        child: Text(
          'Cipherwill',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w700,
            letterSpacing: -.7,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
