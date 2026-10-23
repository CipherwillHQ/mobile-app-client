// Clears device keys and account-scoped state before signing out
// Owns a single logout entry point.
// Does not reset or delete server accounts.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/security/session_controller.dart';
import 'providers.dart';
import '../core/security/temp_cleanup.dart';

Future<void> logout(WidgetRef ref) async {
  ref.read(sessionProvider.notifier).lock();
  await ref.read(securityProvider).clear();
  await ref.read(firebaseProvider).signOut();
  await cleanupTemporaryFiles();
}
