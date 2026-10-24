// Lists access-scoped items with beneficiary exclusion checks.
// Owns granted pagination and read-only navigation.
// Does not load owner-only lists or decrypt list contents.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/loading_panel.dart';
import '../vault/categories.dart';
import '../vault/vault_item_tile.dart';
import 'executor_access_scope.dart';
import 'executor_location.dart';
import 'unavailable_access.dart';

class GrantedItemsScreen extends StatelessWidget {
  final String access;
  final String type;
  const GrantedItemsScreen({
    super.key,
    required this.access,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    final grant = ExecutorAccessScope.maybeOf(context);
    if (!ExecutorAccessScope.permits(context, access)) {
      return PageFrame(
        title: categoryFor(type).title,
        children: const [LoadingPanel()],
      );
    }
    return PageFrame(
      title: categoryFor(type).title,
      children: [
        PagedList(
          operation: 'GET_GRANTED_METAMODELS',
          field: 'getGrantedMetamodels',
          itemsField: 'models',
          variables: {'access_id': access, 'type': type},
          onFailure: (error) => returnToSharedWills(context, error),
          filter: (item) => !(item['ignored_beneficiaries'] as List? ?? [])
              .contains(grant!['beneficiary_id']),
          itemBuilder: (item) => VaultItemTile(
            title: label(asJson(jsonDecode(item['metadata']))),
            type: type,
            updated: item['updated_at'],
            readOnly: true,
            onTap: () => context.push(executorItemLocation(access, item['id'])),
          ),
        ),
      ],
    );
  }
}
