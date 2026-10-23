// Exercises photographic authentication without invoking native providers.
// Owns credential visibility, creation-mode and keyboard layout regressions.
// Does not send test credentials to Firebase.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import '../../testing/design_capture.dart';
import 'auth_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadDesignFonts);
  testWidgets(
    'auth validates empty fields and preserves explicit password input',
    (tester) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        const DesignHarness(location: '/auth', screen: AuthScreen()),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Sign in').last);
      await tester.tap(find.text('Sign in').last);
      await tester.pumpAndSettle();
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.text('Enter your account password'), findsOneWidget);
      await tester.enterText(
        find.byType(TextFormField).first,
        'sam@example.com',
      );
      await tester.enterText(
        find.byType(TextFormField).last,
        ' demo password ',
      );
      expect(
        tester
            .widget<TextFormField>(find.byType(TextFormField).last)
            .controller!
            .text,
        ' demo password ',
      );
      expect(
        tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
        true,
      );
      await tester.ensureVisible(find.byTooltip('Show password'));
      await tester.tap(find.byTooltip('Show password'));
      await tester.pump();
      expect(
        tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
        false,
      );
      await tester.ensureVisible(find.text('Create an account'));
      await tester.tap(find.text('Create an account'));
      await tester.pumpAndSettle();
      expect(find.text('Create your account'), findsOneWidget);
      expect(find.text('Create account'), findsOneWidget);
      expect(
        tester
            .widget<TextFormField>(find.byType(TextFormField).last)
            .controller!
            .text,
        ' demo password ',
      );
      expect(tester.takeException(), isNull);
    },
  );
  testWidgets('auth password remains reachable with the keyboard open', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(393, 852);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const DesignHarness(
        location: '/auth',
        keyboard: 320,
        screen: AuthScreen(),
      ),
    );
    await tester.pumpAndSettle();
    final password = find.byType(TextFormField).last;
    await tester.ensureVisible(password);
    await tester.tap(password);
    await tester.enterText(password, 'keyboard test');
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(tester.getRect(password).bottom, lessThanOrEqualTo(852 - 320));
    await captureDesign(tester, 'auth-keyboard');
  });
}
