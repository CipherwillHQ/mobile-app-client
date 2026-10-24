// Provides the sidebar's explicit System, Light and Dark appearance choices.
// Owns the compact footer layout around the native theme switcher.
// Does not expose lock, logout or account actions in the menu.
import 'package:flutter/material.dart';
import 'sidebar_theme_switcher.dart';

class SidebarControls extends StatelessWidget {
  const SidebarControls({super.key});
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Divider(height: 1),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Theme',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(width: 12),
            const SidebarThemeSwitcher(),
          ],
        ),
      ),
    ],
  );
}
