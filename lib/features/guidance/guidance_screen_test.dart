// Checks the full-area Guide overview, introductions and pause/resume behavior.
// Owns centered-slide and in-memory answer regression coverage.
// Does not persist real guidance answers or call the live backend.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import 'guidance_screen.dart';

void main() {
  testWidgets(
    'guide starts at status overview and keeps answers through pause',
    (tester) async {
      await tester.pumpWidget(
        const DesignHarness(location: '/guide', screen: GuidanceScreen()),
      );
      await tester.pumpAndSettle();
      expect(find.text('Your Cipherwill Status'), findsOneWidget);
      expect(find.byType(Card), findsNothing);
      await tester.tap(find.text('Continue Cipherwill Setup'));
      await tester.pumpAndSettle();
      expect(find.text('Start'), findsOneWidget);
      await tester.tap(find.text('Start'));
      await tester.pumpAndSettle();
      expect(find.text('Let’s start with you.'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Personal name');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();
      await tester.tap(find.text("Let's do this later"));
      await tester.pumpAndSettle();
      expect(find.text('Your Cipherwill Status'), findsOneWidget);
      await tester.tap(find.text('Continue Cipherwill Setup'));
      await tester.pumpAndSettle();
      expect(
        tester.widget<EditableText>(find.byType(EditableText)).controller.text,
        'Personal name',
      );
      expect(find.byType(Card), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
