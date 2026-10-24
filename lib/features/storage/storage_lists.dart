// Presents owner and access-scoped folder and file lists.
// Owns metadata navigation and deliberate owner folder deletion.
// Does not decrypt files or change executor permissions.
import '../../app/app_icons.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/feature_card.dart';
import '../../shared/ui/actions.dart';
import '../vault/vault_item_tile.dart';
import '../executor/executor_access_scope.dart';
import '../executor/unavailable_access.dart';

class StorageFolders extends ConsumerWidget {
  final String? folder;
  final String? access;
  final VoidCallback changed;
  const StorageFolders({
    super.key,
    this.folder,
    this.access,
    required this.changed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => PagedList(
    operation: access != null ? 'GET_GRANTED_STORAGE_FOLDERS' : 'GET_FOLDERS',
    field: access != null ? 'getGrantedStorageFolders' : 'getFolders',
    itemsField: 'folders',
    variables: {'folder_id': folder, if (access != null) 'access_id': access},
    onFailure: access == null
        ? null
        : (error) => returnToSharedWills(context, error),
    empty: const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text('No folders'),
    ),
    itemBuilder: (item) => FeatureCard(
      title: item['name'],
      subtitle: '',
      icon: AppIcons.folder,
      onTap: () => context.push(
        Uri(
          path: '/storage',
          queryParameters: {'folder': item['id'], 'access': ?access},
        ).toString(),
      ),
      trailing: access != null
          ? null
          : IconButton(
              tooltip: 'Delete folder',
              icon: const Icon(AppIcons.delete),
              onPressed: () => perform(context, () async {
                if (!await confirm(context, 'Delete this folder?')) return;
                await ref.read(apiProvider).run('DELETE_FOLDER', {
                  'id': item['id'],
                });
                changed();
              }),
            ),
    ),
  );
}

class StorageFiles extends StatelessWidget {
  final String? folder;
  final String? access;
  const StorageFiles({super.key, this.folder, this.access});
  @override
  Widget build(BuildContext context) {
    final grant = access == null ? null : ExecutorAccessScope.maybeOf(context);
    return PagedList(
      operation: access != null ? 'GET_GRANTED_METAMODELS' : 'GET_METAMODELS',
      field: access != null ? 'getGrantedMetamodels' : 'getMetamodels',
      itemsField: 'models',
      variables: {
        'folder_id': folder,
        'type': 'FILE',
        if (access != null) 'access_id': access,
      },
      filter: grant == null
          ? null
          : (item) => !(item['ignored_beneficiaries'] as List? ?? []).contains(
              grant['beneficiary_id'],
            ),
      onFailure: access == null
          ? null
          : (error) => returnToSharedWills(context, error),
      empty: const EmptyState(
        title: 'No files here yet',
        message: 'Your files will appear here when uploaded.',
        icon: AppIcons.upload,
      ),
      itemBuilder: (item) => VaultItemTile(
        title: label(asJson(jsonDecode(item['metadata']))),
        type: 'FILE',
        updated: item['updated_at'],
        readOnly: access != null,
        onTap: () => context.push(
          Uri(
            pathSegments: ['', 'file', item['id']],
            queryParameters: access == null ? null : {'access': access!},
          ).toString(),
        ),
      ),
    );
  }
}
