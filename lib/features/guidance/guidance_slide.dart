// Provides the full content-area centered slides used by the web Guide.
// Owns horizontal fade transitions, safe scrolling and menu access.
// Does not retain decrypted screens outside the account gate.
import 'package:flutter/material.dart';
import '../../app/navigation_scope.dart';
import '../../shared/ui/motion.dart';

class GuidanceSlide extends StatelessWidget {
  final String identity;
  final Widget child;
  const GuidanceSlide({super.key, required this.identity, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 760),
                        child: AnimatedSwitcher(
                          duration: AppMotion.duration(context),
                          transitionBuilder: AppMotion.slideTransition,
                          child: KeyedSubtree(
                            key: ValueKey(identity),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (NavigationScope.maybeOf(context) != null)
            Positioned(
              top: 4,
              left: 8,
              child: IconButton(
                tooltip: 'Open menu',
                icon: const Icon(Icons.menu_rounded),
                onPressed: NavigationScope.maybeOf(context)!.openMenu,
              ),
            ),
        ],
      ),
    ),
  );
}
