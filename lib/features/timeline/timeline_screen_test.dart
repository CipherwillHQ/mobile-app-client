// Checks timeline data and interval editing at the native web-equivalent page.
// Owns allowed check-in changes and Premium reminder gate regressions.
// Does not release wills or bypass server restrictions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'timeline_screen.dart';

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
          ProviderScope(
            overrides: [
              apiProvider.overrideWithValue(api),
              accountProvider.overrideWith(
                (ref) async => {
                  ...previewAccount,
                  'plan': plan,
                  'birth_date': DateTime(
                    2000,
                    10,
                    24,
                  ).millisecondsSinceEpoch.toString(),
                },
              ),
              preferencesProvider.overrideWith(
                (ref) async => previewPreferences,
              ),
            ],
            child: const MaterialApp(home: TimelineScreen()),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Schedule (based on Birthdate)'), findsOneWidget);
        expect(find.textContaining('Last Check In was on'), findsOneWidget);
        await tester.ensureVisible(find.text('First Check-in Reminder'));
        await tester.pumpAndSettle();
        await tester.ensureVisible(find.widgetWithText(TextButton, '3 days'));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(TextButton, '3 days'));
        await tester.pumpAndSettle();
        if (plan == 'free') {
          expect(find.text('Premium timeline settings'), findsOneWidget);
          expect(api.calls.any((c) => c.$1 == 'UPDATE_PREFERENCES'), false);
        } else {
          await tester.tap(find.text('5 days'));
          await tester.pumpAndSettle();
          final request = api.calls
              .singleWhere((c) => c.$1 == 'UPDATE_PREFERENCES')
              .$2;
          expect(request['key'], 'first_reminder_after_ms');
          expect(request['value'], '432000000');
        }
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
