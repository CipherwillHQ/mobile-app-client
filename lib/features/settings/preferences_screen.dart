// Matches the web Segments page's category preferences.
// Owns enabled-category switches and online preference updates.
// Does not edit timeline intervals or reset scheduled events.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/icon_badge.dart';
import '../vault/categories.dart';
import '../vault/category_visuals.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: 'Segments',
    subtitle: 'Choose the information you want to secure.',
    children: [
      AsyncPanel(
        value: ref.watch(preferencesProvider),
        retry: () => ref.invalidate(preferencesProvider),
        builder: (preferences) => Column(
          children: [
            for (final category in categories)
              if (category.preference != null)
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: IconBadge(
                    visualFor(category.type).icon,
                    color: visualFor(category.type).color,
                    size: 36,
                  ),
                  title: Text(category.title),
                  subtitle: category.premium
                      ? const Text('Premium category')
                      : null,
                  value: preferences[category.preference] == true,
                  onChanged: (value) => perform(context, () async {
                    await ref.read(apiProvider).run('UPDATE_PREFERENCES', {
                      'key': category.preference!,
                      'value': value.toString(),
                    });
                    ref.invalidate(preferencesProvider);
                    ref.invalidate(remoteProvider);
                  }, success: 'Preference saved.'),
                ),
          ],
        ),
      ),
    ],
  );
}
