// Checks email verification through the real routed mobile account gate.
// Owns slide transitions, authoritative confirmation, retries and pending actions.
// Does not open email apps or send live verification links.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'email_verification_test_app.dart';

void main() {
  late VerificationApi api;
  late VerificationUser user;
  setUp(() {
    user = VerificationUser();
    api = VerificationApi(user);
  });
  tearDown(() => api.dispose());

  testWidgets(
    'unverified overview shows the banner above independent setup and keeps other routes gated',
    (tester) async {
      await tester.pumpWidget(
        VerificationTestApp(api: api, location: '/vault'),
      );
      await tester.pumpAndSettle();
      expect(find.text('Your Cipherwill Status'), findsOneWidget);
      expect(find.text('Verify your email'), findsOneWidget);
      expect(find.text('Continue Cipherwill Setup'), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('Email verification needed')).dy,
        lessThan(tester.getTopLeft(find.text('Continue Cipherwill Setup')).dy),
      );
      expect(find.text('Private vault'), findsNothing);
      expect(
        api.calls.where((call) => call.$1 == 'GUIDANCE_BOOTSTRAP'),
        isNotEmpty,
      );
    },
  );

  testWidgets('Continue Setup opens objectives without verifying email', (
    tester,
  ) async {
    await tester.pumpWidget(VerificationTestApp(api: api));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue Cipherwill Setup'));
    await tester.pumpAndSettle();
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Send verification email'), findsNothing);
    expect(api.verified, isFalse);
    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    expect(find.text('Let’s start with you.'), findsOneWidget);
    expect(
      api.calls.where((call) => call.$1 == 'SEND_EMAIL_VERIFICATION'),
      isEmpty,
    );
  });

  testWidgets(
    'send then check stays unverified until the backend confirms and returns to overview',
    (tester) async {
      await tester.pumpWidget(VerificationTestApp(api: api));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Verify your email'));
      await tester.pumpAndSettle();
      expect(find.text('Step 1 of 2'), findsOneWidget);
      await tester.tap(find.text('Send verification email'));
      await tester.pumpAndSettle();
      expect(find.text('Check your inbox'), findsOneWidget);
      expect(find.text('Step 2 of 2'), findsOneWidget);
      user.events.clear();
      await tester.tap(find.text("I've verified it"));
      await tester.pumpAndSettle();
      expect(user.events, ['reload', 'fresh-token', 'account']);
      expect(find.textContaining("isn't verified yet"), findsOneWidget);
      expect(find.text('Continue Cipherwill Setup'), findsNothing);
      api.verified = true;
      await tester.tap(find.text("I've verified it"));
      await tester.pumpAndSettle();
      expect(find.text('Your Cipherwill Status'), findsOneWidget);
      expect(find.text('Continue Cipherwill Setup'), findsOneWidget);
      expect(find.text('Email verification needed'), findsNothing);
      expect(find.text("I've verified it"), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('failed delivery remains on slide one and can be retried', (
    tester,
  ) async {
    api.accepted = false;
    await tester.pumpWidget(VerificationTestApp(api: api));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify your email'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send verification email'));
    await tester.pumpAndSettle();
    expect(find.text('Step 1 of 2'), findsOneWidget);
    expect(
      find.textContaining('Unable to send verification email'),
      findsOneWidget,
    );
    api.accepted = true;
    await tester.tap(find.text('Send verification email'));
    await tester.pumpAndSettle();
    expect(find.text('Step 2 of 2'), findsOneWidget);
  });

  testWidgets('pending delivery disables sending and leaving the slide', (
    tester,
  ) async {
    api.delivery = Completer<void>();
    await tester.pumpWidget(VerificationTestApp(api: api));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify your email'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send verification email'));
    await tester.pump();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(
      tester
          .widget<TextButton>(
            find.widgetWithText(TextButton, 'Back to overview'),
          )
          .onPressed,
      isNull,
    );
    expect(
      api.calls.where((call) => call.$1 == 'SEND_EMAIL_VERIFICATION').length,
      1,
    );
    api.delivery!.complete();
    await tester.pumpAndSettle();
    expect(find.text('Step 2 of 2'), findsOneWidget);
    await tester.tap(find.text('Back to overview'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify your email'));
    await tester.pumpAndSettle();
    expect(find.text('Step 2 of 2'), findsOneWidget);
  });

  testWidgets('failed Firebase refresh keeps confirmation retryable', (
    tester,
  ) async {
    await tester.pumpWidget(VerificationTestApp(api: api));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Verify your email'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Send verification email'));
    await tester.pumpAndSettle();
    user.failure = StateError('Offline');
    await tester.tap(find.text("I've verified it"));
    await tester.pumpAndSettle();
    expect(find.textContaining('Offline'), findsOneWidget);
    expect(find.text("I've verified it"), findsOneWidget);
    expect(find.text('Continue Cipherwill Setup'), findsNothing);
  });

  testWidgets(
    'verification slides fit narrow screens with large text and reduced motion',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(320, 640));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      tester.platformDispatcher.textScaleFactorTestValue = 2;
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(
        VerificationTestApp(api: api, reducedMotion: true),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Verify your email'));
      await tester.tap(find.text('Verify your email'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Send verification email'));
      await tester.tap(find.text('Send verification email'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text("I've verified it"));
      expect(find.text('Step 2 of 2'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
