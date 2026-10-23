// Provides the sidebar's explicit System, Light and Dark appearance choices.
// Owns the compact footer and uses the shared saved appearance selector.
// Does not expose lock, logout or account actions in the menu.
import 'package:flutter/material.dart';
import '../features/settings/appearance_selector.dart';

class SidebarControls extends StatelessWidget {
  const SidebarControls({super.key});
  @override
  Widget build(BuildContext context) => const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Divider(height: 1),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: AppearanceSelector(),
      ),
    ],
  );
}
