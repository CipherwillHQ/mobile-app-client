// Provides the native Cipherwill rich-text editor
// Owns Quill document and change callbacks.
// Does not save uncommitted content to the backend.
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'html_codec.dart';
import 'html_embed.dart';

class RichNoteEditor extends StatefulWidget {
  final String content;
  final ValueChanged<String> onChanged;
  final bool readOnly;
  const RichNoteEditor({
    super.key,
    required this.content,
    required this.onChanged,
    this.readOnly = false,
  });
  @override
  State<RichNoteEditor> createState() => _RichNoteEditorState();
}

class _RichNoteEditorState extends State<RichNoteEditor> {
  late final QuillController controller;
  String last = '';
  @override
  void initState() {
    super.initState();
    controller = QuillController(
      document: Document.fromDelta(noteFromHtml(widget.content)),
      selection: const TextSelection.collapsed(offset: 0),
    )..readOnly = widget.readOnly;
    last = noteToHtml(controller.document.toDelta());
    controller.addListener(changed);
  }

  void changed() {
    if (widget.readOnly) return;
    final html = noteToHtml(controller.document.toDelta());
    if (html != last) {
      last = html;
      widget.onChanged(html);
    }
  }

  @override
  void dispose() {
    controller.removeListener(changed);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      children: [
        if (!widget.readOnly)
          QuillSimpleToolbar(
            controller: controller,
            config: const QuillSimpleToolbarConfig(
              multiRowsDisplay: false,
              toolbarSize: 54,
              showFontFamily: false,
              showFontSize: false,
              showColorButton: false,
              showBackgroundColorButton: false,
              showSearchButton: false,
            ),
          ),
        if (!widget.readOnly) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Text(
              'Swipe for more formatting',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Divider(height: 1),
        ],
        SizedBox(
          height: 360,
          child: QuillEditor.basic(
            controller: controller,
            config: const QuillEditorConfig(
              padding: EdgeInsets.all(18),
              placeholder: 'Write something worth keeping…',
              embedBuilders: [HtmlEmbedBuilder()],
            ),
          ),
        ),
      ],
    ),
  );
}
