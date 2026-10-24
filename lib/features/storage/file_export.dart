// Shares a deliberately decrypted file through the existing native handoff.
// Owns export confirmation, refreshed executor permissions and share cleanup.
// Does not cache plaintext offline or export without the active session lease.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../core/security/temp_cleanup.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import '../executor/executor_repository.dart';
import '../executor/unavailable_access.dart';

Future<void> exportDecryptedFile(
  BuildContext context,
  WidgetRef ref,
  File file,
  String id,
  String? access,
) => perform(context, () async {
  if (!await confirm(context, 'Export a decrypted copy of this file?') ||
      !context.mounted) {
    return;
  }
  try {
    await nativeHandoff(ref, () async {
      final lease = ref.read(sessionProvider.notifier).lease();
      if (access != null) {
        await ExecutorRepository(
          ref.read(apiProvider),
          lease,
        ).authorizedModel(access, id);
      }
      lease.check();
      return SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
    });
  } catch (error) {
    if (access == null ||
        !context.mounted ||
        !returnToSharedWills(context, error)) {
      rethrow;
    }
  } finally {
    await cleanupShareCopies();
  }
});
