// Checks the simple note surface preserves web HTML without formatting controls.
// Owns toolbar-free editing and content-change regression coverage.
// Does not save note contents or change encryption versions.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../../testing/design_harness.dart';
import '../../shared/ui/page_frame.dart';
import 'note_editor.dart';

void main() {
  testWidgets(
    'note editor has no toolbar or box and preserves imported formatting',
    (tester) async {
      String? changed;
      await tester.pumpWidget(
        DesignHarness(
          location: '/note',
          screen: PageFrame(
            title: 'Notes',
            children: [
              NoteEditor(
                content:
                    '<h2>For family</h2><p><strong>Important</strong> memories.</p>',
                onChanged: (value) => changed = value,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(QuillSimpleToolbar), findsNothing);
      expect(find.byType(Card), findsNothing);
      final controller = tester
          .widget<QuillEditor>(find.byType(QuillEditor))
          .controller;
      controller.replaceText(controller.document.length - 1, 0, ' More', null);
      await tester.pump();
      expect(changed, contains('<h2>For family</h2>'));
      expect(changed, contains('<strong>Important</strong>'));
      expect(changed, contains('More'));
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
