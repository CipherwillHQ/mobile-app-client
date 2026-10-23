// Loads per-build public configuration
// Owns environment and public service identifiers.
// Does not ship server credentials.
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class AppConfig {
  final String environment;
  final String apiUrl;
  final String reownProjectId;
  final String sentryDsn;
  final FirebaseOptions firebase;
  final String googleClientId;
  const AppConfig({
    required this.environment,
    required this.apiUrl,
    required this.reownProjectId,
    required this.sentryDsn,
    required this.firebase,
    required this.googleClientId,
  });
  factory AppConfig.fromEnvironment() => AppConfig(
    environment: const String.fromEnvironment(
      'APP_ENV',
      defaultValue: 'development',
    ),
    apiUrl: const String.fromEnvironment('API_URL'),
    reownProjectId: const String.fromEnvironment('REOWN_PROJECT_ID'),
    sentryDsn: const String.fromEnvironment('SENTRY_DSN'),
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
    if (apiUrl.isEmpty ||
        firebase.apiKey.isEmpty ||
        firebase.appId.isEmpty ||
        firebase.projectId.isEmpty) {
      throw StateError(
        'Configure API_URL and Firebase build values before starting Cipherwill.',
      );
    }
    final uri = Uri.parse(apiUrl);
    if (environment == 'production' && uri.scheme != 'https') {
      throw StateError('Production requires an HTTPS API endpoint.');
    }
  }
}
