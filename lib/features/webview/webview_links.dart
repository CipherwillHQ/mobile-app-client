// Limits session delivery to Cipherwill's HTTPS origin and maps mobile links.
// Owns shared trust checks and web destinations.
// Does not navigate or expose Firebase credentials.
import '../../shared/cipherwill_links.dart';

bool isCipherwillPage(Uri uri) =>
    uri.scheme == 'https' &&
    uri.host == 'cipherwill.com' &&
    uri.port == 443 &&
    uri.userInfo.isEmpty;

bool isExternalUpgrade(Uri uri) =>
    isCipherwillPage(uri) && {'/upgrade', '/upgrade/'}.contains(uri.path);

Uri webAppUri(Uri uri) => Uri.parse(CipherwillLinks.website).replace(
  path: uri.path == '/' || uri.path.isEmpty ? '/app' : uri.path,
  query: uri.hasQuery ? uri.query : null,
  fragment: uri.hasFragment ? uri.fragment : null,
);

String? mobileLocation(Uri uri) {
  final path = uri.scheme == 'cipherwill'
      ? '/${uri.host}${uri.path}'
      : uri.path;
  if (uri.hasScheme &&
      uri.scheme != 'cipherwill' &&
      (uri.scheme != 'https' ||
          !{
            'cipherwill.com',
            'www.cipherwill.com',
            'auth.cipherwill.com',
          }.contains(uri.host))) {
    return '/app';
  }
  if (uri.queryParameters.containsKey('oobCode') &&
      uri.queryParameters.containsKey('mode')) {
    if (path == '/auth-action' && !uri.hasScheme) return null;
    return Uri(
      path: '/auth-action',
      queryParameters: uri.queryParameters,
    ).toString();
  }
  if (path == '/' || path == '/home' || path == '/auth' || path == '/login') {
    return '/app';
  }
  if (uri.hasScheme) {
    return Uri(path: path, query: uri.hasQuery ? uri.query : null).toString();
  }
  return null;
}
