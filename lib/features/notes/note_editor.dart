// Provides the simple full-width note surface used by the web client.
// Owns HTML-compatible document edits without formatting controls.
// Does not save uncommitted content to the backend.
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'html_codec.dart';
import 'html_embed.dart';

class NoteEditor extends StatefulWidget {
  final String content;
  final ValueChanged<String> onChanged;
  final bool readOnly;
  const NoteEditor({
    super.key,
    required this.content,
    required this.onChanged,
    this.readOnly = false,
  });
  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
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
  Widget build(BuildContext context) => SizedBox(
    height: 440,
    child: QuillEditor.basic(
      controller: controller,
      config: const QuillEditorConfig(
        padding: EdgeInsets.symmetric(vertical: 12),
        placeholder: 'Write something…',
        embedBuilders: [HtmlEmbedBuilder()],
      ),
    ),
  );
}
