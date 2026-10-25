// Runs native authentication actions with completion and failure feedback.
// Owns cancellation handling and password prompts.
// Does not implement destructive application actions or send telemetry.
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
  final messenger = ScaffoldMessenger.maybeOf(context);
  try {
    await action();
    if (success != null && messenger?.mounted == true) {
      messenger!.showSnackBar(SnackBar(content: Text(success)));
    }
  } on ActionCancelled {
    return;
  } catch (error) {
    if (messenger?.mounted == true) {
      messenger!.showSnackBar(SnackBar(content: Text(error.toString())));
    }
  }
}

Future<String?> prompt(
  BuildContext context,
  String title, {
  bool secret = false,
}) => showDialog<String>(
  context: context,
  builder: (_) => TextPromptDialog(title: title, secret: secret),
);
