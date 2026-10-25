// Exposes file export, clipboard and navigation state to the trusted web app.
// Owns origin/account checks and native capability responses.
// Does not authenticate Firebase users or decrypt files.
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'mobile_download.dart';
import 'webview_links.dart';

class MobileDeviceBridge {
  final WebViewController controller;
  final FirebaseAuth auth;
  final String uid;
  final bool passkeys;
  final BuildContext context;
  final void Function(bool) onDirty;
  final download = MobileDownload();
  MobileDeviceBridge(
    this.controller,
    this.auth,
    this.uid,
    this.passkeys,
    this.context,
    this.onDirty,
  );

  Future<void> receive(String message) async {
    final request = jsonDecode(message);
    if (request is! Map || request['id'] is! int) return;
    final url = await controller.currentUrl();
    if (url == null ||
        !isCipherwillPage(Uri.parse(url)) ||
        auth.currentUser?.uid != uid) {
      return;
    }
    Object? value;
    String? error;
    try {
      switch (request['type']) {
        case 'capabilities':
          value = {'passkeys': passkeys};
        case 'dirty':
          onDirty(request['dirty'] == true);
        case 'clipboard':
          await Clipboard.setData(
            ClipboardData(text: request['text'] as String),
          );
        case 'download-start':
          await download.start(
            request['name'] as String,
            request['size'] as int,
            request['mime'] as String,
          );
        case 'download-chunk':
          await download.append(request['data'] as String);
        case 'download-finish':
          try {
            if (!context.mounted) return;
            value = await download.finish(context);
          } finally {
            await download.dispose();
          }
        case 'download-cancel':
          await download.dispose();
        default:
          return;
      }
    } catch (_) {
      error = 'Unable to complete this action. Please try again.';
      if ((request['type'] as String?)?.startsWith('download-') == true) {
        await download.dispose();
      }
    }
    if (auth.currentUser?.uid != uid) return;
    await controller.runJavaScript(
      'if (window.location.origin === "https://cipherwill.com") {'
      'window.CipherwillDeviceResponse?.(${request['id']}, ${jsonEncode({'value': value, 'error': error})});}',
    );
  }
}
