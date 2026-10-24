// Lists shared wills and the populated categories of the selected grant.
// Owns execution navigation, donor context and the My dashboard return.
// Does not expose the owner's vault links or allow will editing.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/app_icons.dart';
import '../../app/sidebar_controls.dart';
import '../../app/sidebar_link.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/app_brand.dart';
import '../../shared/ui/async_panel.dart';
import '../vault/categories.dart';
import '../vault/category_visuals.dart';
import 'executor_access_header.dart';
import 'executor_location.dart';
import 'executor_providers.dart';

class ExecutorSidebar extends ConsumerWidget {
  final String location;
  final Json? grant;
  const ExecutorSidebar({super.key, required this.location, this.grant});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = executorAccessId(location);
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
                  if (grant != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ExecutorAccessHeader(grant: grant!),
                    ),
                  SidebarLink(
                    destination: ('Shared wills', '/executor', AppIcons.people),
                    selected: executorSelected('/executor', location),
                    location: location,
                  ),
                  if (id != null && grant != null) ...[
                    SidebarLink(
                      destination: (
                        'Will overview',
                        executorWillLocation(id),
                        AppIcons.notes,
                      ),
                      selected: executorSelected(
                        executorWillLocation(id),
                        location,
                      ),
                      location: location,
                    ),
                    AsyncPanel(
                      value: ref.watch(grantedCountsProvider(id)),
                      retry: () => ref.invalidate(grantedCountsProvider(id)),
                      builder: (counts) => Column(
                        children: [
                          for (final count in counts)
                            SidebarLink(
                              destination: (
                                categoryFor(count['type']).title,
                                executorCategoryLocation(id, count['type']),
                                visualFor(count['type']).icon,
                              ),
                              selected: executorSelected(
                                executorCategoryLocation(id, count['type']),
                                location,
                              ),
                              location: location,
                            ),
                        ],
                      ),
                    ),
                  ],
                  const Divider(),
                  SidebarLink(
                    destination: ('My dashboard', '/home', AppIcons.home),
                    selected: false,
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
