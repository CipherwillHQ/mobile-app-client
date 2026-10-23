// Mirrors the web Manage Data hub and its segment grouping.
// Owns category discovery from existing account preferences.
// Does not load decrypted records or change backend restrictions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import 'category_grid.dart';

class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Manage Data',
    children: [
      AsyncPanel(
        value: ref.watch(preferencesProvider),
        retry: () => ref.invalidate(preferencesProvider),
        builder: (preferences) => CategoryGrid(preferences: preferences),
      ),
    ],
  );
}
