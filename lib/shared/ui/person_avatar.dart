// Shows a local initials avatar without sending identity to image services.
// Owns person presentation and screen-reader-neutral decoration.
// Does not load external profile images or store personal data.
import 'package:flutter/material.dart';

class PersonAvatar extends StatelessWidget {
  final String name;
  final double size;
  const PersonAvatar(this.name, {super.key, this.size = 46});
  @override
  Widget build(BuildContext context) {
    final words = name.trim().split(RegExp(r'\s+'));
    final initials = words
        .where((word) => word.isNotEmpty)
        .take(2)
        .map((word) => word.characters.first)
        .join()
        .toUpperCase();
    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(size / 3),
        ),
        alignment: Alignment.center,
        child: Text(
          initials.isEmpty ? '?' : initials,
          style: TextStyle(
            fontSize: size * .33,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
