// Checks staged encrypted saves and confirmation recovery.
// Owns incomplete-save rejection and commit status handling.
// Does not upload real data or contact services.
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../security/session_controller.dart';
import 'upload_service.dart';

void main() {
  test('incomplete upload status is never reported as a saved item', () async {
    final api = FakeApi(
      (name, args) async => {
        'commitUploadSession': {'status': 'POD_UPLOADED'},
      },
    );
    await expectLater(
      UploadService(api).commit('session', VaultLease(null, () {})),
      throwsStateError,
    );
    api.dispose();
  });
  test(
    'lost save result resumes a completed session without duplicate writes',
    () async {
      final api = FakeApi(
        (name, args) async => {
          'getUploadPodSession': {'id': 'session', 'status': 'COMPLETED'},
        },
      );
      expect(
        await UploadService(api).resume('item', VaultLease(null, () {})),
        true,
      );
      expect(api.calls.map((call) => call.$1), ['GET_UPLOAD_POD_SESSION']);
      api.dispose();
    },
  );
  test(
    'keys uploaded but commit unconfirmed is resumed and confirmed',
    () async {
      final api = FakeApi(
        (name, args) async => name == 'GET_UPLOAD_POD_SESSION'
            ? {
                'getUploadPodSession': {
                  'id': 'session',
                  'status': 'KEYS_UPLOADED',
                },
              }
            : {
                'commitUploadSession': {'status': 'COMPLETED'},
              },
      );
      expect(
        await UploadService(api).resume('item', VaultLease(null, () {})),
        true,
      );
      expect(api.calls.last.$1, 'commitUploadSession');
      api.dispose();
    },
  );
}
