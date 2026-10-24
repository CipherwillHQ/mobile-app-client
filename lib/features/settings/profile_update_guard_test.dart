// Checks profile drafts are retained before a global store handoff.
// Owns failed-save, active-save and edits-during-save regression coverage.
// Does not alter profile Back behavior or call the real backend.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_app_update.dart';
import '../updates/update_test_app.dart';
import 'profile_screen.dart';

void main() {
  late FakeAppUpdates updates;
  late FakeApi api;
  late Widget app;
  bool failSave = false;
  Future<void>? pendingSave;
  setUp(() {
    failSave = false;
    pendingSave = null;
    updates = FakeAppUpdates();
    api = FakeApi((name, variables) async {
      if (name == 'UPDATE_USER') {
        await pendingSave;
        if (failSave) throw StateError('Please retry profile save');
      }
      return {};
    });
    app = ProviderScope(
      overrides: [
        apiProvider.overrideWithValue(api),
        accountProvider.overrideWith((ref) async => {'first_name': 'Sam'}),
      ],
      child: UpdateTestApp(service: updates, home: const ProfileScreen()),
    );
  });
  tearDown(() => api.dispose());
  testWidgets('failed profile save stays dirty until a confirmed retry', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'New name');
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    failSave = true;
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    expect(
      tester.widget<TextField>(find.byType(TextField).first).controller!.text,
      'New name',
    );
    failSave = false;
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 1);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('saving and later edits block Update until their own save', (
    tester,
  ) async {
    final pending = Completer<void>();
    pendingSave = pending.future;
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'First draft');
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    await tester.enterText(find.byType(TextField).first, 'Second draft');
    pending.complete();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 1);
    expect(api.calls.last.$2['data']['first_name'], 'Second draft');
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
