// Introduces authentication using the web client's landscape photography.
// Owns the photographic header and brand message.
// Does not initiate authentication or show account data.
import 'package:flutter/material.dart';
import '../../shared/ui/app_brand.dart';
import '../../shared/ui/motion.dart';

class AuthHero extends StatelessWidget {
  const AuthHero({super.key});
  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/auth-landscape.webp',
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
          excludeFromSemantics: true,
        ),
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x992a363b), Color(0xee182127)],
            ),
          ),
        ),
      ),
      SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 16, 26, 38),
          child: Reveal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBrand(light: true),
                const SizedBox(height: 24),
                Text(
                  'A little planning.\nA lasting legacy.',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 14),
                Text(
                  'For everything you’ve built.\nFor everyone you love.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white.withValues(alpha: .82),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const Icon(
                      Icons.shield_outlined,
                      size: 16,
                      color: Color(0xffb4d2bd),
                    ),
                    const SizedBox(width: 7),
                    Flexible(
                      child: Text(
                        'End-to-end encryption',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
