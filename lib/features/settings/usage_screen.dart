// Places existing storage counters in the web Settings Usage tab.
// Owns usage-page framing and settings navigation.
// Does not introduce quotas or collect device telemetry.
import 'package:flutter/material.dart';
import '../../shared/ui/page_frame.dart';
import '../storage/storage_usage.dart';
import 'settings_tabs.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});
  @override
  Widget build(BuildContext context) => const PageFrame(
    title: 'Settings',
    tabs: SettingsTabs(location: '/usage'),
    children: [StorageUsage()],
  );
}
