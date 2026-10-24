// Exercises category forms, masked copying and truthful save feedback.
// Owns phone layout and opt-in rendered form evidence.
// Does not send synthetic vault content to the backend.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_harness.dart';
import '../../testing/design_capture.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/asset_fields.dart';
import 'categories.dart';
import 'categories/seed_phrase.dart';
import 'asset_draft_form.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(loadDesignFonts);
  testWidgets(
    'all category forms fit phones and preserve failed-save controls',
    (tester) async {
      tester.view.physicalSize = const Size(393, 852);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final brightness in Brightness.values) {
        for (final category in categories.where(
          (category) => category.type != 'FILE',
        )) {
          final title = TextEditingController(
            text: 'Personal ' + category.title,
          );
          final initial = {
            for (final field in category.fields)
              field.key: field.array
                  ? ['first value', 'second value']
                  : 'Sample details',
            if (category.type == 'NOTE')
              'content': '<h2>For my family</h2><p>Keep making memories.</p>',
          };
          await tester.pumpWidget(
            DesignHarness(
              location: '/form',
              key: ValueKey(category.type + brightness.name),
              brightness: brightness,
              screen: PageFrame(
                title: category.title,
                focused: true,
                footer: FilledButton(
                  onPressed: () {},
                  child: const Text('Save changes'),
                ),
                children: [
                  AssetDraftForm(
                    form: GlobalKey<FormState>(),
                    title: title,
                    category: category,
                    initial: initial,
                    draft: initial,
                    status: 'Save failed. Retry.',
                    changed: (_) {},
                  ),
                ],
              ),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: category.type);
          await captureDesign(
            tester,
            'form-' + category.type.toLowerCase() + '-' + brightness.name,
          );
          await tester.ensureVisible(find.text('Save changes'));
          await tester.pumpAndSettle();
          expect(find.text('Saved'), findsNothing);
          expect(find.text('Save failed. Retry.'), findsOneWidget);
          final button = tester.widget<FilledButton>(
            find.widgetWithText(FilledButton, 'Save changes'),
          );
          expect(button.onPressed, isNotNull);
          expect(tester.takeException(), isNull, reason: category.type);
          await tester.pumpWidget(const SizedBox());
          title.dispose();
        }
      }
    },
  );
  testWidgets(
    'executor seed phrase copies in web format while staying masked',
    (tester) async {
      String? clipboard;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            clipboard = call.arguments['text'];
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      var edits = 0;
      await tester.pumpWidget(
        DesignHarness(
          location: '/read-only',
          screen: PageFrame(
            title: 'Granted item',
            children: [
              AssetFields(
                fields: seedPhraseCategory.fields,
                initial: const {
                  'phrase': ['one', 'two', 'three'],
                },
                readOnly: true,
                onChanged: (_) => edits++,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<EditableText>(find.byType(EditableText).first)
            .obscureText,
        true,
      );
      await tester.tap(find.byTooltip('Copy Seed Phrase'));
      await tester.pumpAndSettle();
      expect(clipboard, 'one two three');
      expect(edits, 0);
      expect(
        tester.widget<EditableText>(find.byType(EditableText).first).readOnly,
        true,
      );
      expect(
        tester
            .widget<EditableText>(find.byType(EditableText).first)
            .obscureText,
        true,
      );
      await tester.tap(find.byTooltip('Reveal value'));
      await tester.pump();
      expect(
        tester
            .widget<EditableText>(find.byType(EditableText).first)
            .obscureText,
        false,
      );
      expect(
        tester
            .widget<EditableText>(find.byType(EditableText).first)
            .controller
            .text,
        'one\ntwo\nthree',
      );
    },
  );
}
