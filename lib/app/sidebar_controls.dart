// Provides the web sidebar's theme, lock and account controls.
// Owns native appearance persistence and existing session actions.
// Does not introduce another authentication or key-storage path.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/security/session_controller.dart';
import '../features/settings/appearance.dart';
import '../shared/ui/actions.dart';
import 'logout.dart';

class SidebarControls extends ConsumerWidget {
  const SidebarControls({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1),
        ListTile(
          dense: true,
          leading: Icon(
            dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
          title: Text(dark ? 'Light theme' : 'Dark theme'),
          onTap: () => ref
              .read(appearanceProvider.notifier)
              .select(dark ? ThemeMode.light : ThemeMode.dark),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.lock_outline, size: 18),
              label: const Text('Lock'),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(sessionProvider.notifier).lock();
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.logout_outlined, size: 18),
              label: const Text('Logout'),
              onPressed: () => perform(context, () => logout(ref)),
            ),
          ],
        ),
      ],
    );
  }
}
