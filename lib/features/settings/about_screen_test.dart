// Checks About destinations, installed build metadata and mobile layout.
// Owns browser-loop prevention, legacy policy launch behavior and previews.
// Does not open real websites or read production signing details.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../shared/ui/legal_links.dart';
import '../../testing/design_capture.dart';
import '../../testing/design_harness.dart';
import '../../testing/fake_url_launcher.dart';
import 'about_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadDesignFonts);
  setUp(() {
    // Co-located test: the package exposes this API for test setup.
    // ignore: invalid_use_of_visible_for_testing_member
    PackageInfo.setMockInitialValues(
      appName: 'Cipherwill',
      packageName: 'com.example.cipherwill',
      version: '8.7.2',
      buildNumber: '61',
      buildSignature: '',
    );
  });
  testWidgets('About links open web pages and show the installed build', (
    tester,
  ) async {
    final launcher = FakeUrlLauncher(tester.binding.defaultBinaryMessenger);
    addTearDown(launcher.dispose);
    await tester.pumpWidget(
      const DesignHarness(location: '/about', screen: AboutScreen()),
    );
    await tester.pumpAndSettle();
    final router = GoRouter.of(tester.element(find.byType(AboutScreen)));
    for (final link in const [
      ('Website', 'https://cipherwill.com'),
      ('Web app', 'https://cipherwill.com/app'),
      ('Privacy policy', 'https://cipherwill.com/i/privacy-policy'),
      ('Terms of service', 'https://cipherwill.com/i/terms-of-service'),
    ]) {
      expect(find.text(link.$2), findsOneWidget);
      await tester.ensureVisible(find.text(link.$1));
      await tester.pumpAndSettle();
      await tester.tap(find.text(link.$1));
      await tester.pumpAndSettle();
      final call = launcher.calls.last;
      expect(call.method, 'launch');
      expect(call.arguments['url'], link.$2);
      expect(call.arguments['useSafariVC'], true);
      expect(call.arguments['useWebView'], true);
      expect(router.state.uri.path, '/about');
    }
    expect(launcher.calls.length, 4);
    final version = find.text('Version 8.7.2 · Build 61');
    expect(version, findsOneWidget);
    final opacity = find
        .ancestor(of: version, matching: find.byType(Opacity))
        .first;
    expect(tester.widget<Opacity>(opacity).opacity, .5);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('authentication policies retain external browser behavior', (
    tester,
  ) async {
    final launcher = FakeUrlLauncher(tester.binding.defaultBinaryMessenger);
    addTearDown(launcher.dispose);
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: LegalLinks())),
    );
    for (final label in ['Privacy policy', 'Terms of service']) {
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();
      expect(launcher.calls.last.arguments['useSafariVC'], false);
      expect(launcher.calls.last.arguments['useWebView'], false);
    }
    expect(launcher.calls.map((call) => call.arguments['url']), [
      'https://cipherwill.com/i/privacy-policy',
      'https://cipherwill.com/i/terms-of-service',
    ]);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  for (final layout in const [
    (Brightness.light, Size(393, 852), 1.0),
    (Brightness.dark, Size(393, 852), 1.0),
    (Brightness.light, Size(320, 740), 3.0),
  ]) {
    testWidgets(
      'About fits ${layout.$2.width}px at ${layout.$3}x in ${layout.$1.name}',
      (tester) async {
        tester.view.physicalSize = layout.$2;
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final semantics = tester.ensureSemantics();
        try {
          await tester.pumpWidget(
            DesignHarness(
              location: '/about',
              screen: const AboutScreen(),
              brightness: layout.$1,
              textScale: layout.$3,
              reducedMotion: true,
            ),
          );
          await tester.pumpAndSettle();
          expect(find.text('About us').hitTestable(), findsOneWidget);
          await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
          if (layout.$3 == 1) {
            await expectLater(
              tester,
              meetsGuideline(androidTapTargetGuideline),
            );
          }
          await captureDesign(
            tester,
            'settings-about-${layout.$1.name}-${layout.$3}x',
          );
          await tester.scrollUntilVisible(
            find.text('Version 8.7.2 · Build 61'),
            180,
            scrollable: find.byType(Scrollable).first,
          );
          await tester.pumpAndSettle();
          expect(
            find.text('Version 8.7.2 · Build 61').hitTestable(),
            findsOneWidget,
          );
          expect(tester.takeException(), isNull);
          await tester.pumpWidget(const SizedBox());
        } finally {
          semantics.dispose();
        }
      },
    );
  }
}
