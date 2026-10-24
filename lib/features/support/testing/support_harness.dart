// Mounts support chat with synthetic accounts and a controllable native WebView.
// Owns account failures, delayed lookups and test route lifetimes.
// Does not contact Firebase, Tawk or a real support agent.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import '../../../app/providers.dart';
import '../../../core/api/operations/ME.graphql.dart';
import '../../../testing/fake_api.dart';
import '../../../testing/fake_auth.dart';
import '../../../testing/fake_webview.dart';
import '../../settings/settings_screen.dart';
import '../support_chat_screen.dart';

class SupportApi extends FakeApi {
  bool failAccount = false;
  int accountReads = 0;
  Completer<void>? delay;
  SupportApi() : super((_, _) async => {});
  @override
  Future<Query$ME$me> account() async {
    accountReads++;
    await delay?.future;
    if (failAccount) throw StateError('Account unavailable');
    return (await super.account()).copyWith(
      id: 'support-account',
      email: 'sam+support@example.com',
      first_name: 'Sam',
      last_name: 'Mobile',
    );
  }
}

class SupportHarness {
  final api = SupportApi();
  final auth = FakeAuth();
  final web = FakeWebViewPlatform();
  final router = GoRouter(
    initialLocation: '/settings',
    routes: [
      GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
      GoRoute(
        path: '/support-chat',
        builder: (_, _) => const SupportChatScreen(),
      ),
    ],
  );
  FakeWebViewController get controller => web.controllers.last;
  Future<void> mount(WidgetTester tester) async {
    final previous = WebViewPlatform.instance;
    WebViewPlatform.instance = web;
    addTearDown(() {
      if (previous != null) WebViewPlatform.instance = previous;
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
          factorsProvider.overrideWith((ref) async => []),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> open(WidgetTester tester) async {
    await tester.scrollUntilVisible(
      find.text('Live Chat with Team'),
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.tap(find.text('Live Chat with Team'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
  }
}
