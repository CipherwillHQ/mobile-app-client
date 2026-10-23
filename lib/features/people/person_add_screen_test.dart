// Checks the actual search-first people flow and explicit email options.
// Owns guest invitation failure/retry and anonymity opt-out regressions.
// Does not send real invitations or migrate real keys.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/navigation_harness.dart';
import '../../testing/design_fixtures.dart';

void main() {
  testWidgets(
    'find person precedes invitation and email opt-out disables anonymity',
    (tester) async {
      final harness = NavigationHarness(
        hasFactors: false,
        respond: (name, args) async => switch (name) {
          'SEARCH_PERSON' => {'searchPerson': []},
          'INVITE_USER' => {
            'inviteUser': {
              'id': 'guest',
              '__typename': 'Guest',
              'invitation_email': {'status': 'skipped'},
            },
          },
          'ADD_SMARTWILL_FRIEND' => {'addSmartWillFriend': true},
          _ => await designResponse(name, args),
        },
      );
      addTearDown(harness.dispose);
      await harness.mount(tester);
      harness.router.push('/people/add?friend=true');
      await tester.pumpAndSettle();
      expect(find.text('Invite someone you trust'), findsNothing);
      expect(find.text('Send invitation email'), findsNothing);
      await tester.enterText(find.byType(TextField), 'guest@example.com');
      await tester.tap(find.text('Find person'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add person'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Guest');
      await tester.tap(find.text('Send email anonymously'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Send invitation email'));
      await tester.pumpAndSettle();
      final anonymous = tester.widget<SwitchListTile>(
        find.widgetWithText(SwitchListTile, 'Send email anonymously'),
      );
      expect(anonymous.value, false);
      expect(anonymous.onChanged, isNull);
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add person'));
      await tester.pumpAndSettle();
      final request = harness.api.calls
          .singleWhere((c) => c.$1 == 'INVITE_USER')
          .$2;
      expect(request['send_email'], false);
      expect(request['anonymous_invite'], false);
      expect(
        harness.api.calls.where((c) => c.$1 == 'ADD_SMARTWILL_FRIEND').length,
        1,
      );
      expect(find.text('Friend added.'), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets('failed email leaves guest form open for retry without adding', (
    tester,
  ) async {
    final harness = NavigationHarness(
      hasFactors: false,
      respond: (name, args) async => switch (name) {
        'SEARCH_PERSON' => {'searchPerson': []},
        'INVITE_USER' => {
          'inviteUser': {
            'id': 'guest',
            '__typename': 'Guest',
            'invitation_email': {
              'status': 'failed',
              'reason': 'Delivery failed',
            },
          },
        },
        _ => await designResponse(name, args),
      },
    );
    addTearDown(harness.dispose);
    await harness.mount(tester);
    harness.router.push('/people/add?friend=true');
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'guest@example.com');
    await tester.tap(find.text('Find person'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add person'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Guest');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add person'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Delivery failed'), findsOneWidget);
    expect(find.text('Back to search'), findsOneWidget);
    expect(harness.api.calls.any((c) => c.$1 == 'ADD_SMARTWILL_FRIEND'), false);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
