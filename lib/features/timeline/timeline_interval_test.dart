// Verifies every native reminder/access sheet preserves web preference units.
// Owns selected options, interval identity and confirmed default-reset tests.
// Does not call live APIs or execute a will.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'timeline_options.dart';
import 'timeline_service.dart';
import 'timeline_test_app.dart';

void main() {
  for (final key in timelineDefaults.keys) {
    testWidgets('$key sheet saves the web key and milliseconds', (
      tester,
    ) async {
      final api = FakeApi(
        (name, args) async => name == 'UPDATE_PREFERENCES'
            ? {'updatePreferences': true}
            : await designResponse(name, args),
      );
      addTearDown(api.dispose);
      await tester.pumpWidget(TimelineTestApp(api: api));
      await tester.pumpAndSettle();
      final event = find.byKey(ValueKey(key));
      await tester.ensureVisible(event);
      await tester.pumpAndSettle();
      await tester.tap(event);
      await tester.pumpAndSettle();
      final selected = find.widgetWithText(
        ListTile,
        reminderOptions[timelineDefaults[key]]!,
      );
      await tester.scrollUntilVisible(
        selected,
        150,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
      expect(tester.widget<ListTile>(selected).selected, true);
      await tester.scrollUntilVisible(
        find.text('5 days'),
        -150,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('5 days'));
      await tester.pumpAndSettle();
      final request = api.calls
          .singleWhere((c) => c.$1 == 'UPDATE_PREFERENCES')
          .$2;
      expect(request, {'key': key, 'value': '432000000'});
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
  for (final plan in ['free', 'premium']) {
    testWidgets('$plan reset retains the existing plan restriction', (
      tester,
    ) async {
      final api = FakeApi(
        (name, args) async => name == 'UPDATE_PREFERENCES'
            ? {'updatePreferences': true}
            : await designResponse(name, args),
      );
      addTearDown(api.dispose);
      await tester.pumpWidget(
        TimelineTestApp(api: api, account: {...previewAccount, 'plan': plan}),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byTooltip('Reset timeline to defaults'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('Reset timeline to defaults'));
      await tester.pumpAndSettle();
      if (plan == 'free') {
        expect(find.text('Premium timeline settings'), findsOneWidget);
      } else {
        expect(
          find.textContaining('3, 30, 60, 10 and 100 days'),
          findsOneWidget,
        );
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(api.calls.where((c) => c.$1 == 'UPDATE_PREFERENCES'), isEmpty);
        await tester.tap(find.byTooltip('Reset timeline to defaults'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Confirm'));
        await tester.pumpAndSettle();
      }
      final updates = api.calls.where((c) => c.$1 == 'UPDATE_PREFERENCES');
      expect(updates.length, plan == 'free' ? 0 : 5);
      if (plan == 'premium') {
        expect(
          updates.map((c) => c.$2),
          timelineDefaults.entries.map((e) => {'key': e.key, 'value': e.value}),
        );
      }
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
