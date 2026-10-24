// Opens a verified platform store destination at the user's request.
// Owns native store launch failure handling shared by both update adapters.
// Does not open arbitrary backend URLs or start silent installations.
import 'package:url_launcher/url_launcher.dart';
import 'store_update.dart';

Future<UpdateAction> openStoreUpdate(StoreUpdate update) async {
  if (!await launchUrl(update.url, mode: LaunchMode.externalApplication)) {
    throw StateError('Unable to open the app store.');
  }
  return UpdateAction.opened;
}
