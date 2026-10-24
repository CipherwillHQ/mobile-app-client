// Exercises real screen layouts at phone sizes in both themes.
// Owns overflow, large-text, reduced-motion and opt-in visual evidence.
// Does not authenticate real accounts or claim live-device parity.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_screens.dart';
import 'error_panel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadDesignFonts);
  for (final brightness in Brightness.values) {
    testWidgets('all screens render on a phone in ${brightness.name}', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final entry in designScreens.entries) {
        await tester.pumpWidget(
          DesignHarness(
            key: ValueKey(entry.key),
            location: entry.key,
            screen: entry.value,
            brightness: brightness,
          ),
        );
        await tester.pumpAndSettle();
        await prepareDesignImages(tester);
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: entry.key);
        expect(find.byType(ErrorPanel), findsNothing, reason: entry.key);
        await captureDesign(
          tester,
          entry.key.substring(1).replaceAll('/', '-') + '-' + brightness.name,
        );
        for (final scrollable in find.byType(Scrollable).evaluate().toList()) {
          final state =
              (scrollable as StatefulElement).state as ScrollableState;
          state.position.jumpTo(state.position.maxScrollExtent);
        }
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: entry.key + ' bottom');
        expect(
          find.byType(ErrorPanel),
          findsNothing,
          reason: entry.key + ' bottom',
        );
        await tester.pumpWidget(const SizedBox());
      }
    });
  }
  for (final size in [
    const Size(320, 740),
    const Size(360, 800),
    const Size(430, 932),
    const Size(852, 393),
  ]) {
    testWidgets('all screens fit $size with 2× text and reduced motion', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final entry in designScreens.entries) {
        await tester.pumpWidget(
          DesignHarness(
            key: ValueKey(entry.key),
            location: entry.key,
            screen: entry.value,
            textScale: 2,
            reducedMotion: true,
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull, reason: entry.key);
        expect(find.byType(ErrorPanel), findsNothing, reason: entry.key);
        await tester.pumpWidget(const SizedBox());
      }
    });
  }
  testWidgets('factorless dashboard does not claim a factor was unlocked', (
    tester,
  ) async {
    await tester.pumpWidget(const DesignHarness(factors: []));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('No security factors'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('No security factors'), findsOneWidget);
    expect(find.text('Vault unlocked'), findsNothing);
    expect(find.text('Vault locked'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
