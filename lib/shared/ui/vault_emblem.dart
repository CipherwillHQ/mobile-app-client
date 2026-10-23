// Illustrates a private vault using native scalable shapes.
// Owns the decorative lock motif for secure and empty states.
// Does not imply that a particular account has encryption configured.
import 'package:flutter/material.dart';

class VaultEmblem extends StatelessWidget {
  const VaultEmblem({super.key});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return ExcludeSemantics(
      child: SizedBox(
        height: 150,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 144,
                height: 144,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withValues(alpha: .08)),
                ),
              ),
              Container(
                width: 108,
                height: 108,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: .04),
                  border: Border.all(color: color.withValues(alpha: .08)),
                ),
              ),
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
