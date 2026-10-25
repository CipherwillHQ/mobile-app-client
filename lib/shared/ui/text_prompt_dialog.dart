// Collects a replacement account password for Firebase reset links.
// Owns the input controller until the dialog is disposed.
// Does not persist passwords or manage application drafts.
import 'package:flutter/material.dart';

class TextPromptDialog extends StatefulWidget {
  final String title;
  final bool secret;
  const TextPromptDialog({
    super.key,
    required this.title,
    required this.secret,
  });
  @override
  State<TextPromptDialog> createState() => _TextPromptDialogState();
}

class _TextPromptDialogState extends State<TextPromptDialog> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.title),
    content: TextField(
      controller: controller,
      obscureText: widget.secret,
      autocorrect: !widget.secret,
      enableSuggestions: !widget.secret,
      autofocus: true,
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context, controller.text),
        child: const Text('Continue'),
      ),
    ],
  );
}
