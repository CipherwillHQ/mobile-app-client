// Verifies clearing and editing a saved birth date through the native profile.
// Owns nullable update payloads, persistence after reopening and failed-save retry.
// Does not contact the backend or change unrelated profile fields.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../testing/fake_api.dart';
import 'profile_screen.dart';

void main() {
  late Json account;
  late FakeApi api;
  late Widget app;
  var failSave = false;
  final dateField = find.widgetWithText(TextField, 'Date of birth');
  setUp(() {
    failSave = false;
    account = {
      'first_name': 'Sam',
      'email': 'sam@example.com',
      'country': 'IN',
      'birth_date': DateTime.utc(2000, 1, 2).millisecondsSinceEpoch.toString(),
    };
    api = FakeApi((name, variables) async {
      if (name == 'UPDATE_USER') {
        if (failSave) throw StateError('Profile save unavailable');
        account = {...account, ...asJson(variables['data'])};
      }
      return {};
    });
    app = ProviderScope(
      overrides: [
        apiProvider.overrideWithValue(api),
        accountProvider.overrideWith((ref) async => {...account}),
      ],
      child: const MaterialApp(home: ProfileScreen()),
    );
  });
  tearDown(() => api.dispose());

  testWidgets('Clear saves null and the date stays empty after reopening', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(dateField).controller!.text, '2000-01-02');
    await tester.ensureVisible(dateField);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Clear date of birth'));
    await tester.pump();
    expect(tester.widget<TextField>(dateField).controller!.text, isEmpty);
    expect(api.calls, isEmpty);
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    final data = asJson(api.calls.single.$2['data']);
    expect(data.containsKey('birth_date'), isTrue);
    expect(data['birth_date'], isNull);
    expect(data['first_name'], 'Sam');
    expect(account['birth_date'], isNull);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(dateField).controller!.text, isEmpty);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('manually erasing the date also sends an explicit null', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    await tester.enterText(dateField, '');
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    expect(
      asJson(api.calls.single.$2['data']),
      containsPair('birth_date', null),
    );
    expect(account['birth_date'], isNull);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a failed clear keeps the draft and retries the null update', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    final savedDate = account['birth_date'];
    await tester.ensureVisible(dateField);
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Clear date of birth'));
    failSave = true;
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    expect(account['birth_date'], savedDate);
    expect(tester.widget<TextField>(dateField).controller!.text, isEmpty);
    expect(find.text('Profile saved.'), findsNothing);
    failSave = false;
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    expect(api.calls, hasLength(2));
    for (final call in api.calls) {
      expect(asJson(call.$2['data']), containsPair('birth_date', null));
    }
    expect(account['birth_date'], isNull);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a replacement birth date still saves at UTC midnight', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    await tester.enterText(dateField, '2001-04-05');
    await tester.tap(find.text('Save profile'));
    await tester.pumpAndSettle();
    expect(
      account['birth_date'],
      DateTime.utc(2001, 4, 5).millisecondsSinceEpoch.toString(),
    );
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
