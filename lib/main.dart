// Bootstraps Firebase and the native authentication/WebView wrapper.
// Owns startup configuration and application providers.
// Does not implement vault features or initialize web application services.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/cipherwill_app.dart';
import 'app/providers.dart';
import 'core/config/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig.fromEnvironment();
  try {
    config.validate();
    await Firebase.initializeApp(options: config.firebase);
  } catch (_) {
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                'Cipherwill could not start. Check this build’s Firebase configuration.',
              ),
            ),
          ),
        ),
      ),
    );
    return;
  }
  runApp(
    ProviderScope(
      overrides: [configProvider.overrideWithValue(config)],
      child: const CipherwillApp(),
    ),
  );
}
