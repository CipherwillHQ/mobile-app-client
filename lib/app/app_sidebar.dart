// Mirrors the web drawer's branding, segment groups and platform links.
// Owns enabled-category visibility and a scrollable mobile menu.
// Does not reveal vault contents or replace server access checks.
import 'app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/vault/category_sections.dart';
import '../features/vault/category_visuals.dart';
import '../shared/ui/app_brand.dart';
import 'providers.dart';
import 'navigation_destinations.dart';
import 'sidebar_link.dart';
import 'sidebar_controls.dart';
import 'sidebar_group.dart';

class AppSidebar extends ConsumerWidget {
  final String location;
  const AppSidebar({super.key, required this.location});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesProvider);
    return Drawer(
      width: (MediaQuery.sizeOf(context).width * .88).clamp(0, 320),
      backgroundColor: Theme.of(context).cardTheme.color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
      ),
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
                    icon: const Icon(AppIcons.close, size: 20),
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
                      SidebarGroup(section.$1, destination: '/vault'),
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
                  const SidebarGroup('Network', destination: '/people'),
                  for (final item in networkDestinations)
                    SidebarLink(destination: item, location: location),
                  const SidebarGroup('Platform', destination: '/platform'),
                  for (final item in platformDestinations)
                    SidebarLink(destination: item, location: location),
                  SidebarLink(
                    destination: supportDestination,
                    location: location,
                  ),
                  SidebarLink(
                    destination: ('Feedback', '/feedback', AppIcons.feedback),
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
