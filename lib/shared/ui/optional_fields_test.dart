// Checks required-first forms and the web's grouped optional field behavior.
// Owns addition, removal, existing-value and sensitive-input regressions.
// Does not save synthetic records to a backend.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../features/vault/categories.dart';
import 'asset_fields.dart';

void main() {
  testWidgets('new category forms show only mandatory fields', (tester) async {
    for (final category in categories.where(
      (c) => c.type != 'NOTE' && c.type != 'FILE',
    )) {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                child: AssetFields(
                  key: ValueKey(category.type),
                  fields: category.fields,
                  initial: const {},
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(TextFormField),
        findsNWidgets(category.fields.where((f) => f.required).length),
      );
      expect(
        find.text('Add field'),
        category.fields.any((f) => !f.required) ? findsOneWidget : findsNothing,
      );
    }
  });
  testWidgets('adding and removing a grouped field clears both siblings', (
    tester,
  ) async {
    Map<String, dynamic>? draft;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: AssetFields(
              fields: categoryFor('EMAIL_ACCOUNT').fields,
              initial: const {
                'email': 'a@example.com',
                'password': ' secret ',
                'unknown': 'preserved',
              },
              onChanged: (value) => draft = value,
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Add field'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Security Question'));
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(TextFormField, 'Security Answer'),
      findsOneWidget,
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Security Question'),
      'First pet',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Security Answer'),
      '  Tuffy  ',
    );
    expect(draft?['securityAnswer'], '  Tuffy  ');
    expect(draft?['unknown'], 'preserved');
    await tester.tap(find.byTooltip('Remove Security Question'));
    await tester.pumpAndSettle();
    expect(
      find.widgetWithText(TextFormField, 'Security Question'),
      findsNothing,
    );
    expect(find.widgetWithText(TextFormField, 'Security Answer'), findsNothing);
    expect(draft?['securityQuestion'], '');
    expect(draft?['securityAnswer'], '');
  });
  testWidgets('existing optional data remains visible on edit', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AssetFields(
            fields: categoryFor('PASSWORD').fields,
            initial: const {
              'username': 'Sam',
              'password': ' secret ',
              'uri': ['https://example.com'],
              'note': 'Keep this',
            },
            onChanged: (_) {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.widgetWithText(TextFormField, 'Websites'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Note'), findsOneWidget);
    expect(
      tester.widget<EditableText>(find.byType(EditableText).at(1)).obscureText,
      true,
    );
  });
}
