// Presents owner file actions in a labeled native sheet.
// Owns metadata-only rename, beneficiary navigation and confirmed deletion.
// Does not decrypt files, alter extensions or grant executor editing rights.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/app_icons.dart';
import '../../app/navigate_back.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/action_sheet.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/remote_panel.dart';
import '../security/session_controller.dart';

class FileOptions extends ConsumerWidget {
  final String id;
  const FileOptions({super.key, required this.id});
  Future<void> open(BuildContext context, WidgetRef ref) async {
    final action = await chooseAction(
      context,
      title: 'File options',
      actions: const [
        SheetAction('rename', 'Rename file', AppIcons.edit),
        SheetAction('sharing', 'Beneficiary access', AppIcons.people),
        SheetAction(
          'delete',
          'Delete file',
          AppIcons.delete,
          destructive: true,
        ),
      ],
    );
    if (!context.mounted) return;
    if (action == 'sharing') {
      context.push('/item/$id/sharing?type=FILE');
    } else if (action == 'rename') {
      await perform(context, () async {
        final result = await ref.read(apiProvider).run('GET_METAMODEL', {
          'id': id,
        });
        final metadata = asJson(
          jsonDecode(asJson(result['getMetamodel'])['metadata']),
        );
        if (!context.mounted) return;
        final title = await prompt(
          context,
          'File title',
          initial: label(metadata),
        );
        if (title == null || title.isEmpty) throw const ActionCancelled();
        if (!context.mounted) return;
        final lease = ref.read(sessionProvider.notifier).lease();
        lease.check();
        await ref.read(apiProvider).run('UPDATE_METAMODEL', {
          'data': {
            'id': id,
            'metadata': jsonEncode({...metadata, 'title': title}),
          },
        });
        lease.check();
        ref.invalidate(remoteProvider);
      }, success: 'File renamed.');
    } else if (action == 'delete') {
      await perform(context, () async {
        if (!await confirm(context, 'Delete this file?') || !context.mounted) {
          return;
        }
        await ref.read(apiProvider).run('DELETE_METAMODEL', {'id': id});
        if (context.mounted) await navigateBack(context, fallback: '/storage');
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) => IconButton(
    tooltip: 'File options',
    onPressed: () => open(context, ref),
    icon: const Icon(AppIcons.more),
  );
}
