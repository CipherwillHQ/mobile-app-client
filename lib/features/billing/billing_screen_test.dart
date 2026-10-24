// Checks mobile billing uses upgrades for Free and the portal for subscribers.
// Owns native action visibility and nullable subscription-date regressions.
// Does not open a real checkout or cancel subscriptions.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/providers.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'billing_screen.dart';

void main() {
  for (final plan in ['free', 'premium']) {
    testWidgets('$plan account shows the correct billing action', (
      tester,
    ) async {
      final api = FakeApi(
        (name, args) async => name == 'GET_MY_SUBSCRIPTION'
            ? {
                'getMySubscription': plan == 'free'
                    ? null
                    : {
                        'id': 'sub',
                        'plan_name': 'Premium',
                        'status': 'active',
                        'payment_gateway': 'paddle',
                        'next_billing_at': null,
                        'cancel_at': '1',
                      },
              }
            : await designResponse(name, args),
      );
      addTearDown(api.dispose);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            apiProvider.overrideWithValue(api),
            accountProvider.overrideWith(
              (ref) async => {...previewAccount, 'plan': plan},
            ),
          ],
          child: const MaterialApp(home: BillingScreen()),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.text('Upgrade to Premium'),
        plan == 'free' ? findsOneWidget : findsNothing,
      );
      expect(
        find.text('Manage billing'),
        plan == 'premium' ? findsOneWidget : findsNothing,
      );
      expect(
        find.text('Cancellation scheduled'),
        plan == 'premium' ? findsOneWidget : findsNothing,
      );
      expect(find.text('Next billing'), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }
}
