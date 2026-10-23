// Adds the web client's family photography to supportive planning moments.
// Owns image cropping, text contrast and responsive content height.
// Does not display user-uploaded photos or grant access to data.
import 'package:flutter/material.dart';

class PhotoBanner extends StatelessWidget {
  final String title;
  final String message;
  const PhotoBanner({super.key, required this.title, required this.message});
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(24),
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/family.webp',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            excludeFromSemantics: true,
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x302a363b), Color(0xed192a25)],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(22, 100, 22, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white.withValues(alpha: .88),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
