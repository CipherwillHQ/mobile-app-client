// Verifies free check-in editing, custom values and honest save feedback.
// Owns cancellation, no-op selection and failed-write regressions.
// Does not change server scheduling or use real account data.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'timeline_test_app.dart';

void main() {
  testWidgets('free check-in sheet keeps custom days and saves day units', (
    tester,
  ) async {
    final preferences = {...previewPreferences, 'check_in_interval': '31'};
    final api = FakeApi((name, args) async {
      if (name != 'UPDATE_PREFERENCES') return designResponse(name, args);
      preferences[args['key'].toString()] = args['value'];
      return {'updatePreferences': true};
    });
    addTearDown(api.dispose);
    await tester.pumpWidget(
      TimelineTestApp(
        api: api,
        account: {...previewAccount, 'plan': 'free'},
        preferences: preferences,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Every 31 days'), findsOneWidget);
    await tester.tap(find.byTooltip('Edit check-in interval'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<ListTile>(find.widgetWithText(ListTile, '31 days'))
          .selected,
      true,
    );
    await tester.tap(find.byTooltip('Close selection'));
    await tester.pumpAndSettle();
    expect(api.calls.where((c) => c.$1 == 'UPDATE_PREFERENCES'), isEmpty);
    await tester.tap(find.byTooltip('Edit check-in interval'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('31 days'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('31 days'));
    await tester.pumpAndSettle();
    expect(api.calls.where((c) => c.$1 == 'UPDATE_PREFERENCES'), isEmpty);
    await tester.tap(find.byTooltip('Edit check-in interval'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('1 week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1 week'));
    await tester.pumpAndSettle();
    expect(api.calls.singleWhere((c) => c.$1 == 'UPDATE_PREFERENCES').$2, {
      'key': 'check_in_interval',
      'value': '7',
    });
    expect(find.text('Every 7 days'), findsOneWidget);
    expect(find.text('Premium timeline settings'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('failed save restores editing without a success message', (
    tester,
  ) async {
    final response = Completer<bool>();
    final api = FakeApi(
      (name, args) async => name == 'UPDATE_PREFERENCES'
          ? {'updatePreferences': await response.future}
          : await designResponse(name, args),
    );
    addTearDown(api.dispose);
    await tester.pumpWidget(TimelineTestApp(api: api));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Edit check-in interval'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('1 week'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('1 week'));
    await tester.pumpAndSettle();
    expect(find.text('Saving schedule…'), findsOneWidget);
    expect(
      tester
          .widget<TextButton>(find.widgetWithText(TextButton, 'Every 30 days'))
          .onPressed,
      isNull,
    );
    response.completeError(StateError('Could not save timeline'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Could not save timeline'), findsOneWidget);
    expect(find.text('Timeline preference saved.'), findsNothing);
    expect(find.text('Saving schedule…'), findsNothing);
    expect(
      tester
          .widget<TextButton>(find.widgetWithText(TextButton, 'Every 30 days'))
          .onPressed,
      isNotNull,
    );
    expect(api.calls.where((c) => c.$1 == 'UPDATE_PREFERENCES').length, 1);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
