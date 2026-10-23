// Presents enabled vault categories and backend plan restrictions
// Owns category navigation.
// Does not load or decrypt individual assets.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import 'categories.dart';

class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Your vault',
    children: [
      const Text('Your information, organized for the people you trust.'),
      const SizedBox(height: 16),
      AsyncPanel(
        value: ref.watch(preferencesProvider),
        retry: () => ref.invalidate(preferencesProvider),
        builder: (preferences) => Column(
          children: [
            for (final category in categories)
              Card(
                child: ListTile(
                  leading: Icon(
                    category.type == 'FILE'
                        ? Icons.folder_outlined
                        : Icons.lock_outline,
                  ),
                  title: Text(category.title),
                  subtitle: Text(
                    category.preference != null &&
                            preferences[category.preference] != true
                        ? 'Enable in Settings'
                        : category.premium
                        ? 'Premium'
                        : 'Included',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/vault/' + category.type),
                ),
              ),
          ],
        ),
      ),
    ],
  );
}
