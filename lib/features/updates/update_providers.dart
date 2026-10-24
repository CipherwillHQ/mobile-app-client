// Selects the native store updater without depending on account startup.
// Owns platform selection and a separate unauthenticated Apple HTTP client.
// Does not initialize Firebase or use the Cipherwill GraphQL transport.
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/app_package.dart';
import 'apple_update_service.dart';
import 'play_update_service.dart';
import 'store_update.dart';

final appUpdateServiceProvider = Provider<AppUpdateService>((ref) {
  if (Platform.isAndroid) {
    return PlayUpdateService(ref.watch(appPackageProvider.future));
  }
  if (Platform.isIOS) {
    final http = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    ref.onDispose(() => http.close(force: true));
    final country =
        WidgetsBinding.instance.platformDispatcher.locale.countryCode;
    return AppleUpdateService(
      http,
      ref.watch(appPackageProvider.future),
      country: country ?? 'US',
    );
  }
  return const NoStoreUpdates();
});
