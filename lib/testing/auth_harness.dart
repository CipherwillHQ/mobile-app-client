// Hosts retained authentication widgets with explicit test dependencies.
// Owns test Firebase/configuration overrides and keyboard insets.
// Does not initialize native plugins or load web pages.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app/providers.dart';
import '../app/theme.dart';
import '../core/config/app_config.dart';
import '../features/auth/auth_screen.dart';

class AuthHarness extends StatelessWidget {
  final Widget screen;
  final FirebaseAuth? auth;
  final double keyboard;
  const AuthHarness({
    super.key,
    this.screen = const AuthScreen(),
    this.auth,
    this.keyboard = 0,
  });
  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [
      configProvider.overrideWithValue(
        const AppConfig(
          environment: 'test',
          apiUrl: 'https://api.example.test/v1/',
          firebase: FirebaseOptions(
            apiKey: 'test-key',
            appId: 'test-app',
            messagingSenderId: 'test-sender',
            projectId: 'test-project',
          ),
          googleClientId: '',
        ),
      ),
      if (auth != null) firebaseProvider.overrideWithValue(auth!),
    ],
    child: MaterialApp(
      theme: cipherwillTheme(Brightness.light),
      home: screen,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(viewInsets: EdgeInsets.only(bottom: keyboard)),
        child: child!,
      ),
    ),
  );
}
