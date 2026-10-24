// Supplies store update responses without contacting native stores in tests.
// Owns shared package fixtures, failure switches and pending operations.
// Does not change release configuration or install any application.
import 'package:package_info_plus/package_info_plus.dart';
import '../features/updates/store_update.dart';

PackageInfo updatePackage({String version = '1.0.0', String build = '3'}) =>
    PackageInfo(
      appName: 'Cipherwill',
      packageName: 'com.cipherwill.app',
      version: version,
      buildNumber: build,
    );

final testStoreUpdate = StoreUpdate(
  Uri.parse('https://play.google.com/store/apps/details?id=com.cipherwill.app'),
);

class FakeAppUpdates implements AppUpdateService {
  StoreUpdate? offer = testStoreUpdate;
  UpdateAction action = UpdateAction.cancelled;
  int checks = 0;
  int starts = 0;
  bool failCheck = false;
  bool failStart = false;
  Future<void>? pendingCheck;
  Future<void>? pendingStart;
  @override
  Future<StoreUpdate?> check() async {
    checks++;
    await pendingCheck;
    if (failCheck) throw StateError('Store unavailable');
    return offer;
  }

  @override
  Future<UpdateAction> start(StoreUpdate update) async {
    starts++;
    await pendingStart;
    if (failStart) throw StateError('Store launch failed');
    return action;
  }
}
