// Presents the existing landscape above a flat native authentication form.
// Owns bounded imagery, branding and keyboard-reachable scrolling.
// Does not authenticate accounts or control security-factor state.
import 'package:flutter/material.dart';
import '../../shared/ui/app_brand.dart';
import '../../shared/ui/keyboard_presence.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  const AuthLayout({super.key, required this.children});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: KeyboardPresence.isVisible(context)
                      ? 104
                      : (constraints.maxHeight * .28).clamp(160, 240),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/auth-landscape.webp',
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                        cacheWidth:
                            (MediaQuery.sizeOf(context).width *
                                    MediaQuery.devicePixelRatioOf(context))
                                .round(),
                        excludeFromSemantics: true,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0x66000000), Colors.transparent],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: MediaQuery.paddingOf(context).top + 16,
                        child: const AppBrand(light: true),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 512),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: children,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
