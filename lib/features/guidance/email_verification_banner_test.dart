// Reviews the real Guide banner at phone and wide sizes in both themes.
// Owns large-text, reachable-action and opt-in rendered design evidence.
// Does not send verification email or control a live device.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/design_harness.dart';
import 'email_verification_banner.dart';
import 'guidance_screen.dart';

void main() {
  setUpAll(loadDesignFonts);
  for (final brightness in Brightness.values) {
    for (final width in [320.0, 393.0, 768.0]) {
      testWidgets('banner fits $width in ${brightness.name}', (tester) async {
        await tester.binding.setSurfaceSize(Size(width, 852));
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(
          DesignHarness(
            location: '/guide',
            screen: const GuidanceScreen(),
            brightness: brightness,
            account: {...previewAccount, 'email_verified': false},
          ),
        );
        await tester.pumpAndSettle();
        final action = find.widgetWithText(OutlinedButton, 'Verify your email');
        await tester.ensureVisible(action);
        await tester.pumpAndSettle();
        expect(tester.getSize(action).height, greaterThanOrEqualTo(48));
        expect(find.byType(EmailVerificationBanner), findsOneWidget);
        expect(tester.takeException(), isNull);
        await captureDesign(
          tester,
          'email-banner-${width.toInt()}-${brightness.name}',
        );
        await tester.tap(action);
        await tester.pumpAndSettle();
        expect(find.text('Send verification email'), findsOneWidget);
      });
    }
  }
  for (final scale in [2.0, 3.0]) {
    testWidgets('banner stays reachable at 320px with ${scale}x text', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(320, 740));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(
        DesignHarness(
          location: '/guide',
          screen: const GuidanceScreen(),
          textScale: scale,
          reducedMotion: true,
          account: {...previewAccount, 'email_verified': false},
        ),
      );
      await tester.pumpAndSettle();
      final action = find.widgetWithText(OutlinedButton, 'Verify your email');
      await tester.ensureVisible(action);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.tap(action);
      await tester.pumpAndSettle();
      expect(find.text('Send verification email'), findsOneWidget);
    });
  }
}
