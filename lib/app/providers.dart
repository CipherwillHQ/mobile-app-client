// Supplies explicit native authentication dependencies.
// Owns Firebase identity, authentication actions and reset-email requests.
// Does not load application accounts, vaults or security factors.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/config/app_config.dart';
import '../features/auth/auth_service.dart';
import '../features/auth/password_reset.dart';

final configProvider = Provider<AppConfig>(
  (ref) => throw StateError('AppConfig must be supplied'),
);
final firebaseProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final authProvider = Provider<AuthService>(
  (ref) => AuthService(
    ref.watch(firebaseProvider),
    ref.watch(configProvider).googleClientId,
  ),
);
final authStateProvider = StreamProvider<User?>(
  (ref) => ref.watch(firebaseProvider).authStateChanges(),
);
final passwordResetProvider = Provider<PasswordReset>(
  (ref) => PasswordReset(ref.watch(configProvider).apiUrl),
);
