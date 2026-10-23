// Lists vault assets with explicit plan and segment gates
// Owns category lists and creation navigation.
// Does not decrypt list metadata.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import 'categories.dart';
import 'vault_repository.dart';

class AssetListScreen extends ConsumerWidget {
  final String type;
  const AssetListScreen({super.key, required this.type});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = categoryFor(type);
    final preferences = ref.watch(preferencesProvider).value;
    final account = ref.watch(accountProvider).value;
    final denied = category.premium && account?['plan'] == 'free';
    final disabled =
        category.preference != null &&
        preferences?[category.preference] != true;
    if (denied || disabled) {
      return PageFrame(
        title: category.title,
        children: [
          Text(
            denied
                ? 'This category requires an existing Premium subscription.'
                : 'Enable this category in Settings to start using it.',
          ),
        ],
      );
    }
    return PageFrame(
      title: category.title,
      actions: [
        IconButton(
          tooltip: 'Add item',
          icon: const Icon(Icons.add),
          onPressed: () => perform(context, () async {
            final title = await prompt(context, 'Item title');
            if (title == null) return;
            final repository = VaultRepository(
              ref.read(apiProvider),
              ref.read(sessionProvider.notifier).lease(),
            );
            final id = await repository.create(category, title);
            if (context.mounted) {
              context.push('/item/' + id + '?type=' + type + '&new=true');
            }
          }),
        ),
      ],
      children: [
        PagedList(
          operation: 'GET_METAMODELS',
          field: 'getMetamodels',
          itemsField: 'models',
          variables: {'type': type},
          itemBuilder: (item) => Card(
            child: ListTile(
              title: Text(label(asJson(jsonDecode(item['metadata'])))),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  context.push('/item/' + item['id'] + '?type=' + type),
            ),
          ),
        ),
      ],
    );
  }
}
