// Opens a public link with the caller's native browser presentation.
// Owns URL-launch failure feedback shared by authentication and settings.
// Does not fetch pages or change account navigation.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'actions.dart';

Future<void> openExternalLink(
  BuildContext context,
  String url, {
  LaunchMode mode = LaunchMode.externalApplication,
}) => perform(context, () async {
  if (!await launchUrl(Uri.parse(url), mode: mode)) {
    throw StateError('Unable to open this link.');
  }
});
