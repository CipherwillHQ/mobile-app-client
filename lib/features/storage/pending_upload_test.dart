// Checks lost-response storage recovery uses the original item identity.
// Owns retry deduplication before any native picker or file transfer.
// Does not upload files or require platform storage plugins.
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import '../../testing/fake_api.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'pending_upload.dart';

void main() {
  test(
    'a completed upload can be confirmed repeatedly without duplicate writes',
    () async {
      final api = FakeApi(
        (name, args) async => {
          'getUploadPodSession': {'id': 'session', 'status': 'COMPLETED'},
        },
      );
      final upload = PendingUpload(File('original.txt'), 'original.txt');
      final service = FileService(api, VaultLease(null, () {}));
      await upload.save(service);
      await upload.save(service);
      expect(api.calls.map((c) => c.$1), [
        'GET_UPLOAD_POD_SESSION',
        'GET_UPLOAD_POD_SESSION',
      ]);
      expect(api.calls.map((c) => c.$2['ref_id']).toSet(), {upload.id});
      api.dispose();
    },
  );
  test(
    'restoring an interrupted item retains the caller supplied identity',
    () {
      final upload = PendingUpload(
        File('original.txt'),
        'original.txt',
        id: 'file_existing',
      );
      expect(upload.id, 'file_existing');
    },
  );
}
