// Presents file metadata with owner rename and beneficiary access controls.
// Owns metadata-only edits that preserve extension and encryption fields.
// Does not rename binary contents or grant executor editing rights.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/date_label.dart';
import '../../shared/ui/remote_panel.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';

class FileDetails extends ConsumerWidget {
  final String id;
  const FileDetails({super.key, required this.id});
  @override
  Widget build(BuildContext context, WidgetRef ref) => RemotePanel(
    operation: 'GET_METAMODEL',
    variables: {'id': id},
    builder: (r) {
      final model = asJson(r['getMetamodel']);
      final metadata = asJson(jsonDecode(model['metadata']));
      return PanelSection(
        title: label(metadata),
        description: 'Updated ' + dateLabel(model['updated_at']),
        children: [
          if (metadata['file_ext'] != null)
            Text('File type: .' + metadata['file_ext']),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => perform(context, () async {
              final title = await prompt(
                context,
                'File title',
                initial: label(metadata),
              );
              if (title == null || title.isEmpty) throw const ActionCancelled();
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
            }, success: 'File renamed.'),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Rename file'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => context.push('/item/' + id + '/sharing'),
            icon: const Icon(Icons.people_outline_rounded),
            label: const Text('Beneficiary access'),
          ),
        ],
      );
    },
  );
}
