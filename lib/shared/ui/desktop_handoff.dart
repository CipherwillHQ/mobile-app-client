// Explains desktop-only account and backup actions using the canonical app URL.
// Owns a reusable notice and selectable desktop address.
// Does not reset, delete, export or restore any account data.
import 'package:flutter/material.dart';

class DesktopHandoff extends StatelessWidget {
  final String purpose;
  const DesktopHandoff({super.key, required this.purpose});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.desktop_windows_outlined, size: 36),
        const SizedBox(height: 20),
        Text(
          'Continue on desktop',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text(
          'To $purpose, visit cipherwill.com/app on a desktop and sign in to your account.',
        ),
        const SizedBox(height: 16),
        const SelectableText('https://cipherwill.com/app'),
      ],
    ),
  );
}
