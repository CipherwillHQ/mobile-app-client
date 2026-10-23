// Exercises interrupted file transfers and preserved beneficiary exclusions.
// Owns same-ID retries, ciphertext transfer and completed-session confirmation.
// Does not use native pickers, cloud storage or production data.
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../../core/crypto/factor_key.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'pending_upload.dart';

class TestTransfers implements HttpClientAdapter {
  int attempts = 0;
  final bool interrupt;
  TestTransfers({this.interrupt = false});
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) async {
    await stream?.drain<void>();
    if (interrupt && ++attempts == 1) {
      throw DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
      );
    }
    return ResponseBody.fromString('', 200);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.flutter.io/path_provider');
  late Directory temporary;
  setUp(() async {
    temporary = await Directory.systemTemp.createTemp(
      'cipherwill_transfer_test_',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (_) async => temporary.path);
  });
  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    expect(
      temporary.absolute.path.startsWith(Directory.systemTemp.absolute.path),
      true,
    );
    await temporary.delete(recursive: true);
  });
  test(
    'interrupted retry keeps the original identity and skips excluded recipient keys',
    () async {
      var committed = false;
      final capsule = FactorKey.fromPrivate('2');
      final api = FakeApi((name, args) async {
        switch (name) {
          case 'GET_UPLOAD_POD_SESSION':
            return {
              'getUploadPodSession': committed
                  ? {'id': 'session', 'status': 'COMPLETED'}
                  : null,
            };
          case 'CREATE_METAMODEL':
            return {
              'createMetamodel': {
                'id': args['id'],
                'ignored_beneficiaries': ['excluded'],
              },
            };
          case 'GET_FACTORS':
            return {'getFactors': []};
          case 'GET_BENEFICIARY_FACTORS':
            return {
              'getBeneficiaryFactors': [
                {
                  'beneficiary_id': 'excluded',
                  'publicKey': capsule.publicKey,
                  'factors': [],
                },
              ],
            };
          case 'createUploadPodSession':
            return {
              'createUploadPodSession': {
                'id': 'session',
                'presigned_upload_url': 'https://storage.invalid/upload',
              },
            };
          case 'commitUploadSession':
            committed = true;
            return {
              'commitUploadSession': {'status': 'COMPLETED'},
            };
          default:
            return {};
        }
      });
      final transfers = TestTransfers(interrupt: true);
      api.transfers.httpClientAdapter = transfers;
      final file = File(temporary.path + '/original.txt');
      await file.writeAsString('Unicode 🔐 content');
      final pending = PendingUpload(file, 'original.txt');
      final service = FileService(api, VaultLease(null, () {}));
      await expectLater(pending.save(service), throwsA(isA<DioException>()));
      expect(committed, false);
      await pending.save(service);
      expect(committed, true);
      await pending.save(service);
      final creates = api.calls.where((c) => c.$1 == 'CREATE_METAMODEL');
      expect(creates.map((c) => c.$2['id']).toSet(), {pending.id});
      expect(creates.length, 2);
      final keys =
          api.calls.firstWhere((c) => c.$1 == 'uploadSessionKeys').$2['keys']
              as List;
      expect(keys.length, 1);
      expect(keys.single['beneficiary_id'], 'null');
      expect(transfers.attempts, 2);
      expect(await temporary.list().where((e) => e is Directory).isEmpty, true);
      api.dispose();
    },
  );
}
