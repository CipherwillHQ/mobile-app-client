// Mounts verification guidance with controlled Firebase and backend responses.
// Owns reusable gate fixtures, delivery delays and fresh verification status.
// Does not contact native plugins or send real verification email.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/account_gate.dart';
import '../../app/providers.dart';
import '../../app/theme.dart';
import '../../core/api/json_values.dart';
import '../../core/api/operations/ME.graphql.dart';
import '../../testing/design_fixtures.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_auth.dart';
import 'guidance_screen.dart';

class VerificationUser extends FakeUser {
  final events = <String>[];
  Object? failure;
  VerificationUser() : super('verification-user');
  @override
  Future<void> reload() async {
    events.add('reload');
    if (failure != null) throw failure!;
  }

  @override
  Future<String?> getIdToken([bool forceRefresh = false]) async {
    events.add(forceRefresh ? 'fresh-token' : 'token');
    return 'test-token';
  }
}

class VerificationApi extends FakeApi {
  bool verified = false, accepted = true;
  Object? failure;
  Completer<void>? delivery;
  final VerificationUser user;
  VerificationApi(this.user) : super(designResponse);
  @override
  Future<Json> run(String name, [Json variables = const {}]) async {
    if (name != 'SEND_EMAIL_VERIFICATION') return super.run(name, variables);
    calls.add((name, variables));
    if (failure != null) throw failure!;
    await delivery?.future;
    return {'sendEmailVerification': accepted};
  }

  @override
  Future<Query$ME$me> account() async {
    user.events.add('account');
    return Query$ME$me.fromJson({
      ...previewAccount,
      'email_verified': verified,
      'updated_at': '1',
      '__typename': 'User',
    });
  }
}

class VerificationTestApp extends StatefulWidget {
  final VerificationApi api;
  final String location;
  final bool reducedMotion;
  final List<Json> factors;
  const VerificationTestApp({
    super.key,
    required this.api,
    this.location = '/guide',
    this.reducedMotion = false,
    this.factors = const [],
  });
  @override
  State<VerificationTestApp> createState() => _VerificationTestAppState();
}

class _VerificationTestAppState extends State<VerificationTestApp> {
  late final auth = FakeAuth()..user = widget.api.user;
  late final router = GoRouter(
    initialLocation: widget.location,
    routes: [
      GoRoute(
        path: '/guide',
        builder: (_, _) => const AccountGate(child: GuidanceScreen()),
      ),
      GoRoute(
        path: '/home',
        builder: (_, _) =>
            const AccountGate(child: Scaffold(body: Text('Dashboard'))),
      ),
      GoRoute(
        path: '/vault',
        builder: (_, _) =>
            const AccountGate(child: Scaffold(body: Text('Private vault'))),
      ),
    ],
  );
  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [
      firebaseProvider.overrideWithValue(auth),
      authStateProvider.overrideWith((ref) => Stream.value(auth.currentUser)),
      apiProvider.overrideWithValue(widget.api),
      onboardingProvider.overrideWith((ref) async => {'is_completed': true}),
      factorsProvider.overrideWith((ref) async => widget.factors),
    ],
    child: MaterialApp.router(
      theme: cipherwillTheme(Brightness.light),
      routerConfig: router,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(disableAnimations: widget.reducedMotion),
        child: child!,
      ),
    ),
  );
}
