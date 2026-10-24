// Exercises web-style drawer navigation on real preview pages.
// Owns category visibility, close navigation and large-text drawer rendering.
// Does not authorize production reads or simulate biometric approval.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import '../testing/design_harness.dart';
import '../testing/design_fixtures.dart';
import '../testing/design_capture.dart';
import '../features/vault/asset_list_screen.dart';
import '../features/vault/categories.dart';
import 'app_sidebar.dart';

void main() {
  setUpAll(loadDesignFonts);
  testWidgets('drawer closes and group links open the familiar data hub', (
    tester,
  ) async {
    await tester.pumpWidget(
      const DesignHarness(
        location: '/vault/NOTE',
        screen: AssetListScreen(type: 'NOTE'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    expect(find.byType(AppSidebar), findsOneWidget);
    await tester.tap(
      find.descendant(of: find.byType(AppSidebar), matching: find.text('Home')),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AppSidebar), findsNothing);
    expect(find.text('Dashboard'), findsOneWidget);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(of: find.byType(AppSidebar), matching: find.text('Data')),
    );
    await tester.pumpAndSettle();
    expect(find.text('Manage Data'), findsOneWidget);
    expect(
      tester
          .widgetList<Scaffold>(find.byType(Scaffold))
          .every((scaffold) => scaffold.bottomNavigationBar == null),
      isTrue,
    );
    await tester.tap(find.text(categoryFor('NOTE').title));
    await tester.pumpAndSettle();
    expect(
      GoRouter.of(tester.element(find.byType(AssetListScreen))).state.uri.path,
      '/vault/NOTE',
    );
    expect(tester.takeException(), isNull);
  });
  testWidgets('disabled categories disappear from hub and drawer', (
    tester,
  ) async {
    final password = categoryFor('PASSWORD');
    await tester.pumpWidget(
      DesignHarness(
        location: '/vault',
        preferences: {...previewPreferences, password.preference!: false},
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text(password.title), findsNothing);
    await tester.tap(find.byTooltip('Open menu'));
    await tester.pumpAndSettle();
    expect(find.text(password.title), findsNothing);
    expect(find.text(categoryFor('NOTE').title), findsWidgets);
    expect(tester.takeException(), isNull);
  });
  for (final brightness in Brightness.values) {
    testWidgets('drawer fits phone and large text in ${brightness.name}', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(DesignHarness(brightness: brightness));
      await tester.pumpAndSettle();
      await prepareDesignImages(tester);
      await tester.tap(find.byTooltip('Open menu'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await captureDesign(tester, 'sidebar-${brightness.name}');
      await tester.pumpWidget(const SizedBox());
      tester.view.physicalSize = const Size(320, 740);
      await tester.pumpWidget(
        DesignHarness(brightness: brightness, textScale: 2),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Open menu'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.scrollUntilVisible(
        find.text('Settings'),
        200,
        scrollable: find
            .descendant(
              of: find.byType(AppSidebar),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      expect(find.text('Settings').hitTestable(), findsOneWidget);
      await tester.tap(find.byTooltip('Close menu'));
      await tester.pumpAndSettle();
      expect(find.byType(AppSidebar), findsNothing);
    });
  }
}
