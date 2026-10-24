// Exercises native Back through production routes and unsaved text editors.
// Owns direct-entry fallback, pushed history and draft cancellation regressions.
// Does not save synthetic content or access a real account.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../testing/navigation_harness.dart';
import '../features/vault/asset_edit_screen.dart';
import 'navigation_shell.dart';

void main() {
  late NavigationHarness harness;
  setUp(() => harness = NavigationHarness());
  tearDown(() => harness.dispose());
  for (final systemBack in [false, true]) {
    testWidgets(
      '${systemBack ? 'system' : 'header'} Back returns direct category to its hub',
      (tester) async {
        await harness.mount(tester);
        harness.router.go('/vault/NOTE');
        await tester.pumpAndSettle();
        if (systemBack) {
          // Co-located tests intentionally exercise Flutter's system Back hook.
          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
          await tester.binding.handlePopRoute();
        } else {
          await tester.tap(find.byTooltip('Back'));
        }
        await tester.pumpAndSettle();
        expect(harness.router.state.uri.path, '/vault');
        expect(find.text('Manage Data'), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
  for (final pushed in [false, true]) {
    testWidgets(
      '${pushed ? 'pushed' : 'direct'} editor respects cancellation and confirmed Back',
      (tester) async {
        await harness.mount(tester);
        harness.router.go('/vault/PASSWORD');
        await tester.pumpAndSettle();
        const editor = '/item/draft?type=PASSWORD&new=true';
        if (pushed) {
          harness.router.push(editor);
        } else {
          harness.router.go(editor);
        }
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Username'),
          'sam',
        );
        FocusManager.instance.primaryFocus?.unfocus();
        await tester.pumpAndSettle();
        expect(find.byTooltip('Open menu'), findsNothing);
        expect(
          tester
              .widget<Scaffold>(
                find
                    .descendant(
                      of: find.byType(NavigationShell),
                      matching: find.byType(Scaffold),
                    )
                    .first,
              )
              .drawerEnableOpenDragGesture,
          isFalse,
        );
        await tester.tap(find.byTooltip('Back'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(find.byType(AssetEditScreen), findsOneWidget);
        expect(
          tester
              .widget<EditableText>(
                find.descendant(
                  of: find.widgetWithText(TextFormField, 'Username'),
                  matching: find.byType(EditableText),
                ),
              )
              .controller
              .text,
          'sam',
        );
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        await tester.binding.handlePopRoute();
        await tester.pumpAndSettle();
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();
        expect(harness.router.state.uri.path, '/vault/PASSWORD');
        expect(find.byType(AssetEditScreen), findsNothing);
        expect(find.byTooltip('Open menu'), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
