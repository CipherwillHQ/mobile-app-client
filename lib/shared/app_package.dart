// Loads installed native application metadata for About and store updates.
// Owns the shared package identity, version and build-number provider.
// Does not infer installed versions from release configuration.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final appPackageProvider = FutureProvider<PackageInfo>(
  (ref) => PackageInfo.fromPlatform(),
);
