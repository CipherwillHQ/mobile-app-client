// Offers authorized native file previews and explicit plaintext export
// Owns temporary file cleanup and retry lifetimes.
// Does not cache downloads for offline use.

import '../../app/app_icons.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../app/providers.dart';
import '../../shared/ui/page_frame.dart';
import '../security/session_controller.dart';
import 'file_service.dart';
import 'file_preview.dart';
import 'upload_recovery.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/loading_panel.dart';
import '../../shared/ui/error_panel.dart';
import 'file_details.dart';
import 'file_options.dart';
import 'file_export.dart';

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
    actions: widget.access == null ? [FileOptions(id: widget.id)] : null,
    footer: file == null
        ? null
        : FilledButton.icon(
            onPressed: () => exportDecryptedFile(
              context,
              ref,
              file!,
              widget.id,
              widget.access,
            ),
            icon: const Icon(AppIcons.share),
            label: const Text('Export file'),
          ),
    children: [
      if (widget.access != null)
        const StatusPill('Read-only access', icon: AppIcons.reveal),
      if (error != null) ...[
        ErrorPanel(
          message:
              'The file could not be opened. Retry or check a pending upload.',
          retry: load,
        ),
        if (widget.access == null) UploadRecovery(id: widget.id, saved: load),
      ] else if (file == null)
        const LoadingPanel()
      else ...[
        if (widget.access == null)
          FileDetails(id: widget.id)
        else
          Text(
            file!.path.split(Platform.pathSeparator).last,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        const SizedBox(height: 20),
        const GuidePanel(
          title: 'Exporting creates a decrypted copy',
          message:
              'Choose a trusted destination when saving or sharing this file.',
          icon: AppIcons.share,
        ),
        const SizedBox(height: 16),
        FilePreview(file: file!),
      ],
    ],
  );
}
