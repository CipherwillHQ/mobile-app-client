// Checks the simple note surface preserves web HTML without formatting controls.
// Owns toolbar-free editing and keyboard input across parent rebuilds.
// Does not save note contents or change encryption versions.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '../../testing/design_harness.dart';
import '../../shared/ui/page_frame.dart';
import 'note_editor.dart';

void main() {
  testWidgets(
    'backspace works through edit and autosave rebuilds',
    (tester) async {
      final revision = ValueNotifier(0);
      addTearDown(revision.dispose);
      String? changed;
      await tester.pumpWidget(
        DesignHarness(
          location: '/note',
          screen: PageFrame(
            title: 'Notes',
            children: [
              ValueListenableBuilder<int>(
                valueListenable: revision,
                builder: (_, value, child) => NoteEditor(
                  content: '<p>Family note</p>',
                  onChanged: (html) {
                    changed = html;
                    revision.value++;
                  },
                ),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      final editor = find.byType(QuillEditor);
      final controller = tester.widget<QuillEditor>(editor).controller;
      await tester.tapAt(tester.getTopLeft(editor) + const Offset(20, 20));
      await tester.pump();
      expect(tester.testTextInput.hasAnyClients, isTrue);
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'Family note!\n',
          selection: TextSelection.collapsed(offset: 12),
        ),
      );
      await tester.pump();
      expect(controller.document.toPlainText(), 'Family note!\n');
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(controller.document.toPlainText(), 'Family note\n');
      expect(changed, '<p>Family note</p>');
      revision.value++;
      await tester.pump();
      tester.testTextInput.updateEditingValue(
        const TextEditingValue(
          text: 'Family not\n',
          selection: TextSelection.collapsed(offset: 10),
        ),
      );
      await tester.pump();
      expect(controller.document.toPlainText(), 'Family not\n');
      await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
      await tester.pump();
      expect(controller.document.toPlainText(), 'Family no\n');
      expect(changed, '<p>Family no</p>');
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
    variant: TargetPlatformVariant({TargetPlatform.android}),
  );

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
