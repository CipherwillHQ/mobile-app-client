// Lists access-scoped items with beneficiary exclusion checks
// Owns granted pagination and read-only navigation.
// Does not load owner-only lists.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../vault/categories.dart';
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
  Widget build(BuildContext context, WidgetRef ref) {
    final grant = ref.watch(grantProvider(access));
    if (!grant.hasValue) {
      return const PageFrame(
        title: 'Granted items',
        children: [Text('Access unavailable or still loading.')],
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
          itemBuilder: (item) =>
              (item['ignored_beneficiaries'] as List? ?? []).contains(
                grant.value!['beneficiary_id'],
              )
              ? const SizedBox.shrink()
              : Card(
                  child: ListTile(
                    title: Text(label(asJson(jsonDecode(item['metadata'])))),
                    onTap: () => context.push(
                      '/executor/' + access + '/item/' + item['id'],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
