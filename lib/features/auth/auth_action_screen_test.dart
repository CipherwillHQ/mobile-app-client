// Checks email-link feedback reflects completion, failure and cancellation.
// Owns account-action UI tests with a controlled Firebase substitute.
// Does not call native storage or validate live Firebase registrations.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../testing/fake_auth.dart';
import 'auth_action_screen.dart';

class LinkAuth extends FakeAuth {
  int applied = 0;
  int confirmed = 0;
  Object? failure;
  LinkAuth() {
    user = null;
  }

  @override
  Future<void> applyActionCode(String code) async {
    applied++;
    if (failure != null) throw failure!;
  }

  @override
  Future<String> verifyPasswordResetCode(String code) async =>
      'owner@example.test';

  @override
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    confirmed++;
  }
}

Future<void> showAction(
  WidgetTester tester,
  LinkAuth auth, {
  String mode = 'verifyEmail',
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [firebaseProvider.overrideWithValue(auth)],
      child: MaterialApp(
        home: AuthActionScreen(
          parameters: {'mode': mode, 'oobCode': 'test-code'},
        ),
      ),
    ),
  );
  await tester.tap(find.text('Complete account action'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('successful verification displays completion and return action', (
    tester,
  ) async {
    final auth = LinkAuth();
    await showAction(tester, auth);
    expect(auth.applied, 1);
    expect(find.text('Your account action is complete.'), findsOneWidget);
    expect(find.text('Complete account action'), findsNothing);
    expect(find.text('Continue to Cipherwill'), findsOneWidget);
  });
  testWidgets('expired action keeps a retry and never reports completion', (
    tester,
  ) async {
    final auth = LinkAuth()
      ..failure = FirebaseAuthException(code: 'expired-action-code');
    await showAction(tester, auth);
    expect(find.text('Complete account action'), findsOneWidget);
    expect(find.text('Your account action is complete.'), findsNothing);
    expect(find.text('Account action completed.'), findsNothing);
    auth.failure = null;
    await tester.tap(find.text('Complete account action'));
    await tester.pumpAndSettle();
    expect(auth.applied, 2);
    expect(find.text('Your account action is complete.'), findsOneWidget);
  });
  testWidgets('unsupported mode does not apply a code', (tester) async {
    final auth = LinkAuth();
    await showAction(tester, auth, mode: 'unknown');
    expect(auth.applied, 0);
    expect(find.textContaining('unsupported'), findsOneWidget);
    expect(find.text('Your account action is complete.'), findsNothing);
  });
  testWidgets('cancelled password reset keeps the action retryable', (
    tester,
  ) async {
    final auth = LinkAuth();
    await showAction(tester, auth, mode: 'resetPassword');
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(auth.confirmed, 0);
    expect(find.text('Complete account action'), findsOneWidget);
    expect(find.text('Account action completed.'), findsNothing);
  });
}
