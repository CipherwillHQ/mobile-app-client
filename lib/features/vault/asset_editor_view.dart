// Presents a focused text editor with one save area and item options.
// Owns draft form layout, loading/recovery presentation and Back wiring.
// Does not load or save encrypted content itself.
import 'package:flutter/material.dart';
import '../../app/app_icons.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/error_panel.dart';
import 'asset_category.dart';
import 'asset_draft_form.dart';

class AssetEditorView extends StatelessWidget {
  final AssetCategory category;
  final GlobalKey<FormState> form;
  final TextEditingController title;
  final Json? initial;
  final Json draft;
  final String? error;
  final String status;
  final bool saving, canLeave;
  final VoidCallback leave, save, options, retry, checkPending;
  final ValueChanged<Json> changed;
  const AssetEditorView({
    super.key,
    required this.category,
    required this.form,
    required this.title,
    required this.initial,
    required this.draft,
    required this.error,
    required this.status,
    required this.saving,
    required this.canLeave,
    required this.leave,
    required this.save,
    required this.options,
    required this.retry,
    required this.checkPending,
    required this.changed,
  });
  @override
  Widget build(BuildContext context) => PageFrame(
    title: category.title,
    focused: true,
    canLeave: canLeave,
    onBlockedBack: leave,
    footer:
        initial != null &&
            (category.type != 'NOTE' || status.startsWith('Save failed'))
        ? FilledButton.icon(
            onPressed: saving ? null : save,
            icon: const Icon(AppIcons.check),
            label: Text(saving ? 'Saving…' : 'Save changes'),
          )
        : null,
    actions: [
      if (category.type == 'NOTE' && initial != null)
        IconButton(
          tooltip: 'Save note',
          onPressed: saving ? null : save,
          icon: const Icon(AppIcons.check),
        ),
      IconButton(
        tooltip: 'Item options',
        onPressed: saving ? null : options,
        icon: const Icon(AppIcons.more),
      ),
    ],
    children: [
      if (error != null) ...[
        ErrorPanel(message: error!, retry: retry),
        TextButton(
          onPressed: checkPending,
          child: const Text('Check pending save'),
        ),
      ] else if (initial == null)
        const Center(child: CircularProgressIndicator())
      else
        AssetDraftForm(
          form: form,
          title: title,
          category: category,
          initial: initial!,
          draft: draft,
          status: status,
          changed: changed,
        ),
    ],
  );
}
