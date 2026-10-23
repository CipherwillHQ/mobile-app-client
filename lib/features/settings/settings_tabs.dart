// Matches the web Settings page's four visible tabs.
// Owns scrollable tab navigation and accessible selected states.
// Does not mutate settings or keep hidden form controllers alive.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const settingsTabs = [
  ('General Settings', '/settings'),
  ('Profile', '/profile'),
  ('Backup', '/backup'),
  ('Usage', '/usage'),
];

class SettingsTabs extends StatelessWidget {
  final String location;
  const SettingsTabs({super.key, required this.location});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final tab in settingsTabs)
            Semantics(
              selected: location == tab.$2,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => context.replace(tab.$2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: location == tab.$2
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      tab.$1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: location == tab.$2
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
