// Checks real Apple response formatting and bundle-specific store offers.
// Owns listing absence, version/URL validation and unauthenticated requests.
// Does not query Apple, Firebase or a live Cipherwill account.
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_app_update.dart';
import '../../testing/fake_url_launcher.dart';
import 'apple_update_service.dart';
import 'store_update.dart';

class AppleLookupAdapter implements HttpClientAdapter {
  Map<String, Object?> listing = {
    'bundleId': 'com.cipherwill.app',
    'version': '1.1.0',
    'trackViewUrl': 'https://apps.apple.com/in/app/cipherwill/id123456',
  };
  bool empty = false;
  RequestOptions? request;
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      jsonEncode({
        'results': empty ? [] : [listing],
      }),
      200,
      headers: {
        'content-type': ['text/javascript; charset=utf-8'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Dio http;
  late AppleLookupAdapter adapter;
  late AppleUpdateService service;
  setUp(() {
    adapter = AppleLookupAdapter();
    http = Dio()..httpClientAdapter = adapter;
    service = AppleUpdateService(
      http,
      Future.value(updatePackage()),
      country: 'IN',
    );
  });
  tearDown(() => http.close(force: true));
  test('Apple text/javascript JSON finds a newer matching release', () async {
    final offer = await service.check();
    expect(offer?.url.toString(), adapter.listing['trackViewUrl']);
    expect(adapter.request!.uri.host, 'itunes.apple.com');
    expect(adapter.request!.queryParameters, {
      'bundleId': 'com.cipherwill.app',
      'country': 'IN',
    });
    expect(
      adapter.request!.headers.keys.map((key) => key.toLowerCase()),
      isNot(contains('authorization')),
    );
  });
  test(
    'unpublished, different-bundle and current listings have no offer',
    () async {
      adapter.empty = true;
      expect(await service.check(), isNull);
      adapter.empty = false;
      adapter.listing['bundleId'] = 'another.app';
      expect(await service.check(), isNull);
      adapter.listing['bundleId'] = 'com.cipherwill.app';
      for (final version in ['1.0', '0.9.9', 'bad']) {
        adapter.listing['version'] = version;
        expect(await service.check(), isNull);
      }
    },
  );
  test('a store offer must have a trusted HTTPS App Store URL', () async {
    for (final link in [
      'https://example.com/app',
      'https://apps.apple.com.example.com/app',
      'http://apps.apple.com/app',
    ]) {
      adapter.listing['trackViewUrl'] = link;
      expect(await service.check(), isNull);
    }
  });
  test('Update opens the native App Store destination', () async {
    final launcher = FakeUrlLauncher(
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger,
    );
    addTearDown(launcher.dispose);
    final offer = (await service.check())!;
    expect(await service.start(offer), UpdateAction.opened);
    expect(launcher.calls.single.arguments['url'], offer.url.toString());
    expect(launcher.calls.single.arguments['useSafariVC'], false);
  });
}
