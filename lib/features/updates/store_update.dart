// Describes a published store update and its explicit user action.
// Owns the common contract for Android, iOS and unsupported platforms.
// Does not install packages, hold account data or dismiss update notices.

class StoreUpdate {
  final Uri url;
  const StoreUpdate(this.url);
}

enum UpdateAction { opened, cancelled, unavailable }

abstract interface class AppUpdateService {
  Future<StoreUpdate?> check();
  Future<UpdateAction> start(StoreUpdate update);
}

class NoStoreUpdates implements AppUpdateService {
  const NoStoreUpdates();
  @override
  Future<StoreUpdate?> check() async => null;
  @override
  Future<UpdateAction> start(StoreUpdate update) async =>
      UpdateAction.unavailable;
}
