// Matches the web client's flat mobile section navigation.
// Owns Home/Data/Network/Platform touch targets and active styling.
// Does not open protected data or retain inactive pages.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigation_destinations.dart';

class MobileSectionBar extends StatelessWidget {
  final String location;
  final VoidCallback openMenu;
  const MobileSectionBar({
    super.key,
    required this.location,
    required this.openMenu,
  });
  @override
  Widget build(BuildContext context) => Material(
    color: Theme.of(context).cardTheme.color,
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final entry in mobileDestinations)
              Expanded(
                child: InkWell(
                  onTap: () =>
                      entry.$2 == '/home' && Uri.parse(location).path == '/home'
                      ? openMenu()
                      : context.go(entry.$2),
                  child: Semantics(
                    selected: mobileSection(location) == entry.$2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            entry.$3,
                            size: 22,
                            color: mobileSection(location) == entry.$2
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            entry.$1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: mobileSection(location) == entry.$2
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
