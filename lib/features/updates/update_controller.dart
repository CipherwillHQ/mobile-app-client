// Keeps a published update visible until the installed app is current.
// Owns throttled checks, serialized update actions and quiet check failures.
// Does not dismiss offers on cancellation or expose native exception details.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'store_update.dart';
import 'update_providers.dart';

class UpdateState {
  final StoreUpdate? available;
  final bool busy;
  const UpdateState({this.available, this.busy = false});
}

class UpdateController extends Notifier<UpdateState> {
  static const checkInterval = Duration(minutes: 30);
  DateTime? checkedAt;
  Future<void>? pendingCheck;

  @override
  UpdateState build() => const UpdateState();

  Future<void> check({bool force = false}) {
    if (!ref.mounted || state.busy) return Future.value();
    if (pendingCheck != null) return pendingCheck!;
    final now = DateTime.now();
    if (!force &&
        checkedAt != null &&
        now.difference(checkedAt!) < checkInterval) {
      return Future.value();
    }
    checkedAt = now;
    pendingCheck = checkStore().whenComplete(() => pendingCheck = null);
    return pendingCheck!;
  }

  Future<void> checkStore() async {
    try {
      final update = await ref.read(appUpdateServiceProvider).check();
      if (ref.mounted) {
        state = UpdateState(available: update, busy: state.busy);
      }
    } catch (_) {
      // An unavailable store must not block startup or hide a known update.
    }
  }

  Future<bool> update() async {
    if (!ref.mounted || state.busy || state.available == null) return true;
    state = UpdateState(available: state.available, busy: true);
    UpdateAction? action;
    try {
      await pendingCheck;
      if (!ref.mounted || state.available == null) return true;
      action = await ref.read(appUpdateServiceProvider).start(state.available!);
      if (ref.mounted && action == UpdateAction.unavailable) {
        state = const UpdateState(busy: true);
      }
    } catch (_) {
      return false;
    } finally {
      if (ref.mounted) {
        state = UpdateState(available: state.available);
        if (action == UpdateAction.opened) await check(force: true);
      }
    }
    return true;
  }
}

final appUpdateProvider = NotifierProvider<UpdateController, UpdateState>(
  UpdateController.new,
  dependencies: [appUpdateServiceProvider],
);
