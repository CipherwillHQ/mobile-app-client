// Presents native confirmations and file actions requested by the web client.
// Owns user choices before navigation or exporting a decrypted file.
// Does not save files or inspect their contents.
import 'package:flutter/material.dart';

Future<bool> confirmWebViewNavigation(
  BuildContext context,
  String message,
) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Leave this page?'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Leave'),
          ),
        ],
      ),
    ) ??
    false;

Future<String?> chooseFileAction(BuildContext context, String filename) =>
    showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(filename, maxLines: 2),
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Save file'),
              onTap: () => Navigator.pop(context, 'save'),
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share file'),
              onTap: () => Navigator.pop(context, 'share'),
            ),
          ],
        ),
      ),
    );
