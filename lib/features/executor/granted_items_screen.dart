// Lists access-scoped items with beneficiary exclusion checks.
// Owns granted pagination and read-only navigation.
// Does not load owner-only lists or decrypt list contents.
import '../../app/app_icons.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/async_panel.dart';
import '../../shared/ui/status_pill.dart';
import '../vault/categories.dart';
import '../vault/vault_item_tile.dart';
import 'granted_categories_screen.dart';

class GrantedItemsScreen extends ConsumerWidget {
  final String access;
  final String type;
  const GrantedItemsScreen({
    super.key,
    required this.access,
    required this.type,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) => PageFrame(
    title: categoryFor(type).title,
    children: [
      const StatusPill('Read-only access', icon: AppIcons.reveal),
      const SizedBox(height: 12),
      AsyncPanel(
        value: ref.watch(grantProvider(access)),
        retry: () => ref.invalidate(grantProvider(access)),
        builder: (grant) => PagedList(
          operation: 'GET_GRANTED_METAMODELS',
          field: 'getGrantedMetamodels',
          itemsField: 'models',
          variables: {'access_id': access, 'type': type},
          itemBuilder: (item) =>
              (item['ignored_beneficiaries'] as List? ?? []).contains(
                grant['beneficiary_id'],
              )
              ? const SizedBox.shrink()
              : VaultItemTile(
                  title: label(asJson(jsonDecode(item['metadata']))),
                  type: type,
                  updated: item['updated_at'],
                  readOnly: true,
                  onTap: () => context.push(
                    '/executor/' + access + '/item/' + item['id'],
                  ),
                ),
        ),
      ),
    ],
  );
}
