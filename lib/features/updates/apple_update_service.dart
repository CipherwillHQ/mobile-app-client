// Looks up the published iOS version and opens its App Store page.
// Owns bundle matching, version comparison and trusted store destinations.
// Does not share Firebase tokens or Cipherwill API headers with Apple.
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'store_link.dart';
import 'store_update.dart';
import 'store_version.dart';

class AppleUpdateService implements AppUpdateService {
  final Dio http;
  final Future<PackageInfo> package;
  final String country;
  AppleUpdateService(this.http, this.package, {required this.country});

  @override
  Future<StoreUpdate?> check() async {
    final installed = await package;
    final response = await http.get<String>(
      'https://itunes.apple.com/lookup',
      queryParameters: {'bundleId': installed.packageName, 'country': country},
      options: Options(responseType: ResponseType.plain),
    );
    // Apple's JSON response is served as text/javascript.
    final data = jsonDecode(response.data ?? '{}');
    if (data is! Map || data['results'] is! List) return null;
    for (final result in data['results'] as List) {
      if (result is! Map || result['bundleId'] != installed.packageName) {
        continue;
      }
      final version = result['version'];
      final link = result['trackViewUrl'];
      if (version is! String || link is! String) continue;
      final url = Uri.tryParse(link);
      if (url == null ||
          url.scheme != 'https' ||
          !{'apps.apple.com', 'itunes.apple.com'}.contains(url.host) ||
          !hasNewerStoreVersion(installed.version, version)) {
        continue;
      }
      return StoreUpdate(url);
    }
    return null;
  }

  @override
  Future<UpdateAction> start(StoreUpdate update) => openStoreUpdate(update);
}
