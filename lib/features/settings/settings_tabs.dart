// Extends the familiar Settings tabs with native About information.
// Owns scrollable tab navigation and a visible, accessible selected tab.
// Does not mutate settings or keep hidden form controllers alive.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const settingsTabs = [
  ('General Settings', '/settings'),
  ('Profile', '/profile'),
  ('Backup', '/backup'),
  ('Usage', '/usage'),
  ('About us', '/about'),
];

class SettingsTabs extends StatefulWidget {
  final String location;
  const SettingsTabs({super.key, required this.location});
  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  final selectedTab = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(alignSelected);
  }

  @override
  void didUpdateWidget(SettingsTabs oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.location != oldWidget.location) {
      WidgetsBinding.instance.addPostFrameCallback(alignSelected);
    }
  }

  void alignSelected(Duration timestamp) {
    if (!mounted) return;
    final tabContext = selectedTab.currentContext;
    if (tabContext != null) Scrollable.ensureVisible(tabContext, alignment: .5);
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final tab in settingsTabs)
            Semantics(
              key: widget.location == tab.$2 ? selectedTab : null,
              selected: widget.location == tab.$2,
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
                          color: widget.location == tab.$2
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      tab.$1,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: widget.location == tab.$2
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
