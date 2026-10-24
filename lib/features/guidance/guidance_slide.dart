// Provides the full content-area centered slides used by the web Guide.
// Owns horizontal fade transitions, safe scrolling and menu access.
// Does not retain decrypted screens outside the account gate.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../app/navigation_scope.dart';
import '../../app/navigate_back.dart';
import '../../shared/ui/page_back_scope.dart';
import '../../shared/ui/motion.dart';

class GuidanceSlide extends StatelessWidget {
  final String identity;
  final Widget child;
  final bool active;
  final VoidCallback? pause;
  const GuidanceSlide({
    super.key,
    required this.identity,
    required this.child,
    required this.active,
    this.pause,
  });
  @override
  Widget build(BuildContext context) => PageBackScope(
    parent: '/home',
    canLeave: !active,
    onBlockedBack: pause,
    child: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
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
            Positioned(
              top: 4,
              left: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    tooltip: active ? 'Pause setup' : 'Back',
                    icon: Icon(active ? AppIcons.close : AppIcons.back),
                    onPressed: active
                        ? pause
                        : () => navigateBack(context, fallback: '/home'),
                  ),
                  const Spacer(),
                  if (!active && NavigationScope.maybeOf(context) != null)
                    IconButton(
                      tooltip: 'Open menu',
                      icon: const Icon(AppIcons.menu),
                      onPressed: NavigationScope.maybeOf(context)!.openMenu,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
