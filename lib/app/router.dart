// Routes Firebase email actions natively and all application pages to the web.
// Owns native deep-link entry and the authentication boundary.
// Does not map web features to native screens.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/auth_action_screen.dart';
import '../features/webview/webview_links.dart';
import 'account_gate.dart';

GoRouter createRouter() => GoRouter(
  initialLocation: '/app',
  redirect: (_, state) => mobileLocation(state.uri),
  routes: [
    GoRoute(
      path: '/auth-action',
      builder: (_, state) => AuthActionScreen(
        key: ValueKey(state.uri.toString()),
        parameters: state.uri.queryParameters,
      ),
    ),
    GoRoute(
      path: '/app',
      builder: (_, state) => AccountGate(
        key: ValueKey(state.uri.toString()),
        uri: webAppUri(state.uri),
      ),
    ),
    GoRoute(
      path: '/:path(.*)',
      builder: (_, state) => AccountGate(
        key: ValueKey(state.uri.toString()),
        uri: webAppUri(state.uri),
      ),
    ),
  ],
);
