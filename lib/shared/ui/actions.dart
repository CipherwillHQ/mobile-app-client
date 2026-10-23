// Runs user actions and requests destructive-action confirmation
// Owns feedback and confirmation dialogs.
// Does not send telemetry or hide failures.
import 'package:flutter/material.dart';
import 'text_prompt_dialog.dart';
import 'app_notice.dart';

class ActionCancelled implements Exception {
  const ActionCancelled();
}

Future<void> perform(
  BuildContext context,
  Future<void> Function() action, {
  String? success,
}) async {
  final notice = NoticeScope.maybeOf(context);
  final messenger = ScaffoldMessenger.maybeOf(context);
  try {
    await action();
    if (success != null) {
      if (notice != null) {
        notice.show(success, false);
      } else if (messenger?.mounted == true) {
        messenger!.showSnackBar(SnackBar(content: Text(success)));
      }
    }
  } on ActionCancelled {
    return;
  } catch (error) {
    if (notice != null) {
      notice.show(error.toString(), true);
    } else if (messenger?.mounted == true) {
      messenger!.showSnackBar(SnackBar(content: Text(error.toString())));
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
