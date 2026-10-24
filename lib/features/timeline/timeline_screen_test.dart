// Checks timeline data and interval editing at the native web-equivalent page.
// Owns allowed check-in changes and Premium reminder gate regressions.
// Does not release wills or bypass server restrictions.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'timeline_test_app.dart';

void main() {
  for (final plan in ['free', 'premium']) {
    testWidgets(
      'timeline displays data and respects $plan interval permissions',
      (tester) async {
        final api = FakeApi(
          (name, args) async => name == 'UPDATE_PREFERENCES'
              ? {'updatePreferences': true}
              : await designResponse(name, args),
        );
        addTearDown(api.dispose);
        await tester.pumpWidget(
          TimelineTestApp(
            api: api,
            account: {
              ...previewAccount,
              'plan': plan,
              'birth_date': DateTime(2000, 10, 24).millisecondsSinceEpoch,
            },
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Next check-in'), findsOneWidget);
        expect(find.text('Estimated from today'), findsOneWidget);
        expect(find.textContaining('Last check-in'), findsOneWidget);
        final reminder = find.byKey(const ValueKey('first_reminder_after_ms'));
        await tester.ensureVisible(reminder);
        await tester.pumpAndSettle();
        await tester.tap(reminder);
        await tester.pumpAndSettle();
        if (plan == 'free') {
          expect(find.text('Premium timeline settings'), findsOneWidget);
          expect(api.calls.any((c) => c.$1 == 'UPDATE_PREFERENCES'), false);
          await tester.tap(find.text('Close'));
          await tester.pumpAndSettle();
        } else {
          expect(find.text('After your check-in window ends.'), findsOneWidget);
          await tester.tap(find.text('5 days'));
          await tester.pumpAndSettle();
          final request = api.calls
              .singleWhere((c) => c.$1 == 'UPDATE_PREFERENCES')
              .$2;
          expect(request['key'], 'first_reminder_after_ms');
          expect(request['value'], '432000000');
        }
        await tester.ensureVisible(find.text('Birthday'));
        await tester.pumpAndSettle();
        expect(find.textContaining('Next age'), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
