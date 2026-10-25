// Supplies native Firebase sessions to the trusted WebView and handles logout.
// Owns account-bound request validation and origin-checked JS responses.
// Does not deliver credentials to external pages or persist web sessions.
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'firebase_session.dart';
import 'webview_links.dart';

class MobileAuthBridge {
  final WebViewController controller;
  final FirebaseAuth auth;
  final User user;
  const MobileAuthBridge(this.controller, this.auth, this.user);

  Future<void> receive(String message) async {
    dynamic request;
    try {
      request = jsonDecode(message);
    } on FormatException {
      return;
    }
    if (request is! Map ||
        request['id'] is! int ||
        !{'session', 'logout', 'error'}.contains(request['type'])) {
      return;
    }
    final url = await controller.currentUrl();
    if (url == null ||
        !isCipherwillPage(Uri.parse(url)) ||
        auth.currentUser?.uid != user.uid) {
      return;
    }
    if (request['type'] == 'logout') {
      await reply(request['id'] as int, null);
      if (auth.currentUser?.uid == user.uid) {
        await auth.signOut();
      }
      return;
    }
    if (request['type'] == 'error') {
      throw StateError('Unable to authenticate the web session.');
    }
    final session = await firebaseSession(user);
    if (auth.currentUser?.uid == user.uid) {
      await reply(request['id'] as int, session);
    }
  }

  Future<void> reply(int id, Map<String, dynamic>? session) =>
      controller.runJavaScript(
        'if (window.location.origin === "https://cipherwill.com") {'
        'window.CipherwillAuthResponse?.($id, ${jsonEncode(session)});}',
      );
}
