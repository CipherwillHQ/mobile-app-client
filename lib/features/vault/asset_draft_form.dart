// Renders one category draft and its committed-save status.
// Owns grouped fields, note editing and sharing navigation.
// Does not write drafts or declare incomplete saves successful.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/asset_fields.dart';
import '../../shared/ui/panel_section.dart';
import '../../shared/ui/status_pill.dart';
import '../../app/design_tokens.dart';
import '../notes/note_editor.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PanelSection(
          title: 'Item details',
          children: [
            TextFormField(
              controller: title,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (_) => changed({...draft}),
              validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
            ),
          ],
        ),
        PanelSection(
          title: category.type == 'NOTE' ? 'Your note' : 'Vault contents',
          description: category.type == 'NOTE'
              ? 'Changes save automatically after you pause typing.'
              : 'Start with required fields. Add other details when you need them.',
          children: [
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
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: Semantics(
            liveRegion: true,
            child: StatusPill(
              status,
              icon: status == 'Saved'
                  ? Icons.check_circle_outline_rounded
                  : status == 'Saving…'
                  ? Icons.sync_rounded
                  : Icons.info_outline_rounded,
              color: status == 'Saved'
                  ? CipherwillColors.sage
                  : status.startsWith('Save failed')
                  ? Theme.of(context).colorScheme.error
                  : CipherwillColors.clay,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: saving ? null : save,
          icon: const Icon(Icons.check_rounded),
          label: Text(saving ? 'Saving…' : 'Save changes'),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => context.push('/item/' + id + '/sharing'),
          icon: const Icon(Icons.people_outline_rounded),
          label: const Text('Beneficiary access'),
        ),
      ],
    ),
  );
}
