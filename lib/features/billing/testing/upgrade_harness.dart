// Mounts real billing and upgrade routes with synthetic backend accounts.
// Owns account/subscription refresh tracking and controllable account failures.
// Does not bypass production authorization or create a payment.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import '../../../app/providers.dart';
import '../../../app/theme.dart';
import '../../../core/api/operations/ME.graphql.dart';
import '../../../testing/fake_api.dart';
import '../../../testing/fake_auth.dart';
import '../billing_screen.dart';
import '../upgrade_screen.dart';
import '../../../testing/fake_webview.dart';

class UpgradeApi extends FakeApi {
  String plan = 'free';
  bool failAccount = false;
  int accountReads = 0;
  Completer<void>? accountDelay;
  UpgradeApi()
    : super(
        (operation, _) async => switch (operation) {
          'GET_MY_SUBSCRIPTION' => {'getMySubscription': null},
          'GET_MY_INVOICES' => {'getMyInvoices': []},
          _ => {},
        },
      );
  @override
  Future<Query$ME$me> account() async {
    accountReads++;
    await accountDelay?.future;
    if (failAccount) throw StateError('Account unavailable');
    return (await super.account()).copyWith(
      id: 'backend-account',
      email: 'sam+mobile@example.com',
      plan: plan,
    );
  }
}

class UpgradeHarness {
  final api = UpgradeApi();
  final auth = FakeAuth();
  final web = FakeWebViewPlatform();
  final router = GoRouter(
    initialLocation: '/billing',
    routes: [
      GoRoute(path: '/billing', builder: (_, _) => const BillingScreen()),
      GoRoute(path: '/upgrade', builder: (_, _) => const UpgradeScreen()),
    ],
  );
  FakeWebViewController get controller => web.controllers.last;
  Future<void> mount(WidgetTester tester) async {
    final previousPlatform = WebViewPlatform.instance;
    WebViewPlatform.instance = web;
    addTearDown(() {
      if (previousPlatform != null) WebViewPlatform.instance = previousPlatform;
      router.dispose();
      api.dispose();
    });
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiProvider.overrideWithValue(api),
          firebaseProvider.overrideWithValue(auth),
          accountProvider.overrideWith(
            (ref) async => (await api.account()).toJson(),
          ),
        ],
        child: MaterialApp.router(
          theme: cipherwillTheme(Brightness.light),
          routerConfig: router,
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> open(WidgetTester tester) async {
    await tester.tap(find.text('Upgrade to Premium'));
    await tester.pumpAndSettle();
  }
}
