// Renders one category draft and its committed-save status.
// Owns a flat title, required/optional fields and simple note editing.
// Does not write drafts or declare incomplete saves successful.
import 'package:flutter/material.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/asset_fields.dart';
import '../../shared/ui/save_status.dart';
import '../notes/note_editor.dart';
import 'asset_category.dart';

class AssetDraftForm extends StatelessWidget {
  final GlobalKey<FormState> form;
  final TextEditingController title;
  final AssetCategory category;
  final Json initial;
  final Json draft;
  final String status;
  final ValueChanged<Json> changed;
  const AssetDraftForm({
    super.key,
    required this.form,
    required this.title,
    required this.category,
    required this.initial,
    required this.draft,
    required this.status,
    required this.changed,
  });
  @override
  Widget build(BuildContext context) => Form(
    key: form,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SaveStatus(status),
        const SizedBox(height: 16),
        TextFormField(
          controller: title,
          textInputAction: TextInputAction.next,
          style: category.type == 'NOTE'
              ? Theme.of(context).textTheme.headlineSmall
              : null,
          decoration: category.type == 'NOTE'
              ? const InputDecoration(
                  hintText: 'Title',
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                )
              : const InputDecoration(labelText: 'Title'),
          onChanged: (_) => changed({...draft}),
          validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
        ),
        const SizedBox(height: 20),
        if (category.type == 'NOTE')
          NoteEditor(
            content: initial['content']?.toString() ?? '',
            onChanged: (html) => changed({'content': html}),
          )
        else
          AssetFields(
            fields: category.fields,
            initial: initial,
            onChanged: changed,
          ),
      ],
    ),
  );
}
