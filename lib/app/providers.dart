// Wires explicit application services and account-scoped state
// Owns Riverpod dependency providers.
// Does not initialize native plugins implicitly.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/config/app_config.dart';
import '../core/api/api_client.dart';
import '../core/api/json_values.dart';
import '../core/security/device_security.dart';
import '../features/auth/auth_service.dart';

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
final securityProvider = Provider<DeviceSecurity>(
  (ref) => const DeviceSecurity(),
);
final apiProvider = Provider<ApiClient>((ref) {
  ref.watch(authStateProvider);
  final config = ref.watch(configProvider);
  final api = ApiClient(
    config.apiUrl,
    () =>
        ref.read(firebaseProvider).currentUser?.getIdToken() ??
        Future.value(null),
  );
  ref.onDispose(api.dispose);
  return api;
});
final accountProvider = FutureProvider<Json>(
  (ref) async => (await ref.watch(apiProvider).account()).toJson(),
);
final preferencesProvider = FutureProvider<Json>(
  (ref) async => asJson(
    (await ref.watch(apiProvider).run('GET_PREFERENCES'))['getPreferences'],
  ),
);
final factorsProvider = FutureProvider<List<Json>>((ref) async {
  final api = ref.watch(apiProvider);
  final uid = ref.read(firebaseProvider).currentUser?.uid;
  final factors = jsonList((await api.run('GET_FACTORS'))['getFactors']);
  if (uid != ref.read(firebaseProvider).currentUser?.uid) {
    throw StateError('Account changed.');
  }
  await ref
      .read(securityProvider)
      .prune(
        factors
            .map(
              (f) =>
                  uid! +
                  ':' +
                  f['id'].toString() +
                  ':' +
                  f['publicKey'].toString(),
            )
            .toList(),
      );
  return factors;
});
