// Bootstraps the configured Firebase project and native Cipherwill app
// Owns startup validation and privacy-safe crash reporting.
// Does not embed server secrets or unlocked vault data.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/cipherwill_app.dart';
import 'app/providers.dart';
import 'features/updates/app_update_host.dart';
import 'shared/ui/app_notice.dart';
import 'core/config/app_config.dart';
import 'core/config/crash_reporting.dart';
import 'core/security/temp_cleanup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig.fromEnvironment();
  try {
    config.validate();
    await Firebase.initializeApp(options: config.firebase);
    await cleanupTemporaryFiles();
  } catch (_) {
    runApp(
      ProviderScope(
        child: MaterialApp(
          builder: (context, child) =>
              AppNoticeHost(child: AppUpdateHost(child: child!)),
          home: const Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Cipherwill could not start. Check this build’s Firebase and API configuration, then restart.',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return;
  }
  void start() => runApp(
    ProviderScope(
      overrides: [configProvider.overrideWithValue(config)],
      child: const CipherwillApp(),
    ),
  );
  if (config.sentryDsn.isEmpty) {
    start();
    return;
  }
  await SentryFlutter.init((options) {
    options.dsn = config.sentryDsn;
    options.environment = config.environment;
    options.sendDefaultPii = false;
    options.tracesSampleRate = 0;
    options.beforeSend = redactCrash;
    options.beforeBreadcrumb = (_, _) => null;
    options.enableAutoSessionTracking = false;
    options.attachScreenshot = false;
    options.enableNativeCrashHandling = false;
    options.enableAutoNativeBreadcrumbs = false;
    options.enableWatchdogTerminationTracking = false;
    options.enableAutoPerformanceTracing = false;
    options.enableUserInteractionBreadcrumbs = false;
    options.enableNativeTraceSync = false;
  }, appRunner: start);
}
