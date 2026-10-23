// Mounts production navigation with an authenticated synthetic owner.
// Owns deterministic online fixtures and an explicitly unlocked test factor.
// Does not weaken production account gates or invoke real authentication.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import '../app/account_gate.dart';
import '../app/cipherwill_app.dart';
import '../app/providers.dart';
import '../core/crypto/factor_key.dart';
import '../core/api/json_values.dart';
import '../features/security/session_controller.dart';
import '../features/settings/appearance.dart';
import 'design_fixtures.dart';
import 'design_harness.dart';
import 'fake_api.dart';
import 'fake_auth.dart';

class NavigationHarness {
  final bool hasFactors;
  final Future<Json> Function(String, Json) respond;
  NavigationHarness({this.hasFactors = true, this.respond = designResponse});
  late final api = FakeApi(respond);
  final auth = FakeAuth();
  final key = FactorKey.master('test master password', '1234');
  late final factor = {
    'id': 'factor',
    'name': 'My master password',
    'type': 'master-password',
    'nonce': '1234',
    'publicKey': key.publicKey,
  };
  late final container = ProviderContainer(
    overrides: [
      apiProvider.overrideWithValue(api),
      firebaseProvider.overrideWithValue(auth),
      authStateProvider.overrideWith((ref) => Stream.value(auth.currentUser)),
      appearanceProvider.overrideWith(PreviewAppearance.new),
      accountProvider.overrideWith((ref) async => previewAccount),
      onboardingProvider.overrideWith((ref) async => {'is_completed': true}),
      preferencesProvider.overrideWith((ref) async => previewPreferences),
      factorsProvider.overrideWith((ref) async => hasFactors ? [factor] : []),
    ],
  );
  late GoRouter router;
  Future<void> mount(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const CipherwillApp(),
      ),
    );
    await tester.pumpAndSettle();
    if (hasFactors) {
      container.read(sessionProvider.notifier).unlock(factor, key);
    }
    await tester.pumpAndSettle();
    router = GoRouter.of(tester.element(find.byTooltip('Open menu')));
  }

  void dispose() {
    container.dispose();
    api.dispose();
  }
}
