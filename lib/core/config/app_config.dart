// Loads public build configuration for native authentication.
// Owns Firebase identifiers, the reset-email API and Google sign-in configuration.
// Does not configure web application services or ship server credentials.
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class AppConfig {
  final String environment;
  final String apiUrl;
  final FirebaseOptions firebase;
  final String googleClientId;
  const AppConfig({
    required this.environment,
    required this.apiUrl,
    required this.firebase,
    required this.googleClientId,
  });
  factory AppConfig.fromEnvironment() => AppConfig(
    environment: const String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    ),
    apiUrl: const String.fromEnvironment(
      'API_URL',
      defaultValue: 'https://api.stack.cipherwill.com/v1/',
    ),
    googleClientId: const String.fromEnvironment('GOOGLE_SERVER_CLIENT_ID'),
    firebase: const String.fromEnvironment('FIREBASE_API_KEY').isEmpty
        ? DefaultFirebaseOptions.currentPlatform
        : FirebaseOptions(
            apiKey: const String.fromEnvironment('FIREBASE_API_KEY'),
            appId: Platform.isIOS
                ? const String.fromEnvironment('FIREBASE_IOS_APP_ID')
                : const String.fromEnvironment('FIREBASE_ANDROID_APP_ID'),
            messagingSenderId: const String.fromEnvironment(
              'FIREBASE_SENDER_ID',
            ),
            projectId: const String.fromEnvironment('FIREBASE_PROJECT_ID'),
            iosBundleId: 'com.cipherwill.app',
          ),
  );
  void validate() {
    final uri = Uri.tryParse(apiUrl);
    if (uri == null ||
        !uri.hasAuthority ||
        firebase.apiKey.isEmpty ||
        firebase.appId.isEmpty ||
        firebase.projectId.isEmpty) {
      throw StateError(
        'Configure Firebase and the password-reset API before starting Cipherwill.',
      );
    }
    if (environment == 'production' && uri.scheme != 'https') {
      throw StateError('Production requires an HTTPS password-reset API.');
    }
  }
}
