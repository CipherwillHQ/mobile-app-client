// Presents Cipherwill's public links in the About us settings tab.
// Owns compact website/app/policy rows and installed version placement.
// Does not render web checkout or modify account preferences.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/app_icons.dart';
import '../../shared/cipherwill_links.dart';
import '../../shared/ui/external_link.dart';
import '../../shared/ui/navigation_row.dart';
import '../../shared/ui/page_frame.dart';
import 'app_version.dart';
import 'settings_tabs.dart';

const aboutLinks = [
  ('Website', CipherwillLinks.website, AppIcons.home),
  ('Web app', CipherwillLinks.webApp, AppIcons.desktop),
  ('Privacy policy', CipherwillLinks.privacyPolicy, AppIcons.security),
  ('Terms of service', CipherwillLinks.termsOfService, AppIcons.file),
];

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Settings',
    tabs: const SettingsTabs(location: '/about'),
    children: [
      for (final link in aboutLinks)
        NavigationRow(
          title: link.$1,
          detail: link.$2,
          icon: link.$3,
          trailing: const Icon(AppIcons.external, size: 18),
          onTap: () => openExternalLink(
            context,
            link.$2,
            mode: LaunchMode.inAppBrowserView,
          ),
        ),
      const AppVersion(),
    ],
  );
}
