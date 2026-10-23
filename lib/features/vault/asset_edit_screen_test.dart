// Exercises committed save feedback through the actual encrypted editor.
// Owns success/failure retry and save-button restoration regressions.
// Does not call a live backend or store the test password.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/api/json_values.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_auth.dart';
import 'asset_edit_screen.dart';

class EditorApi extends FakeApi {
  bool failCommit = false;
  EditorApi() : super((_, _) async => {});
  @override
  Future<Json> run(String name, [Json variables = const {}]) async {
    calls.add((name, variables));
    return switch (name) {
      'GET_METAMODEL' => {
        'getMetamodel': {
          'metadata': '{"name":"Personal login"}',
          'ignored_beneficiaries': [],
        },
      },
      'GET_FACTORS' => {'getFactors': []},
      'GET_BENEFICIARY_FACTORS' => {'getBeneficiaryFactors': []},
      'createUploadPodSession' => {
        'createUploadPodSession': {'id': 'session'},
      },
      'commitUploadSession' =>
        failCommit
            ? throw StateError('Connection interrupted')
            : {
                'commitUploadSession': {'status': 'COMPLETED'},
              },
      _ => {},
    };
  }
}

void main() {
  for (final fails in [false, true]) {
    testWidgets(
      'encrypted save restores controls after ${fails ? 'failure' : 'success'}',
      (tester) async {
        final api = EditorApi()..failCommit = fails;
        addTearDown(api.dispose);
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              apiProvider.overrideWithValue(api),
              firebaseProvider.overrideWithValue(FakeAuth()),
            ],
            child: MaterialApp(
              theme: cipherwillTheme(Brightness.light),
              home: const AssetEditScreen(
                id: 'item',
                type: 'PASSWORD',
                newItem: true,
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Username'),
          'sam',
        );
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Password'),
          ' test password ',
        );
        FocusManager.instance.primaryFocus?.unfocus();
        await tester.pumpAndSettle();
        await tester.drag(find.byType(ListView), const Offset(0, -1200));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Save changes'));
        await tester.pumpAndSettle();
        final save = tester.widget<FilledButton>(
          find.widgetWithText(FilledButton, 'Save changes'),
        );
        expect(save.onPressed, isNotNull);
        if (fails) {
          expect(find.text('Save failed. Retry.'), findsOneWidget);
          expect(find.text('Saved'), findsNothing);
          api.failCommit = false;
          await tester.tap(find.text('Save changes'));
          await tester.pumpAndSettle();
        }
        expect(find.text('Saved'), findsOneWidget);
        expect(
          api.calls.where((call) => call.$1 == 'commitUploadSession').length,
          fails ? 2 : 1,
        );
        expect(tester.takeException(), isNull);
      },
    );
  }
}
