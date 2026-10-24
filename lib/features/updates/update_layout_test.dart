// Verifies update-bar spacing with page footers and mobile keyboards.
// Owns small-phone, light/dark and large-text layout/semantics coverage.
// Does not capture private screens or compare platform-specific pixels.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import '../../testing/fake_app_update.dart';
import 'update_bar.dart';
import 'update_test_app.dart';

void main() {
  setUpAll(loadDesignFonts);
  for (final layout in const [
    (Brightness.light, Size(393, 852), 1.0, 0.0),
    (Brightness.dark, Size(393, 852), 1.0, 280.0),
    (Brightness.light, Size(320, 740), 3.0, 0.0),
    (Brightness.dark, Size(320, 740), 3.0, 280.0),
  ]) {
    testWidgets(
      'update bar fits ${layout.$2.width}px at ${layout.$3}x with ${layout.$4}px keyboard',
      (tester) async {
        tester.view.physicalSize = layout.$2;
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final semantics = tester.ensureSemantics();
        try {
          await tester.pumpWidget(
            UpdateTestApp(
              service: FakeAppUpdates(),
              brightness: layout.$1,
              textScale: layout.$3,
              keyboard: layout.$4,
            ),
          );
          await tester.pumpAndSettle();
          final bar = tester.getRect(find.byType(UpdateBar));
          final save = tester.getRect(find.text('Save'));
          expect(save.bottom, lessThanOrEqualTo(bar.top));
          expect(
            tester.getSize(find.byType(ListView).first).height,
            greaterThanOrEqualTo(48),
          );
          expect(bar.bottom, closeTo(layout.$2.height - layout.$4, .01));
          expect(find.text('Update').hitTestable(), findsOneWidget);
          await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
          await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
          expect(tester.takeException(), isNull);
          await captureDesign(
            tester,
            'update-bar-${layout.$1.name}-${layout.$3}x-keyboard-${layout.$4}',
          );
          await tester.pumpWidget(const SizedBox());
        } finally {
          semantics.dispose();
        }
      },
    );
  }
}
