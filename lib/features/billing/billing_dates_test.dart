// Checks scheduled cancellation dates in the native subscription details.
// Owns local date/time display, absent-date handling and billing refresh coverage.
// Does not open the subscriber portal or cancel a subscription.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import '../../app/providers.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import 'billing_screen.dart';

void main() {
  final cancellation = DateTime.utc(2026, 11, 12, 10, 30);
  late String? cancelAt;
  late FakeApi api;
  late Widget app;
  setUp(() {
    cancelAt = cancellation.millisecondsSinceEpoch.toString();
    api = FakeApi(
      (name, args) async => name == 'GET_MY_SUBSCRIPTION'
          ? {
              'getMySubscription': {
                'id': 'subscription',
                'plan_name': 'Premium',
                'status': 'active',
                'payment_gateway': 'paddle',
                'next_billing_at': null,
                'cancel_at': cancelAt,
              },
            }
          : await designResponse(name, args),
    );
    app = ProviderScope(
      overrides: [
        apiProvider.overrideWithValue(api),
        accountProvider.overrideWith((ref) async => previewAccount),
      ],
      child: const MaterialApp(home: BillingScreen()),
    );
  });
  tearDown(() => api.dispose());

  testWidgets('scheduled cancellation shows its local date and time', (
    tester,
  ) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('Cancellation scheduled'), findsOneWidget);
    expect(
      find.text(DateFormat.yMMMd().add_jm().format(cancellation.toLocal())),
      findsOneWidget,
    );
    expect(find.text('Next billing'), findsNothing);
    expect(find.text('Manage billing'), findsOneWidget);
    expect(api.calls.where((call) => call.$1.startsWith('CANCEL_')), isEmpty);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('a subscription without cancellation has no cancellation row', (
    tester,
  ) async {
    cancelAt = null;
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('Cancellation scheduled'), findsNothing);
    expect(find.text('Date unavailable'), findsNothing);
    expect(find.text('Manage billing'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets(
    'refresh replaces a changed cancellation date and removes a revoked schedule',
    (tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      final later = DateTime.utc(2026, 12, 12, 15, 45);
      cancelAt = later.millisecondsSinceEpoch.toString();
      await tester.tap(find.byTooltip('Refresh billing'));
      await tester.pumpAndSettle();
      expect(
        find.text(DateFormat.yMMMd().add_jm().format(later.toLocal())),
        findsOneWidget,
      );
      expect(
        find.text(DateFormat.yMMMd().add_jm().format(cancellation.toLocal())),
        findsNothing,
      );
      cancelAt = null;
      await tester.tap(find.byTooltip('Refresh billing'));
      await tester.pumpAndSettle();
      expect(find.text('Cancellation scheduled'), findsNothing);
      expect(
        api.calls.where((call) => call.$1 == 'GET_MY_SUBSCRIPTION'),
        hasLength(3),
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
