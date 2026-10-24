// Compares installed and published App Store versions.
// Owns short-version normalization and semantic release ordering.
// Does not treat build metadata or malformed versions as a new release.
import 'package:pub_semver/pub_semver.dart';

Version? parseStoreVersion(String value) {
  final match = RegExp(
    r'^(\d+)(?:\.(\d+))?(?:\.(\d+))?(-[0-9A-Za-z.-]+)?(?:\+[0-9A-Za-z.-]+)?$',
  ).firstMatch(value.trim());
  if (match == null) return null;
  try {
    return Version.parse(
      '${match[1]}.${match[2] ?? '0'}.${match[3] ?? '0'}${match[4] ?? ''}',
    );
  } on FormatException {
    return null;
  }
}

bool hasNewerStoreVersion(String installed, String published) {
  final current = parseStoreVersion(installed);
  final available = parseStoreVersion(published);
  return current != null && available != null && available > current;
}
