// Reviews the native schedule, milestone summary and interval sheets.
// Owns synthetic theme captures, large-text layout and action accessibility.
// Does not claim live device scheduling or store acceptance.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/design_harness.dart';
import 'timeline_screen.dart';

void main() {
  setUpAll(loadDesignFonts);
  for (final brightness in Brightness.values) {
    testWidgets('timeline renders in ${brightness.name}', (tester) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final semantics = tester.ensureSemantics();
      try {
        await tester.pumpWidget(
          DesignHarness(
            location: '/timeline',
            screen: const TimelineScreen(),
            brightness: brightness,
            account: {
              ...previewAccount,
              'birth_date': DateTime(2000, 10, 24).millisecondsSinceEpoch,
            },
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Next check-in'), findsOneWidget);
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        await expectLater(tester, meetsGuideline(textContrastGuideline));
        await captureDesign(tester, 'timeline-schedule-${brightness.name}');
        await tester.tap(find.byTooltip('Edit check-in interval'));
        await tester.pumpAndSettle();
        expect(
          find.text('Start reminders after this much inactivity.'),
          findsOneWidget,
        );
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await captureDesign(tester, 'timeline-interval-${brightness.name}');
        await tester.tap(find.byTooltip('Close selection'));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const ValueKey('first_reminder_after_ms')));
        await tester.pumpAndSettle();
        await captureDesign(tester, 'timeline-reminder-${brightness.name}');
        await tester.tap(find.byTooltip('Close selection'));
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.text('Birthday'));
        await tester.pumpAndSettle();
        await captureDesign(tester, 'timeline-milestone-${brightness.name}');
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      } finally {
        semantics.dispose();
      }
    });
  }
  for (final scale in [1.0, 2.0, 3.0]) {
    testWidgets('timeline fits 320px at ${scale}x text', (tester) async {
      tester.view.physicalSize = const Size(320, 740);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        DesignHarness(
          location: '/timeline',
          screen: const TimelineScreen(),
          textScale: scale,
          reducedMotion: true,
        ),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byTooltip('Edit check-in interval'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Edit check-in interval'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('1 week'),
        150,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
      expect(find.text('1 week').hitTestable(), findsOneWidget);
      await captureDesign(tester, 'timeline-interval-320-${scale}x');
      await tester.tap(find.byTooltip('Close selection'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.byKey(const ValueKey('will_revoke_after_ms')),
        180,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Birthday'));
      await tester.pumpAndSettle();
      expect(find.text('Add your birth date'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await captureDesign(tester, 'timeline-320-${scale}x');
      await tester.pumpWidget(const SizedBox());
    });
  }
}
