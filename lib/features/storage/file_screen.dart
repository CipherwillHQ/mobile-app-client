// Offers authorized native file previews and explicit plaintext export
// Owns temporary file cleanup and retry lifetimes.
// Does not cache downloads for offline use.

import 'dart:io';
import '../../core/security/temp_cleanup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'file_preview.dart';
import 'upload_recovery.dart';
import '../executor/executor_repository.dart';

class FileScreen extends ConsumerStatefulWidget {
  final String id;
  final String? access;
  const FileScreen({super.key, required this.id, this.access});
  @override
  ConsumerState<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends ConsumerState<FileScreen> {
  Directory? temporary;
  File? file;
  String? error;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> cleanup(Directory? directory) async {
    if (directory != null && await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }

  Future<void> load() async {
    if (loading) return;
    loading = true;
    final old = temporary;
    temporary = null;
    await cleanup(old);
    if (!mounted) {
      loading = false;
      return;
    }
    setState(() {
      file = null;
      error = null;
    });
    final service = FileService(
      ref.read(apiProvider),
      ref.read(sessionProvider.notifier).lease(),
    );
    final directory = await (await getTemporaryDirectory()).createTemp(
      'cipherwill_preview_',
    );
    try {
      final value = await service.download(
        widget.id,
        directory,
        access: widget.access,
      );
      if (!mounted) {
        await cleanup(directory);
        return;
      }
      temporary = directory;
      setState(() => file = value);
    } catch (e) {
      await cleanup(directory);
      if (mounted) setState(() => error = e.toString());
    } finally {
      loading = false;
    }
  }

  @override
  void dispose() {
    cleanup(temporary);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'File',
    children: [
      if (error != null) ...[
        Text(error!),
        TextButton(onPressed: load, child: const Text('Retry')),
        if (widget.access == null) UploadRecovery(id: widget.id, saved: load),
      ] else if (file == null)
        const Center(child: CircularProgressIndicator())
      else ...[
        Text(file!.path.split(Platform.pathSeparator).last),
        const SizedBox(height: 20),
        FilePreview(file: file!),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => perform(context, () async {
            if (!await confirm(
              context,
              'Export a decrypted copy of this file?',
            )) {
              return;
            }
            if (!mounted) return;
            try {
              await nativeHandoff(ref, () async {
                final lease = ref.read(sessionProvider.notifier).lease();
                if (widget.access != null) {
                  await ExecutorRepository(
                    ref.read(apiProvider),
                    lease,
                  ).authorizedModel(widget.access!, widget.id);
                }
                lease.check();
                return SharePlus.instance.share(
                  ShareParams(files: [XFile(file!.path)]),
                );
              });
            } finally {
              await cleanupShareCopies();
            }
          }),
          icon: const Icon(Icons.ios_share),
          label: const Text('Export file'),
        ),
      ],
      if (widget.access == null)
        TextButton(
          onPressed: () => perform(context, () async {
            if (!await confirm(context, 'Delete this file?')) return;
            await ref.read(apiProvider).run('DELETE_METAMODEL', {
              'id': widget.id,
            });
            if (context.mounted) Navigator.pop(context);
          }),
          child: const Text('Delete file'),
        ),
    ],
  );
}
