// Opens MetaMask's SDK connection link in the installed wallet application.
// Owns the narrow launch allowlist and installation failure feedback.
// Does not transport signatures or change the current web page.
import 'package:url_launcher/url_launcher.dart';

Future<void> openMobileWallet(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null ||
      uri.scheme != 'metamask' ||
      uri.host != 'connect' ||
      uri.path.isNotEmpty ||
      uri.userInfo.isNotEmpty ||
      uri.hasPort ||
      uri.hasFragment) {
    throw ArgumentError('Invalid MetaMask connection link.');
  }
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw StateError('Install or update MetaMask, then try again.');
  }
}
