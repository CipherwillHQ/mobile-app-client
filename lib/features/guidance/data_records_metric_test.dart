// Verifies the data menu against routed widgets and the actual Guide overview.
// Owns count, dismissal, navigation, narrow-layout and large-text coverage.
// Does not open a browser, contact accounts or send verification emails.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_harness.dart';
import '../../shared/ui/animated_wrap.dart';
import 'data_records_breakdown.dart';
import 'data_records_count_row.dart';
import 'data_records_metric.dart';
import 'data_records_pill_menu.dart';
import 'data_records_test_app.dart';
import 'guidance_screen.dart';

void main() {
  setUpAll(loadDesignFonts);
  testWidgets(
    'opens above the chip with accurate nonzero counts and dismisses',
    (tester) async {
      await tester.pumpWidget(const DataRecordsTestApp());
      final trigger = find.byType(DataRecordsMetric);
      final anchor = tester.getRect(trigger);
      expect(find.byType(DataRecordsBreakdown), findsNothing);
      await tester.tap(trigger);
      await tester.pump();
      expect(tester.getSize(trigger).height, closeTo(anchor.height, 1));
      await tester.pump(const Duration(milliseconds: 80));
      expect(tester.getSize(trigger).height, greaterThan(anchor.height));
      await tester.pumpAndSettle();
      expect(find.text('5 Data records'), findsOneWidget);
      final rows = tester
          .widgetList<DataRecordsCountRow>(find.byType(DataRecordsCountRow))
          .toList();
      expect(rows.map((row) => (row.label, row.count)), [
        ('Notes', 2),
        ('Passwords', 3),
      ]);
      expect(tester.getSize(trigger).height, greaterThan(anchor.height));
      final surface =
          tester
                  .widget<Container>(
                    find
                        .descendant(
                          of: find.byType(DataRecordsPillMenu),
                          matching: find.byType(Container),
                        )
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      expect(surface.boxShadow!.single.color.a, greaterThan(0));
      expect(find.text('All segments'), findsNothing);
      await tester.tap(find.byTooltip('Close data breakdown'));
      await tester.pumpAndSettle();
      expect(find.byType(DataRecordsBreakdown), findsNothing);
      expect(find.byType(DataRecordsMetric), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('segments action navigates only after selecting the link', (
    tester,
  ) async {
    await tester.pumpWidget(const DataRecordsTestApp());
    await tester.tap(find.byType(DataRecordsMetric));
    await tester.pumpAndSettle();
    expect(find.text('All segments'), findsNothing);
    await tester.tap(find.text('See all segments'));
    await tester.pumpAndSettle();
    expect(find.text('All segments'), findsOneWidget);
    expect(find.byType(DataRecordsBreakdown), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('empty accounts retain the segments link and dismiss outside', (
    tester,
  ) async {
    await tester.pumpWidget(
      const DataRecordsTestApp(count: 0, typeCounts: [], reducedMotion: true),
    );
    await tester.tap(find.byType(DataRecordsMetric));
    await tester.pumpAndSettle();
    expect(find.text('No data records yet.'), findsOneWidget);
    expect(find.text('See all segments'), findsOneWidget);
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    expect(find.byType(DataRecordsBreakdown), findsNothing);
    await tester.tap(find.byType(DataRecordsMetric));
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();
    expect(find.byType(DataRecordsBreakdown), findsNothing);
    expect(tester.takeException(), isNull);
  });

  for (final brightness in Brightness.values) {
    for (final width in [320.0, 393.0, 768.0]) {
      testWidgets('actual overview menu fits $width in ${brightness.name}', (
        tester,
      ) async {
        await tester.binding.setSurfaceSize(Size(width, 852));
        addTearDown(() => tester.binding.setSurfaceSize(null));
        debugDisableShadows = false;
        await tester.pumpWidget(
          DesignHarness(
            location: '/guide',
            screen: const GuidanceScreen(),
            brightness: brightness,
          ),
        );
        await tester.pumpAndSettle();
        final trigger = find.byType(DataRecordsMetric);
        await tester.ensureVisible(trigger);
        await tester.pumpAndSettle();
        final group = find.byType(AnimatedWrap);
        final initialHeight = tester.getSize(group).height;
        final setup = find.widgetWithText(
          FilledButton,
          'Continue Cipherwill Setup',
        );
        final initialSetup = tester.getCenter(setup);
        await tester.tap(trigger);
        await tester.pump();
        for (var frame = 0; frame < 4; frame++) {
          await tester.pump(const Duration(milliseconds: 24));
        }
        expect(tester.getSize(group).height, greaterThan(initialHeight));
        await tester.pumpAndSettle();
        expect(find.text('27 Data records'), findsOneWidget);
        expect(find.byType(DataRecordsCountRow), findsNWidgets(9));
        final panel = tester.getRect(find.byType(DataRecordsPillMenu));
        expect(panel.left, greaterThanOrEqualTo(24));
        expect(panel.right, lessThanOrEqualTo(width - 24));
        expect(
          tester.getRect(find.text('Your Cipherwill Status')).bottom,
          lessThan(panel.top),
        );
        expect(
          tester.getRect(group).bottom,
          lessThan(tester.getRect(setup).top),
        );
        expect(tester.getCenter(setup), isNot(initialSetup));
        await captureDesign(
          tester,
          'data-breakdown-${width.toInt()}-${brightness.name}',
        );
        await tester.ensureVisible(find.text('See all segments'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.ensureVisible(find.byTooltip('Close data breakdown'));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('Close data breakdown'));
        await tester.pumpAndSettle();
        expect(find.byType(DataRecordsBreakdown), findsNothing);
        expect(find.text('Continue Cipherwill Setup'), findsOneWidget);
        expect(tester.getSize(group).height, closeTo(initialHeight, 1));
        debugDisableShadows = true;
      });
    }
  }

  for (final scale in [2.0, 3.0]) {
    testWidgets('320px menu remains scrollable at ${scale}x text', (
      tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(320, 740));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      await tester.pumpWidget(
        DataRecordsTestApp(textScale: scale, reducedMotion: true),
      );
      await tester.tap(find.byType(DataRecordsMetric));
      await tester.pumpAndSettle();
      expect(find.byType(DataRecordsBreakdown), findsOneWidget);
      await tester.ensureVisible(find.text('See all segments'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('See all segments'));
      await tester.pumpAndSettle();
      expect(find.text('All segments'), findsOneWidget);
    });
  }
}
