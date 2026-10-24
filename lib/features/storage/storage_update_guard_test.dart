// Verifies incomplete uploads prevent leaving for an application update.
// Owns picker simulation and pending-upload recovery regression coverage.
// Does not read private files or send bytes to cloud storage.
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/app_icons.dart';
import '../../app/providers.dart';
import '../../testing/fake_api.dart';
import '../../testing/fake_app_update.dart';
import '../../testing/fake_auth.dart';
import '../updates/update_test_app.dart';
import 'pending_upload_row.dart';
import 'storage_screen.dart';

class UpdateFilePicker extends FilePicker {
  @override
  Future<FilePickerResult?> pickFiles({
    String? dialogTitle,
    String? initialDirectory,
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = false,
    int compressionQuality = 0,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
    bool lockParentWindow = false,
    bool readSequential = false,
  }) async => FilePickerResult([
    PlatformFile(
      name: 'will.pdf',
      path: 'cipherwill_nonexistent_upload_test/will.pdf',
      size: 10,
    ),
  ]);
  @override
  Future<bool?> clearTemporaryFiles() async => true;
}

void main() {
  testWidgets('interrupted upload keeps its retry row and blocks Update', (
    tester,
  ) async {
    final api = FakeApi((name, variables) async {
      if (name == 'GET_UPLOAD_POD_SESSION') {
        throw StateError('Upload check interrupted.');
      }
      return {
        'getFactors': [],
        'getFolders': {'folders': [], 'has_more': false},
        'getMetamodels': {'models': [], 'has_more': false},
      };
    });
    addTearDown(api.dispose);
    FilePicker.platform = UpdateFilePicker();
    final updates = FakeAppUpdates();
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          apiProvider.overrideWithValue(api),
          firebaseProvider.overrideWithValue(FakeAuth()),
          accountProvider.overrideWith((ref) async => {'plan': 'premium'}),
        ],
        child: UpdateTestApp(service: updates, home: const StorageScreen()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(AppIcons.add));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Upload file'));
    await tester.pumpAndSettle();
    expect(find.byType(PendingUploadRow), findsOneWidget);
    expect(find.text('Save incomplete'), findsOneWidget);
    await tester.tap(find.text('Update'));
    await tester.pumpAndSettle();
    expect(updates.starts, 0);
    expect(find.text('Save your changes before updating.'), findsOneWidget);
    expect(find.byType(PendingUploadRow), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
