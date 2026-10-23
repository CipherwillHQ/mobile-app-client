// Matches the web mobile auth page's landscape and centered white form.
// Owns background, brand placement and keyboard-reachable scrolling.
// Does not authenticate accounts or control security-factor state.
import 'package:flutter/material.dart';
import '../../app/theme.dart';
import '../../shared/ui/motion.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  const AuthLayout({super.key, required this.children});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/auth-landscape.webp',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            excludeFromSemantics: true,
          ),
        ),
        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 512),
                      child: Theme(
                        data: cipherwillTheme(Brightness.light),
                        child: Reveal(
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    'assets/images/mark-black.png',
                                    width: 35,
                                    height: 35,
                                    semanticLabel: 'Cipherwill',
                                  ),
                                ),
                                const SizedBox(height: 28),
                                ...children,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
