// Exercises factor prompts through the application's actual routed account gate.
// Owns locked-route, password-entry and account-link regression coverage.
// Does not call Firebase, native factor adapters or a live backend.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import '../core/config/app_config.dart';
import '../core/crypto/factor_key.dart';
import '../features/security/lock_screen.dart';
import '../features/security/session_controller.dart';
import '../features/settings/appearance.dart';
import '../testing/fake_api.dart';
import '../testing/fake_auth.dart';
import 'account_gate.dart';
import 'cipherwill_app.dart';
import 'providers.dart';

class TestAppearance extends AppearanceController {
  @override
  ThemeMode build() => ThemeMode.light;
}

void main() {
  final key = FactorKey.master('test master password', '1234');
  final factor = {
    'id': 'factor1',
    'name': 'My master password',
    'type': 'master-password',
    'nonce': '1234',
    'publicKey': key.publicKey,
  };
  late FakeApi api;
  late Widget app;
  setUp(() {
    final auth = FakeAuth();
    api = FakeApi(
      (name, args) async => {
        'getFactors': [factor],
      },
    );
    app = ProviderScope(
      overrides: [
        appearanceProvider.overrideWith(TestAppearance.new),
        configProvider.overrideWithValue(
          const AppConfig(
            environment: 'development',
            apiUrl: 'https://api.invalid',
            reownProjectId: '',
            sentryDsn: '',
            googleClientId: '',
            firebase: FirebaseOptions(
              apiKey: 'test',
              appId: 'test',
              messagingSenderId: 'test',
              projectId: 'test',
            ),
          ),
        ),
        firebaseProvider.overrideWithValue(auth),
        authStateProvider.overrideWith((ref) => Stream.value(auth.currentUser)),
        apiProvider.overrideWithValue(api),
        accountProvider.overrideWith((ref) async => {'email_verified': true}),
        onboardingProvider.overrideWith((ref) async => {'is_completed': true}),
        factorsProvider.overrideWith((ref) async => [factor]),
      ],
      child: const CipherwillApp(),
    );
  });
  tearDown(() => api.dispose());

  testWidgets(
    'locked master factor opens a private input and rejects a mismatch',
    (tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      final container = ProviderScope.containerOf(
        tester.element(find.byType(LockScreen)),
      );
      await tester.tap(find.text('My master password'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(find.byType(TextField), findsOneWidget);
      final input = tester.widget<TextField>(find.byType(TextField));
      expect(input.obscureText, isTrue);
      expect(input.autocorrect, isFalse);
      expect(input.enableSuggestions, isFalse);
      expect(input.autofocus, isTrue);
      await tester.enterText(find.byType(TextField), 'incorrect test password');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(
        find.textContaining('This security factor does not match.'),
        findsOneWidget,
      );
      expect(container.read(sessionProvider), isNull);
      expect(find.byType(LockScreen), findsOneWidget);
      await tester.tap(find.text('My master password'));
      await tester.pumpAndSettle();
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty,
      );
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.byType(TextField), findsNothing);
      expect(container.read(sessionProvider), isNull);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'tab and detail routes retain the lock and its dialog navigator',
    (tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      final router = GoRouter.of(tester.element(find.byType(LockScreen)));
      for (final path in [
        '/vault',
        '/item/record?type=NOTE',
        '/executor/grant',
      ]) {
        router.go(path);
        await tester.pumpAndSettle();
        expect(find.byType(LockScreen), findsOneWidget);
        await tester.tap(find.text('My master password'));
        await tester.pumpAndSettle();
        expect(find.byType(TextField), findsOneWidget);
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
      expect(api.calls, isEmpty);
    },
  );

  testWidgets(
    'email account actions remain accessible outside the vault gate',
    (tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      final router = GoRouter.of(tester.element(find.byType(LockScreen)));
      router.go('/auth-action?mode=verifyEmail&oobCode=test-code');
      await tester.pumpAndSettle();
      expect(find.text('Complete account action'), findsOneWidget);
      expect(find.byType(LockScreen), findsNothing);
      await tester.tap(find.text('Continue to Cipherwill'));
      await tester.pumpAndSettle();
      expect(find.byType(LockScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
