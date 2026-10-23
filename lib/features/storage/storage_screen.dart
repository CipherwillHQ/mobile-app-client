// Manages encrypted files and folders with native file pickers.
// Owns storage navigation, upload recovery and deletion.
// Does not persist decrypted downloads or allow executor edits.
import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/security/temp_cleanup.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../../shared/ui/empty_state.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/section_heading.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'pending_upload.dart';
import 'storage_lists.dart';

class StorageScreen extends ConsumerStatefulWidget {
  final String? folder;
  final String? access;
  const StorageScreen({super.key, this.folder, this.access});
  @override
  ConsumerState<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends ConsumerState<StorageScreen> {
  bool busy = false;
  int revision = 0;
  PendingUpload? pending;
  Future<void> upload() async {
    if (busy) return;
    if (pending == null) {
      final picked = await nativeHandoff(
        ref,
        () => FilePicker.platform.pickFiles(),
      );
      if (picked == null || picked.files.single.path == null || !mounted) {
        return;
      }
      pending = PendingUpload(
        File(picked.files.single.path!),
        picked.files.single.name,
        folder: widget.folder,
      );
    }
    setState(() => busy = true);
    await perform(context, () async {
      await pending!.save(
        FileService(
          ref.read(apiProvider),
          ref.read(sessionProvider.notifier).lease(),
        ),
      );
      pending = null;
    }, success: 'Encrypted file saved.');
    if (mounted) {
      setState(() {
        busy = false;
        revision++;
      });
    }
  }

  Future<void> folder() => perform(context, () async {
    final name = await prompt(context, 'Folder name');
    if (name == null) return;
    await ref.read(apiProvider).run('CREATE_FOLDER', {
      'name': name,
      'folder_id': widget.folder,
    });
    if (mounted) setState(() => revision++);
  });

  @override
  void dispose() {
    unawaited(cleanupPickedFiles());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final executor = widget.access != null;
    if (!executor && ref.watch(accountProvider).value?['plan'] == 'free') {
      return const PageFrame(
        title: 'File Storage',
        children: [
          EmptyState(
            title: 'Premium file storage',
            message: 'File storage requires an existing Premium subscription.',
            icon: Icons.folder_outlined,
          ),
        ],
      );
    }
    return PageFrame(
      title: executor ? 'Granted files' : 'File Storage',
      subtitle: widget.folder != null ? 'Inside your selected folder' : null,
      actions: executor
          ? null
          : [
              IconButton(
                tooltip: 'Create folder',
                onPressed: busy ? null : folder,
                icon: const Icon(Icons.create_new_folder_outlined),
              ),
              IconButton(
                tooltip: 'Upload file',
                onPressed: busy ? null : upload,
                icon: const Icon(Icons.upload_file_outlined),
              ),
            ],
      children: [
        if (executor)
          const StatusPill('Read-only access', icon: Icons.visibility_outlined),
        if (busy)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: LinearProgressIndicator(),
          ),
        if (pending != null && !busy)
          OutlinedButton.icon(
            onPressed: upload,
            icon: const Icon(Icons.refresh),
            label: Text('Retry saving ' + pending!.name),
          ),
        const SectionHeading('Folders'),
        StorageFolders(
          key: ValueKey('folders$revision'),
          folder: widget.folder,
          access: widget.access,
          changed: () => setState(() => revision++),
        ),
        const SectionHeading('Files'),
        StorageFiles(
          key: ValueKey('files$revision'),
          folder: widget.folder,
          access: widget.access,
        ),
      ],
    );
  }
}
