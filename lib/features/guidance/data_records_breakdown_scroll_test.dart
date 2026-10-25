// Verifies the record breakdown shows at most three rows before scrolling.
// Owns exact viewport sizing, scrolling to later types and large-text checks.
// Does not fetch records or navigate to real account pages.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import 'data_records_breakdown.dart';
import 'data_records_count_row.dart';
import 'data_records_metric.dart';
import 'data_records_test_app.dart';

const scrollCounts = [
  {'type': 'NOTE', 'count': 1},
  {'type': 'EMAIL_ACCOUNT', 'count': 1},
  {'type': 'DEVICE_LOCK', 'count': 1},
  {'type': 'PASSWORD', 'count': 1},
  {'type': 'SEED_PHRASE', 'count': 1},
  {'type': 'CUSTOM_LONG_TYPE_NAME_FOR_SCROLLING', 'count': 1},
];

void main() {
  setUpAll(loadDesignFonts);
  for (final scale in [1.0, 3.0]) {
    testWidgets(
      'three-row viewport scrolls to remaining types at ${scale}x text',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(320, 740));
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(
          DataRecordsTestApp(
            count: 6,
            typeCounts: scrollCounts,
            textScale: scale,
            reducedMotion: true,
          ),
        );
        await tester.tap(find.byType(DataRecordsMetric));
        await tester.pumpAndSettle();
        final list = find
            .descendant(
              of: find.byType(DataRecordsBreakdown),
              matching: find.byType(SingleChildScrollView),
            )
            .last;
        final rows = find.byType(DataRecordsCountRow);
        final viewport = tester.getRect(list);
        expect(rows, findsNWidgets(6));
        expect(
          viewport.height,
          closeTo(tester.getSize(rows.at(0)).height * 3, 1),
        );
        expect(tester.getRect(rows.at(2)).bottom, closeTo(viewport.bottom, 1));
        expect(
          tester.getRect(rows.at(3)).top,
          greaterThanOrEqualTo(viewport.bottom - 1),
        );
        await tester.drag(list, Offset(0, -viewport.height - 48));
        await tester.pumpAndSettle();
        final after = tester.getRect(list);
        expect(
          tester.getRect(rows.at(5)).bottom,
          lessThanOrEqualTo(after.bottom + 1),
        );
        expect(tester.getRect(rows.at(5)).top, greaterThanOrEqualTo(after.top));
        expect(tester.getRect(rows.at(0)).bottom, lessThanOrEqualTo(after.top));
        await tester.ensureVisible(find.text('See all segments'));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      },
    );
  }

  testWidgets('two types use only two rows', (tester) async {
    await tester.pumpWidget(const DataRecordsTestApp(reducedMotion: true));
    await tester.tap(find.byType(DataRecordsMetric));
    await tester.pumpAndSettle();
    final list = find
        .descendant(
          of: find.byType(DataRecordsBreakdown),
          matching: find.byType(SingleChildScrollView),
        )
        .last;
    final row = find.byType(DataRecordsCountRow).first;
    expect(
      tester.getSize(list).height,
      closeTo(tester.getSize(row).height * 2, 1),
    );
    expect(tester.takeException(), isNull);
  });
}
