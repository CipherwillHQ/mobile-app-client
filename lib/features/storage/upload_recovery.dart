// Resumes a previously created file item after an interrupted upload.
// Owns online metadata checks and reselecting the original file.
// Does not create a second item or overwrite a committed storage pod.
import '../../app/app_icons.dart';
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/native_handoff.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import '../vault/upload_service.dart';
import 'file_service.dart';
import 'pending_upload.dart';

class UploadRecovery extends ConsumerStatefulWidget {
  final String id;
  final VoidCallback saved;
  const UploadRecovery({super.key, required this.id, required this.saved});
  @override
  ConsumerState<UploadRecovery> createState() => _UploadRecoveryState();
}

class _UploadRecoveryState extends ConsumerState<UploadRecovery> {
  bool busy = false;
  PendingUpload? pending;
  Future<void> recover() async {
    if (busy) return;
    setState(() => busy = true);
    await perform(context, () async {
      final api = ref.read(apiProvider);
      final lease = ref.read(sessionProvider.notifier).lease();
      if (await UploadService(api).resume(widget.id, lease)) {
        widget.saved();
        return;
      }
      final model = asJson(
        (await api.run('GET_METAMODEL', {'id': widget.id}))['getMetamodel'],
      );
      lease.check();
      final metadata = asJson(jsonDecode(model['metadata']));
      if (pending == null) {
        final picked = await nativeHandoff(
          ref,
          () => FilePicker.platform.pickFiles(),
        );
        if (!mounted || picked?.files.single.path == null) return;
        if (picked!.files.single.name != metadata['title']) {
          throw StateError(
            'Select the original file named ' +
                metadata['title'].toString() +
                '.',
          );
        }
        pending = PendingUpload(
          File(picked.files.single.path!),
          picked.files.single.name,
          id: widget.id,
          folder: model['folder_id'],
        );
      }
      await pending!.save(FileService(api, lease));
      if (mounted) widget.saved();
    });
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => TextButton.icon(
    onPressed: busy ? null : recover,
    icon: const Icon(AppIcons.upload),
    label: Text(busy ? 'Checking upload…' : 'Resume interrupted upload'),
  );
}
