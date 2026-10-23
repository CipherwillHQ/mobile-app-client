// Renders one category draft and its committed-save status.
// Owns field layout and native note editing.
// Does not write the draft to the backend.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/asset_fields.dart';
import '../notes/rich_note_editor.dart';
import 'asset_category.dart';

class AssetDraftForm extends StatelessWidget {
  final GlobalKey<FormState> form;
  final TextEditingController title;
  final AssetCategory category;
  final Json initial;
  final Json draft;
  final String id;
  final String status;
  final bool saving;
  final ValueChanged<Json> changed;
  final VoidCallback save;
  const AssetDraftForm({
    super.key,
    required this.form,
    required this.title,
    required this.category,
    required this.initial,
    required this.draft,
    required this.id,
    required this.status,
    required this.saving,
    required this.changed,
    required this.save,
  });
  @override
  Widget build(BuildContext context) => Form(
    key: form,
    child: Column(
      children: [
        TextFormField(
          controller: title,
          decoration: const InputDecoration(labelText: 'Title'),
          onChanged: (_) => changed({...draft}),
          validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
        ),
        const SizedBox(height: 20),
        if (category.type == 'NOTE')
          RichNoteEditor(
            content: initial['content']?.toString() ?? '',
            onChanged: (html) => changed({'content': html}),
          )
        else
          AssetFields(
            fields: category.fields,
            initial: initial,
            onChanged: changed,
          ),
        const SizedBox(height: 16),
        Semantics(liveRegion: true, child: Text(status)),
        const SizedBox(height: 12),
        FilledButton(
          onPressed: saving ? null : save,
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () => context.push('/item/' + id + '/sharing'),
          child: const Text('Beneficiary access'),
        ),
      ],
    ),
  );
}
