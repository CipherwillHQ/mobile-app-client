// Directs backup and restore actions to the existing desktop web application.
// Owns the mobile backup settings explanation.
// Does not pick files, share decrypted data or restore archives on mobile.
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/desktop_handoff.dart';
import '../settings/settings_tabs.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Settings',
    tabs: SettingsTabs(location: '/backup'),
    children: [
      DesktopHandoff(purpose: 'back up or restore your Cipherwill data'),
    ],
  );
}
