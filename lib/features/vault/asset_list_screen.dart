// Lists vault assets with explicit plan and category gates.
// Owns title search, item refresh and creation navigation.
// Does not decrypt list metadata or bypass server authorization.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/empty_state.dart';
import '../security/session_controller.dart';
import 'categories.dart';
import 'category_visuals.dart';
import 'vault_repository.dart';
import 'vault_item_tile.dart';
import 'metadata_search.dart';

class AssetListScreen extends ConsumerStatefulWidget {
  final String type;
  const AssetListScreen({super.key, required this.type});
  @override
  ConsumerState<AssetListScreen> createState() => _AssetListScreenState();
}

class _AssetListScreenState extends ConsumerState<AssetListScreen> {
  String query = '';
  int revision = 0;
  Future<void> open(String id, {bool fresh = false}) async {
    await context.push(
      '/item/' + id + '?type=' + widget.type + (fresh ? '&new=true' : ''),
    );
    if (mounted) {
      ref.invalidate(remoteProvider);
      setState(() => revision++);
    }
  }

  Future<void> add() => perform(context, () async {
    final title = await prompt(context, 'Item title');
    if (title == null) return;
    final repository = VaultRepository(
      ref.read(apiProvider),
      ref.read(sessionProvider.notifier).lease(),
    );
    final id = await repository.create(categoryFor(widget.type), title);
    if (mounted) await open(id, fresh: true);
  });
  @override
  Widget build(BuildContext context) {
    final type = widget.type;
    final category = categoryFor(type);
    final preferences = ref.watch(preferencesProvider).value;
    final account = ref.watch(accountProvider).value;
    final denied = category.premium && account?['plan'] == 'free';
    final disabled =
        category.preference != null &&
        preferences?[category.preference] != true;
    final visual = visualFor(type);
    if (denied || disabled) {
      return PageFrame(
        title: category.title,
        children: [
          EmptyState(
            title: denied ? 'Premium category' : 'Enable this category',
            message: denied
                ? 'This category requires an existing Premium subscription.'
                : 'Choose the categories you want to use in planning settings.',
            icon: visual.icon,
            action: denied ? 'Subscription details' : 'Open settings',
            onAction: () => context.push(denied ? '/billing' : '/preferences'),
          ),
        ],
      );
    }
    return PageFrame(
      title: category.title,
      subtitle: visual.description,
      actions: [
        IconButton(
          tooltip: 'Add item',
          icon: const Icon(Icons.add_rounded),
          onPressed: add,
        ),
      ],
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search item titles',
            prefixIcon: Icon(Icons.search_rounded),
          ),
          onChanged: (value) => setState(() => query = value),
        ),
        PagedList(
          key: ValueKey(revision),
          operation: 'GET_METAMODELS',
          field: 'getMetamodels',
          itemsField: 'models',
          variables: {'type': type},
          filter: (item) => metadataMatches(item, query),
          empty: query.trim().isNotEmpty
              ? const EmptyState(
                  title: 'No matching items on loaded pages',
                  message: 'Try another title or load more items if available.',
                  icon: Icons.search_rounded,
                )
              : EmptyState(
                  title: 'Your first item starts here',
                  message:
                      'Keep important details together for you and your beneficiaries.',
                  icon: visual.icon,
                  action: 'Add item',
                  onAction: add,
                ),
          itemBuilder: (item) => VaultItemTile(
            title: label(asJson(jsonDecode(item['metadata']))),
            type: type,
            updated: item['updated_at'],
            onTap: () => open(item['id']),
          ),
        ),
      ],
    );
  }
}
