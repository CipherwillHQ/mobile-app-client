// Keeps provider linking accessible in General Settings.
// Owns Google and iOS Apple linking controls for the current account.
// Does not create a separate account or save provider credentials.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/panel_section.dart';

class SigninSettings extends ConsumerWidget {
  const SigninSettings({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PanelSection(
    title: 'Sign-in methods',
    description: 'Link a provider to use it with this existing account.',
    children: [
      OutlinedButton.icon(
        onPressed: () => perform(
          context,
          () => ref.read(authProvider).google(link: true),
          success: 'Google account linked.',
        ),
        icon: const Icon(Icons.link_outlined),
        label: const Text('Link Google'),
      ),
      if (Platform.isIOS) ...[
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => perform(
            context,
            () => ref.read(authProvider).apple(link: true),
            success: 'Apple account linked.',
          ),
          icon: const Icon(Icons.apple),
          label: const Text('Link Apple'),
        ),
      ],
    ],
  );
}
