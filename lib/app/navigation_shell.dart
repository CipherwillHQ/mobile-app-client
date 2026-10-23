// Provides the four primary native navigation destinations
// Owns tab selection and safe-area layout.
// Does not cache hidden vault screens.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../shared/ui/motion.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;
  final String location;
  const NavigationShell({
    super.key,
    required this.child,
    required this.location,
  });
  @override
  Widget build(BuildContext context) {
    final index = location.startsWith('/vault')
        ? 1
        : location.startsWith('/people')
        ? 2
        : location.startsWith('/settings')
        ? 3
        : 0;
    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 4, 16, 10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: NavigationBar(
            animationDuration: AppMotion.duration(context),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                context.go(['/home', '/vault', '/people', '/settings'][index]),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.shield_outlined),
                selectedIcon: Icon(Icons.shield),
                label: 'Vault',
              ),
              NavigationDestination(
                icon: Icon(Icons.people_outline),
                selectedIcon: Icon(Icons.people),
                label: 'People',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
