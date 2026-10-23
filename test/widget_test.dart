// Verifies the web mobile section bar at accessible text sizes.
// Owns a lightweight shell layout check in light and dark themes.
// Does not require Firebase or native authentication plugins.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cipherwill/testing/design_harness.dart';

void main() {
  testWidgets('four web section labels render with large text in both themes', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final brightness in Brightness.values) {
      await tester.pumpWidget(
        DesignHarness(
          key: ValueKey(brightness),
          location: '/platform',
          brightness: brightness,
          textScale: 2,
        ),
      );
      await tester.pumpAndSettle();
      for (final label in ['Home', 'Data', 'Network', 'Platform']) {
        expect(find.text(label), findsWidgets);
      }
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    }
  });
}
