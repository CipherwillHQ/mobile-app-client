// Matches the web General Settings tab with flat native controls.
// Owns appearance, planning destinations and existing account actions.
// Does not change provider authentication or encrypted vault contents.
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/legal_links.dart';
import 'appearance_selector.dart';
import 'settings_destination.dart';
import 'settings_tabs.dart';
import 'signin_settings.dart';
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
            'Segments & planning',
            'Enabled categories, check-ins and reminders',
            Icons.tune_outlined,
            '/preferences',
          ),
          SettingsDestination(
            'Notifications',
            'Email preferences and verified phone channels',
            Icons.notifications_none_outlined,
            '/phones',
          ),
        ],
      ),
      SigninSettings(),
      SessionSettings(),
      SettingsDestination(
        'Send feedback',
        'Help us improve Cipherwill',
        Icons.chat_bubble_outline,
        '/feedback',
      ),
      LegalLinks(),
    ],
  );
}
