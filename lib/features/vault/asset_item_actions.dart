// Opens the text item's beneficiary and deletion actions.
// Owns the labeled options sheet and explicitly confirmed metadata deletion.
// Does not discard the editor's draft or report an unconfirmed deletion.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/app_icons.dart';
import '../../app/providers.dart';
import '../../shared/ui/action_sheet.dart';
import '../../shared/ui/actions.dart';

Future<bool> assetItemOptions(
  BuildContext context,
  WidgetRef ref,
  String id,
  String type,
) async {
  final action = await chooseAction(
    context,
    title: 'Item options',
    actions: const [
      SheetAction('sharing', 'Beneficiary access', AppIcons.people),
      SheetAction('delete', 'Delete item', AppIcons.delete, destructive: true),
    ],
  );
  if (!context.mounted) return false;
  if (action == 'sharing') {
    context.push('/item/$id/sharing?type=$type');
    return false;
  }
  if (action != 'delete') return false;
  var deleted = false;
  await perform(context, () async {
    if (!await confirm(context, 'Delete this item?')) return;
    await ref.read(apiProvider).run('DELETE_METAMODEL', {'id': id});
    deleted = true;
  });
  return deleted;
}
