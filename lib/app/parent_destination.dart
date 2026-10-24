// Resolves a familiar parent when a mobile page opens without history.
// Owns owner, executor and Settings hierarchy for native Back navigation.
// Does not authorize destinations or skip unsaved-change guards.
import '../features/executor/executor_location.dart';

String? parentDestination(String location) {
  final uri = Uri.parse(location);
  final path = uri.path;
  final parts = uri.pathSegments;
  if (['/home', '/vault', '/people', '/platform'].contains(path)) return null;
  if (parts.firstOrNull == 'item') {
    if (parts.last == 'sharing') {
      if (uri.queryParameters['type'] == 'FILE') return '/file/${parts[1]}';
      return '/item/${parts[1]}?type=${uri.queryParameters['type'] ?? 'NOTE'}';
    }
    return '/vault/${uri.queryParameters['type'] ?? 'NOTE'}';
  }
  if (parts.firstOrNull == 'executor') {
    if (parts.length == 1) return '/home';
    if (parts.length == 2) return '/executor';
    return executorWillLocation(parts[1]);
  }
  if (parts.firstOrNull == 'file' || path == '/storage') {
    final access = uri.queryParameters['access'];
    if (parts.firstOrNull == 'file' || uri.queryParameters['folder'] != null) {
      return Uri(
        path: '/storage',
        queryParameters: access == null ? null : {'access': access},
      ).toString();
    }
    return access == null ? '/vault' : executorWillLocation(access);
  }
  if (path.startsWith('/vault/')) return '/vault';
  if (path.startsWith('/beneficiaries/')) return '/beneficiaries';
  if (path == '/people/add') {
    return uri.queryParameters['friend'] == 'true'
        ? '/friends'
        : '/beneficiaries';
  }
  if (path == '/granted-access') return '/home';
  if (['/beneficiaries', '/friends'].contains(path)) {
    return '/people';
  }
  if (['/profile', '/backup', '/usage', '/account-actions'].contains(path)) {
    return '/settings';
  }
  if (['/timeline', '/billing', '/factors', '/settings'].contains(path)) {
    return '/platform';
  }
  if (path == '/upgrade') return '/billing';
  return '/home';
}
