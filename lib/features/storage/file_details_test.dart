// Checks metadata-only renaming against the existing update operation.
// Owns preservation of file extension and unrelated metadata.
// Does not upload or decrypt file bytes.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../shared/ui/page_frame.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_auth.dart';
import 'file_details.dart';

void main() {
  testWidgets(
    'rename preserves binary file metadata and confirms the server write',
    (tester) async {
      var metadata = {
        'title': 'Family document',
        'file_ext': 'pdf',
        'file_size': '2048',
      };
      final api = FakeApi((operation, variables) async {
        if (operation == 'UPDATE_METAMODEL') {
          metadata = Map<String, String>.from(
            jsonDecode(variables['data']['metadata']),
          );
          return {
            'updateMetamodel': {'id': 'file'},
          };
        }
        return {
          'getMetamodel': {
            'metadata': jsonEncode(metadata),
            'updated_at': '1792800000000',
          },
        };
      });
      addTearDown(api.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            apiProvider.overrideWithValue(api),
            firebaseProvider.overrideWithValue(FakeAuth()),
          ],
          child: MaterialApp(
            theme: cipherwillTheme(Brightness.light),
            home: const PageFrame(
              title: 'File',
              children: [FileDetails(id: 'file')],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Rename file'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'A renamed document');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      expect(metadata, {
        'title': 'A renamed document',
        'file_ext': 'pdf',
        'file_size': '2048',
      });
      expect(
        api.calls.where((call) => call.$1 == 'UPDATE_METAMODEL'),
        hasLength(1),
      );
      expect(find.text('File renamed.'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
