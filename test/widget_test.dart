// Verifies native sidebar navigation at accessible text sizes.
// Owns reachable web groups without permanent footer navigation.
// Does not require Firebase or native authentication plugins.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cipherwill/testing/design_harness.dart';
import 'package:cipherwill/app/app_sidebar.dart';

void main() {
  testWidgets(
    'sidebar groups remain reachable with large text in both themes',
    (tester) async {
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
        expect(
          tester
              .widgetList<Scaffold>(find.byType(Scaffold))
              .every((scaffold) => scaffold.bottomNavigationBar == null),
          isTrue,
        );
        await tester.tap(find.byTooltip('Open menu'));
        await tester.pumpAndSettle();
        for (final label in ['Home', 'Data', 'Network', 'Platform']) {
          final group = find.descendant(
            of: find.byType(AppSidebar),
            matching: find.text(label),
          );
          await tester.scrollUntilVisible(
            group,
            200,
            scrollable: find
                .descendant(
                  of: find.byType(AppSidebar),
                  matching: find.byType(Scrollable),
                )
                .first,
          );
          expect(group.hitTestable(), findsOneWidget);
        }
        await tester.tap(find.byTooltip('Close menu'));
        await tester.pumpAndSettle();
        expect(find.byType(AppSidebar), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      }
    },
  );
}
