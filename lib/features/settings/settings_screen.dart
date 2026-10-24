// Matches the web General Settings tab with flat native controls.
// Owns appearance, planning destinations and existing account actions.
// Does not change provider authentication or encrypted vault contents.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/panel_section.dart';
import 'appearance_selector.dart';
import 'settings_destination.dart';
import 'settings_tabs.dart';
import 'session_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Settings',
    tabs: SettingsTabs(location: '/settings'),
    children: [
      PanelSection(title: 'Appearance', children: [AppearanceSelector()]),
      PanelSection(
        title: 'Preferences',
        children: [
          SettingsDestination(
            'Segments',
            'Choose your enabled data categories',
            AppIcons.settings,
            '/preferences',
          ),
          SettingsDestination(
            'Notifications',
            'Email preferences and verified phone channels',
            AppIcons.notifications,
            '/phones',
          ),
        ],
      ),
      SessionSettings(),
      SettingsDestination(
        'Send feedback',
        'Help us improve Cipherwill',
        AppIcons.feedback,
        '/feedback',
      ),
    ],
  );
}
