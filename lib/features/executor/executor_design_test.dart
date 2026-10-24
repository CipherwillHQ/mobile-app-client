// Reviews dashboard access, execution navigation and the revoke sheet.
// Owns synthetic captures, large-text layout and accessible action checks.
// Does not claim live Android or iOS account acceptance.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_harness.dart';
import '../../shared/ui/error_panel.dart';
import 'executor_sidebar.dart';
import 'granted_categories_screen.dart';

void main() {
  setUpAll(loadDesignFonts);
  for (final brightness in Brightness.values) {
    testWidgets('access surfaces render in ${brightness.name}', (tester) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final semantics = tester.ensureSemantics();
      try {
        await tester.pumpWidget(DesignHarness(brightness: brightness));
        await tester.pumpAndSettle();
        await prepareDesignImages(tester);
        await captureDesign(tester, 'access-dashboard-${brightness.name}');
        await tester.tap(find.text('Review access'));
        await tester.pumpAndSettle();
        expect(find.text('Revoke access'), findsOneWidget);
        expect(find.byType(ErrorPanel), findsNothing);
        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        await captureDesign(tester, 'access-review-${brightness.name}');
        await tester.pumpWidget(const SizedBox());
        await tester.pumpWidget(
          DesignHarness(
            location: '/executor/grant',
            screen: const GrantedCategoriesScreen(id: 'grant'),
            brightness: brightness,
          ),
        );
        await tester.pumpAndSettle();
        await prepareDesignImages(tester);
        expect(find.text('Alex Taylor'), findsOneWidget);
        await captureDesign(tester, 'execution-overview-${brightness.name}');
        await tester.tap(find.byTooltip('Open menu'));
        await tester.pumpAndSettle();
        expect(find.byType(ExecutorSidebar), findsOneWidget);
        await captureDesign(tester, 'execution-sidebar-${brightness.name}');
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      } finally {
        semantics.dispose();
      }
    });
  }
  for (final scale in [2.0, 3.0]) {
    testWidgets('access controls fit 320px at ${scale}x text', (tester) async {
      tester.view.physicalSize = const Size(320, 740);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(DesignHarness(textScale: scale));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('Review access'),
        150,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      expect(find.text('Review access').hitTestable(), findsOneWidget);
      await tester.tap(find.text('Review access'));
      await tester.pumpAndSettle();
      expect(find.text('Revoke access'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      await tester.pumpWidget(
        DesignHarness(
          location: '/executor/grant',
          screen: const GrantedCategoriesScreen(id: 'grant'),
          textScale: scale,
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Open menu'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
        find.text('My dashboard'),
        150,
        scrollable: find
            .descendant(
              of: find.byType(ExecutorSidebar),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle();
      expect(find.text('My dashboard').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
