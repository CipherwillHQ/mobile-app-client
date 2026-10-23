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
  Widget build(BuildContext context) => Column(
    children: [
      if (!widget.readOnly)
        QuillSimpleToolbar(
          controller: controller,
          config: const QuillSimpleToolbarConfig(
            showFontFamily: false,
            showFontSize: false,
            showColorButton: false,
            showBackgroundColorButton: false,
            showSearchButton: false,
          ),
        ),
      SizedBox(
        height: 360,
        child: QuillEditor.basic(
          controller: controller,
          config: const QuillEditorConfig(
            padding: EdgeInsets.all(12),
            embedBuilders: [HtmlEmbedBuilder()],
          ),
        ),
      ),
    ],
  );
}
