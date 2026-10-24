// Provides the existing Cipherwill policy links in authentication and settings.
// Owns accessible native navigation to the published legal documents.
// Does not render marketing content or collect user data.
import 'package:flutter/material.dart';
import '../cipherwill_links.dart';
import 'external_link.dart';

class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key});
  @override
  Widget build(BuildContext context) => Wrap(
    children: [
      TextButton(
        onPressed: () =>
            openExternalLink(context, CipherwillLinks.privacyPolicy),
        child: const Text('Privacy policy'),
      ),
      TextButton(
        onPressed: () =>
            openExternalLink(context, CipherwillLinks.termsOfService),
        child: const Text('Terms of service'),
      ),
    ],
  );
}
