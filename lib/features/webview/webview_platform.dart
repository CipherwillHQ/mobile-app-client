// Configures native file selection and Android WebAuthn for the web client.
// Owns platform capability setup before the trusted page loads.
// Does not authenticate accounts or implement vault encryption.
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

Future<bool> configureWebViewPlatform(WebViewController controller) async {
  final platform = controller.platform;
  if (platform is AndroidWebViewController) {
    await platform.setOnShowFileSelector(selectWebViewFiles);
    return await const MethodChannel(
          'cipherwill/webview',
        ).invokeMethod<bool>('enablePasskeys', platform.webViewIdentifier) ??
        false;
  }
  return false;
}

Future<List<String>> selectWebViewFiles(FileSelectorParams params) async {
  if (params.mode == FileSelectorMode.openMultiple) {
    final files = await FilePicker.pickFiles();
    return files.map((file) => file.uri.toString()).toList();
  }
  final file = await FilePicker.pickFile();
  return file == null ? [] : [file.uri.toString()];
}
