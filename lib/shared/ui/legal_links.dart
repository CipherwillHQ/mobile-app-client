// Provides the existing Cipherwill policy links in authentication and settings.
// Owns accessible native navigation to the published legal documents.
// Does not render marketing content or collect user data.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'actions.dart';

class LegalLinks extends StatelessWidget {
  const LegalLinks({super.key});
  Future<void> open(BuildContext context, String path) =>
      perform(context, () async {
        if (!await launchUrl(
          Uri.parse('https://cipherwill.com/i/' + path),
          mode: LaunchMode.externalApplication,
        )) {
          throw StateError('Unable to open this document.');
        }
      });
  @override
  Widget build(BuildContext context) => Wrap(
    children: [
      TextButton(
        onPressed: () => open(context, 'privacy-policy'),
        child: const Text('Privacy policy'),
      ),
      TextButton(
        onPressed: () => open(context, 'terms-of-service'),
        child: const Text('Terms of service'),
      ),
    ],
  );
}
