// Checks and opens official Google Play updates for the installed package.
// Owns fresh update eligibility, native cancellation and store fallback.
// Does not download GitHub APKs or bypass Android package signing.
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'store_link.dart';
import 'store_update.dart';

class PlayUpdateService implements AppUpdateService {
  final Future<PackageInfo> package;
  PlayUpdateService(this.package);

  bool available(AppUpdateInfo info, PackageInfo installed) =>
      info.packageName == installed.packageName &&
      (info.updateAvailability == UpdateAvailability.updateAvailable ||
          info.updateAvailability ==
              UpdateAvailability.developerTriggeredUpdateInProgress) &&
      info.availableVersionCode != null &&
      info.availableVersionCode! > (int.tryParse(installed.buildNumber) ?? 0);

  @override
  Future<StoreUpdate?> check() async {
    final installed = await package;
    final info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailability == UpdateAvailability.unknown) {
      throw StateError('Play update availability is unknown.');
    }
    if (!available(info, installed)) return null;
    return StoreUpdate(
      Uri.https('play.google.com', '/store/apps/details', {
        'id': installed.packageName,
      }),
    );
  }

  @override
  Future<UpdateAction> start(StoreUpdate update) async {
    final installed = await package;
    AppUpdateInfo info;
    try {
      // Play update information must be refreshed before each new attempt.
      info = await InAppUpdate.checkForUpdate();
    } catch (_) {
      return openStoreUpdate(update);
    }
    if (info.updateAvailability == UpdateAvailability.updateNotAvailable) {
      return UpdateAction.unavailable;
    }
    if (!available(info, installed) || !info.immediateUpdateAllowed) {
      return openStoreUpdate(update);
    }
    try {
      final result = await InAppUpdate.performImmediateUpdate();
      if (result == AppUpdateResult.userDeniedUpdate) {
        return UpdateAction.cancelled;
      }
      if (result == AppUpdateResult.success) return UpdateAction.opened;
    } catch (_) {
      // Failed native eligibility still leaves the normal store flow available.
    }
    return openStoreUpdate(update);
  }
}
