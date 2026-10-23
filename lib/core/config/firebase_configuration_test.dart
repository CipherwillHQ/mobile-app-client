// Checks registered Firebase options match both native app configurations.
// Owns cross-platform project identity and Google client consistency tests.
// Does not contact Firebase or claim live sign-in/device acceptance.

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'app_config.dart';
import 'firebase_options.dart';

void main() {
  final android =
      jsonDecode(File('android/app/google-services.json').readAsStringSync())
          as Map<String, dynamic>;
  final client =
      (android['client'] as List).singleWhere(
            (value) =>
                value['client_info']['android_client_info']['package_name'] ==
                'com.cipherwill.app',
          )
          as Map<String, dynamic>;

  test('Android Firebase options match the registered native app', () {
    const options = DefaultFirebaseOptions.android;
    expect(options.projectId, 'project-cipherwill');
    expect(options.projectId, android['project_info']['project_id']);
    expect(
      options.messagingSenderId,
      android['project_info']['project_number'],
    );
    expect(options.appId, client['client_info']['mobilesdk_app_id']);
    expect(options.apiKey, client['api_key'][0]['current_key']);
    expect(options.appId, contains(':android:'));
    expect(
      (client['oauth_client'] as List).any(
        (value) => value['client_type'] == 1,
      ),
      isTrue,
    );
  });

  test(
    'iOS Firebase options and Google return configuration are consistent',
    () {
      const options = DefaultFirebaseOptions.ios;
      final ios = File(
        'ios/Runner/GoogleService-Info.plist',
      ).readAsStringSync();
      final info = File('ios/Runner/Info.plist').readAsStringSync();
      final server =
          (client['oauth_client'] as List).singleWhere(
                (value) => value['client_type'] == 3,
              )['client_id']
              as String;
      final expected = [
        (ios, 'GOOGLE_APP_ID', options.appId),
        (ios, 'PROJECT_ID', 'project-cipherwill'),
        (ios, 'GCM_SENDER_ID', options.messagingSenderId),
        (ios, 'BUNDLE_ID', options.iosBundleId),
        (ios, 'API_KEY', options.apiKey),
        (ios, 'CLIENT_ID', options.iosClientId),
        (info, 'GIDClientID', options.iosClientId),
        (info, 'GIDServerClientID', server),
      ];
      for (final (source, key, value) in expected) {
        final match = RegExp(
          '<key>' + key + r'</key>\s*<string>([^<]+)</string>',
        ).firstMatch(source);
        expect(match?.group(1), value, reason: key);
      }
      final reversed = options.iosClientId!.split('.').reversed.join('.');
      expect(info, contains('<string>' + reversed + '</string>'));
      expect(info, contains('<string>cipherwill</string>'));
      expect(
        File('ios/Runner.xcodeproj/project.pbxproj').readAsStringSync(),
        contains('GoogleService-Info.plist in Resources'),
      );
    },
  );

  test('app configuration selects registered defaults on Android and iOS', () {
    try {
      for (final platform in [TargetPlatform.android, TargetPlatform.iOS]) {
        debugDefaultTargetPlatformOverride = platform;
        expect(
          AppConfig.fromEnvironment().firebase,
          platform == TargetPlatform.android
              ? DefaultFirebaseOptions.android
              : DefaultFirebaseOptions.ios,
        );
      }
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });
}
