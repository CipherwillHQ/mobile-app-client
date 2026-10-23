// Mirrors the web drawer's branding, segment groups and platform links.
// Owns enabled-category visibility and a scrollable mobile menu.
// Does not reveal vault contents or replace server access checks.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/vault/category_sections.dart';
import '../features/vault/category_visuals.dart';
import '../shared/ui/app_brand.dart';
import 'providers.dart';
import 'navigation_destinations.dart';
import 'sidebar_link.dart';
import 'sidebar_controls.dart';

class AppSidebar extends ConsumerWidget {
  final String location;
  const AppSidebar({super.key, required this.location});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);
    return Drawer(
      width: (MediaQuery.sizeOf(context).width * .85).clamp(0, 280),
      backgroundColor: Theme.of(context).cardTheme.color,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
              child: Row(
                children: [
                  Expanded(
                    child: AppBrand(
                      light: Theme.of(context).brightness == Brightness.dark,
                      compact: MediaQuery.textScalerOf(context).scale(21) > 30,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close menu',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  for (final item in dashboardDestinations)
                    SidebarLink(destination: item, location: location),
                  for (final section in categorySections)
                    if (enabledCategories(
                      preferences.value ?? {},
                      section.$2,
                    ).isNotEmpty) ...[
                      SidebarGroupTitle(section.$1),
                      for (final category in enabledCategories(
                        preferences.value ?? {},
                        section.$2,
                      ))
                        SidebarLink(
                          destination: (
                            category.title,
                            '/vault/${category.type}',
                            visualFor(category.type).icon,
                          ),
                          location: location,
                        ),
                    ],
                  if (preferences.hasError)
                    TextButton(
                      onPressed: () => ref.invalidate(preferencesProvider),
                      child: const Text('Retry data categories'),
                    ),
                  const SidebarGroupTitle('Network'),
                  for (final item in networkDestinations)
                    SidebarLink(destination: item, location: location),
                  const SidebarGroupTitle('Platform'),
                  for (final item in platformDestinations)
                    SidebarLink(destination: item, location: location),
                  SidebarLink(
                    destination: (
                      'Executor workspace',
                      '/executor',
                      Icons.lock_open_outlined,
                    ),
                    location: location,
                  ),
                  SidebarLink(
                    destination: (
                      'Granted access',
                      '/granted-access',
                      Icons.key_outlined,
                    ),
                    location: location,
                  ),
                  SidebarLink(
                    destination: (
                      'Feedback',
                      '/feedback',
                      Icons.chat_bubble_outline,
                    ),
                    location: location,
                  ),
                ],
              ),
            ),
            const SidebarControls(),
          ],
        ),
      ),
    );
  }
}

class SidebarGroupTitle extends StatelessWidget {
  final String title;
  const SidebarGroupTitle(this.title, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(12, 18, 12, 6),
    child: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
    ),
  );
}
