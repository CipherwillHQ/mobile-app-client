// Explains desktop-only account and backup actions using the canonical app URL.
// Owns a reusable notice and selectable desktop address.
// Does not reset, delete, export or restore any account data.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_notice.dart';

class DesktopHandoff extends StatelessWidget {
  final String purpose;
  const DesktopHandoff({super.key, required this.purpose});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(AppIcons.desktop, size: 28),
        const SizedBox(height: 16),
        Text(
          'Continue on desktop',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Text('To $purpose, visit cipherwill.com/app on a desktop.'),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(child: SelectableText('https://cipherwill.com/app')),
            IconButton(
              tooltip: 'Copy desktop address',
              icon: const Icon(AppIcons.copy),
              onPressed: () async {
                await Clipboard.setData(
                  const ClipboardData(text: 'https://cipherwill.com/app'),
                );
                if (context.mounted) showNotice(context, 'Address copied.');
              },
            ),
          ],
        ),
      ],
    ),
  );
}
