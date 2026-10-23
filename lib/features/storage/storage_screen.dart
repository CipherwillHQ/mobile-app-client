// Manages encrypted files and folders with native file pickers
// Owns storage navigation, uploads and deletion.
// Does not persist decrypted downloads.
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../core/security/temp_cleanup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../shared/ui/remote_panel.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/paged_list.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'pending_upload.dart';

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

  @override
  void dispose() {
    unawaited(cleanupPickedFiles());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final executor = widget.access != null;
    final vars = {
      'folder_id': widget.folder,
      if (executor) 'access_id': widget.access,
    };
    if (!executor && ref.watch(accountProvider).value?['plan'] == 'free') {
      return const PageFrame(
        title: 'File storage',
        children: [
          Text('File storage requires an existing Premium subscription.'),
        ],
      );
    }
    return PageFrame(
      title: executor ? 'Granted files' : 'File storage',
      actions: executor
          ? null
          : [
              IconButton(
                tooltip: 'Create folder',
                icon: const Icon(Icons.create_new_folder_outlined),
                onPressed: busy
                    ? null
                    : () => perform(context, () async {
                        final name = await prompt(context, 'Folder name');
                        if (name == null) return;
                        await ref.read(apiProvider).run('CREATE_FOLDER', {
                          'name': name,
                          'folder_id': widget.folder,
                        });
                        if (mounted) setState(() => revision++);
                      }),
              ),
              IconButton(
                tooltip: 'Upload file',
                onPressed: busy ? null : upload,
                icon: const Icon(Icons.upload_file),
              ),
            ],
      children: [
        if (!executor)
          RemotePanel(
            operation: 'GET_STORAGE_USED',
            builder: (result) => Text(
              'Storage used: ' + result['getStorageUsed'].toString() + ' bytes',
            ),
          ),
        if (busy) const LinearProgressIndicator(),
        if (pending != null && !busy)
          TextButton.icon(
            onPressed: upload,
            icon: const Icon(Icons.refresh),
            label: Text('Retry saving ' + pending!.name),
          ),
        PagedList(
          key: ValueKey('folders$revision'),
          operation: executor ? 'GET_GRANTED_STORAGE_FOLDERS' : 'GET_FOLDERS',
          field: executor ? 'getGrantedStorageFolders' : 'getFolders',
          itemsField: 'folders',
          variables: vars,
          itemBuilder: (folder) => ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: Text(folder['name']),
            onTap: () => context.push(
              '/storage?folder=' +
                  folder['id'] +
                  (executor ? '&access=' + widget.access! : ''),
            ),
            trailing: executor
                ? null
                : IconButton(
                    tooltip: 'Delete folder',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => perform(context, () async {
                      if (!await confirm(context, 'Delete this folder?')) {
                        return;
                      }
                      await ref.read(apiProvider).run('DELETE_FOLDER', {
                        'id': folder['id'],
                      });
                      if (mounted) setState(() => revision++);
                    }),
                  ),
          ),
        ),
        PagedList(
          key: ValueKey('files$revision'),
          operation: executor ? 'GET_GRANTED_METAMODELS' : 'GET_METAMODELS',
          field: executor ? 'getGrantedMetamodels' : 'getMetamodels',
          itemsField: 'models',
          variables: {...vars, 'type': 'FILE'},
          itemBuilder: (file) => Card(
            child: ListTile(
              leading: const Icon(Icons.insert_drive_file_outlined),
              title: Text(label(asJson(jsonDecode(file['metadata'])))),
              onTap: () => context.push(
                '/file/' +
                    file['id'] +
                    (executor ? '?access=' + widget.access! : ''),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
