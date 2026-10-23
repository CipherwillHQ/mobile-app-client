// Collects a short value through the shared native text prompt.
// Owns controller lifetime through dialog dismissal animations.
// Does not persist input or perform account/vault operations.

import 'package:flutter/material.dart';

class TextPromptDialog extends StatefulWidget {
  final String title;
  final String initial;
  final bool secret;
  const TextPromptDialog({
    super.key,
    required this.title,
    required this.initial,
    required this.secret,
  });

  @override
  State<TextPromptDialog> createState() => _TextPromptDialogState();
}

class _TextPromptDialogState extends State<TextPromptDialog> {
  late final controller = TextEditingController(text: widget.initial);

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
