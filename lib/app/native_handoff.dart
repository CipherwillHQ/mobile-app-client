// Covers vault contents while native pickers or sharing are active.
// Owns temporary shielding and online account/factor validation.
// Does not retain an unlocked session after a failed validation.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api/json_values.dart';
import '../core/security/foreground.dart';
import '../features/security/session_controller.dart';
import 'privacy_guard.dart';
import 'providers.dart';

Future<T> nativeHandoff<T>(WidgetRef ref, Future<T> Function() action) async {
  final api = ref.read(apiProvider);
  final privacy = ref.read(privacyProvider.notifier);
  final controller = ref.read(sessionProvider.notifier);
  final uid = ref.read(firebaseProvider).currentUser?.uid;
  final lease = controller.lease();
  privacy.set(true);
  try {
    final value = await action();
    await waitForForeground();
    lease.check();
    if (uid != null) {
      await api.account();
      lease.check();
      final factors = jsonList((await api.run('GET_FACTORS'))['getFactors']);
      lease.check();
      if (lease.key == null
          ? factors.isNotEmpty
          : !factors.any(
              (factor) =>
                  factor['id'] == controller.factorId &&
                  factor['publicKey'] == lease.key!.publicKey,
            )) {
        throw StateError('Security factors changed. Unlock again.');
      }
    }
    return value;
  } catch (_) {
    controller.lock();
    rethrow;
  } finally {
    privacy.set(false);
  }
}
