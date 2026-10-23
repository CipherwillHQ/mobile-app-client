// Runs user actions and requests destructive-action confirmation
// Owns feedback and confirmation dialogs.
// Does not send telemetry or hide failures.
import 'package:flutter/material.dart';
import 'text_prompt_dialog.dart';

class ActionCancelled implements Exception {
  const ActionCancelled();
}

Future<void> perform(
  BuildContext context,
  Future<void> Function() action, {
  String? success,
}) async {
  try {
    await action();
    if (context.mounted && success != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(success)));
    }
  } on ActionCancelled {
    return;
  } catch (error) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}

Future<bool> confirm(BuildContext context, String message) => showDialog<bool>(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Confirm action'),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context, true),
        child: const Text('Confirm'),
      ),
    ],
  ),
).then((value) => value ?? false);
Future<String?> prompt(
  BuildContext context,
  String title, {
  String initial = '',
  bool secret = false,
  bool multiline = false,
}) => showDialog<String>(
  context: context,
  builder: (_) => TextPromptDialog(
    title: title,
    initial: initial,
    secret: secret,
    multiline: multiline,
  ),
);
