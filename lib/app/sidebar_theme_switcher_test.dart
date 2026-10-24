// Exercises sidebar theme selection at accessible phone sizes.
// Owns tap targets, named/selected semantics and opt-in visual evidence.
// Does not use real account data or change production theme defaults.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/settings/appearance_options.dart';
import '../testing/design_harness.dart';
import '../testing/design_capture.dart';

void main() {
  setUpAll(loadDesignFonts);
  setUp(() {
    // Co-located test: this API is explicitly intended for test setup.
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  });
  for (final brightness in Brightness.values) {
    testWidgets('sidebar theme modes fit phones in ${brightness.name}', (
      tester,
    ) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final semantics = tester.ensureSemantics();
      try {
        for (final width in [320.0, 360.0, 393.0, 430.0]) {
          for (final scale in [1.0, 2.0, 3.0]) {
            tester.view.physicalSize = Size(width, 852);
            await tester.pumpWidget(
              DesignHarness(
                key: UniqueKey(),
                brightness: brightness,
                textScale: scale,
                reducedMotion: scale > 1,
              ),
            );
            await tester.pumpAndSettle();
            await tester.tap(find.byTooltip('Open menu'));
            await tester.pumpAndSettle();
            for (final entry in appearanceOptions) {
              final button = find.byTooltip(entry.label);
              expect(button.hitTestable(), findsOneWidget);
              final rect = tester.getRect(button);
              expect(rect.width, greaterThanOrEqualTo(48));
              expect(rect.height, greaterThanOrEqualTo(48));
              expect(
                tester.getSemantics(
                  find.byKey(ValueKey('sidebar-theme-${entry.mode.name}')),
                ),
                isSemantics(
                  tooltip: entry.label,
                  isButton: true,
                  isSelected: entry.mode == ThemeMode.system,
                  hasTapAction: true,
                ),
              );
            }
            expect(tester.takeException(), isNull);
            if (width == 393 && scale == 1) {
              await expectLater(
                tester,
                meetsGuideline(labeledTapTargetGuideline),
              );
              await prepareDesignImages(tester);
              for (final selected in appearanceOptions) {
                await tester.tap(find.byTooltip(selected.label));
                await tester.pumpAndSettle();
                for (final entry in appearanceOptions) {
                  expect(
                    tester.getSemantics(
                      find.byKey(ValueKey('sidebar-theme-${entry.mode.name}')),
                    ),
                    isSemantics(isSelected: entry.mode == selected.mode),
                  );
                }
                await captureDesign(
                  tester,
                  'sidebar-theme-${selected.mode.name}-${brightness.name}',
                );
              }
            }
            await tester.pumpWidget(const SizedBox());
          }
        }
      } finally {
        semantics.dispose();
      }
    });
  }
}
