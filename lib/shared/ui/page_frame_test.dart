// Verifies focused task actions remain reachable around keyboards and notices.
// Owns phone-width and enlarged-text footer layout regressions.
// Does not submit account changes or call native keyboard plugins.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import 'page_frame.dart';

void main() {
  for (final width in [320.0, 360.0, 393.0, 430.0]) {
    testWidgets(
      'Save stays above the keyboard at ${width.toInt()}px and 2× text',
      (tester) async {
        tester.view.physicalSize = Size(width, 852);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        var saves = 0;
        await tester.pumpWidget(
          DesignHarness(
            location: '/form',
            keyboard: 300,
            textScale: 2,
            screen: PageFrame(
              title: 'A long title that stays within the focused header',
              focused: true,
              footer: FilledButton(
                onPressed: () => saves++,
                child: const Text('Save changes'),
              ),
              children: const [
                TextField(decoration: InputDecoration(labelText: 'Title')),
              ],
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(
          tester.getBottomRight(find.text('Save changes')).dy,
          lessThan(552),
        );
        expect(find.byTooltip('Open menu'), findsNothing);
        await tester.tap(find.text('Save changes'));
        expect(saves, 1);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
