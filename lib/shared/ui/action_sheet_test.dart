// Checks native secondary actions with large text and a visible keyboard.
// Owns reachable choices, cancellation and accessible tap targets.
// Does not execute destructive actions or call feature services.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/app_icons.dart';
import '../../testing/design_harness.dart';
import 'action_sheet.dart';
import 'page_frame.dart';

void main() {
  testWidgets('sheet choices and Cancel remain reachable at 2× text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final semantics = tester.ensureSemantics();
    String? result = 'pending';
    await tester.pumpWidget(
      DesignHarness(
        location: '/form',
        keyboard: 240,
        textScale: 2,
        reducedMotion: true,
        screen: Builder(
          builder: (context) => PageFrame(
            title: 'Item',
            focused: true,
            children: [
              FilledButton(
                onPressed: () async {
                  result = await chooseAction<String>(
                    context,
                    title: 'Item options',
                    actions: const [
                      SheetAction('sharing', 'Manage sharing', AppIcons.people),
                      SheetAction(
                        'delete',
                        'Delete this item permanently',
                        AppIcons.delete,
                        destructive: true,
                      ),
                    ],
                  );
                },
                child: const Text('Open options'),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open options'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await tester.ensureVisible(find.text('Manage sharing'));
    await tester.tap(find.text('Manage sharing'));
    await tester.pumpAndSettle();
    expect(result, 'sharing');
    await tester.tap(find.text('Open options'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Cancel').hitTestable(), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    expect(result, isNull);
    expect(tester.takeException(), isNull);
    semantics.dispose();
  });
}
