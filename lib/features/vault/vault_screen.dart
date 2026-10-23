// Organizes the complete vault into searchable, recognizable category cards.
// Owns category discovery and existing preference status.
// Does not load decrypted records or change backend plan restrictions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/section_heading.dart';
import 'category_grid.dart';

class VaultScreen extends ConsumerStatefulWidget {
  const VaultScreen({super.key});
  @override
  ConsumerState<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends ConsumerState<VaultScreen> {
  String query = '';
  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Your vault',
    subtitle: 'Everything important. Thoughtfully organized.',
    children: [
      TextField(
        onChanged: (value) => setState(() => query = value),
        decoration: const InputDecoration(
          hintText: 'Find a category',
          prefixIcon: Icon(Icons.search_rounded),
          filled: true,
        ),
      ),
      const SectionHeading('Your categories'),
      AsyncPanel(
        value: ref.watch(preferencesProvider),
        retry: () => ref.invalidate(preferencesProvider),
        builder: (preferences) => RemotePanel(
          operation: 'GET_METAMODEL_TYPE_COUNTS',
          builder: (result) => CategoryGrid(
            preferences: preferences,
            query: query,
            counts: {
              for (final item in jsonList(result['getMetamodelTypeCounts']))
                item['type'].toString(): item['count'] as int,
            },
          ),
        ),
      ),
    ],
  );
}
