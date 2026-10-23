// Provides native backup import and decrypted ZIP sharing
// Owns user disclosures, progress and temporary archive cleanup.
// Does not store persistent backup copies in the app.

import 'dart:io';
import '../../core/security/temp_cleanup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../app/providers.dart';
import '../../app/native_handoff.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/actions.dart';
import '../security/session_controller.dart';
import 'backup_codec.dart';
import 'backup_service.dart';
import '../../shared/ui/guide_panel.dart';
import '../../shared/ui/panel_section.dart';
import '../settings/settings_tabs.dart';

class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});
  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool busy = false;
  String status = '';
  void progress(String value) {
    if (mounted) setState(() => status = value);
  }

  BackupService service() => BackupService(
    ref.read(apiProvider),
    ref.read(sessionProvider.notifier).lease(),
  );
  Future<void> export() async {
    if (!await confirm(
      context,
      'This ZIP contains decrypted text data. Store and share it securely. Files are excluded.',
    )) {
      return;
    }
    if (!mounted) return;
    setState(() => busy = true);
    await perform(context, () async {
      final items = await service().export(progress);
      final temp = await (await getTemporaryDirectory()).createTemp(
        'cipherwill_backup_',
      );
      try {
        final file = File(temp.path + '/Cipherwill-backup.zip');
        await file.writeAsBytes(encodeBackup(items));
        final shared = await nativeHandoff(
          ref,
          () => SharePlus.instance.share(
            ShareParams(
              files: [XFile(file.path)],
              text: 'Cipherwill backup — contains decrypted data',
            ),
          ),
        );
        progress(
          shared.status == ShareResultStatus.success
              ? 'Backup exported.'
              : 'Backup sharing was not confirmed.',
        );
      } finally {
        await temp.delete(recursive: true);
        await cleanupShareCopies();
      }
    });
    if (mounted) setState(() => busy = false);
  }

  Future<void> restore() async {
    final picked = await nativeHandoff(
      ref,
      () => FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip'],
      ),
    );
    if (picked?.files.single.path == null || !mounted) return;
    setState(() => busy = true);
    await perform(context, () async {
      final payload = decodeBackup(
        await File(picked!.files.single.path!).readAsBytes(),
      );
      final counts = await service().restore(payload, progress);
      progress(
        'Restored ' +
            counts.$1.toString() +
            ' items; skipped ' +
            counts.$2.toString() +
            '.',
      );
    });
    if (mounted) setState(() => busy = false);
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Settings',
    tabs: const SettingsTabs(location: '/backup'),
    children: [
      const GuidePanel(
        title: 'Handle with care',
        message:
            'Exported ZIPs contain decrypted text assets. Store and share them securely. Files are excluded.',
        icon: Icons.privacy_tip_outlined,
      ),
      const SizedBox(height: 20),
      PanelSection(
        title: 'Export your vault',
        description: 'A compatible Cipherwill backup of your text assets.',
        children: [
          FilledButton.icon(
            onPressed: busy ? null : export,
            icon: const Icon(Icons.ios_share_rounded),
            label: const Text('Export backup'),
          ),
        ],
      ),
      PanelSection(
        title: 'Restore a backup',
        description:
            'Import versions 0.0.1 or 0.0.2. Existing readable items and beneficiary exclusions are preserved.',
        children: [
          OutlinedButton.icon(
            onPressed: busy ? null : restore,
            icon: const Icon(Icons.restore_rounded),
            label: const Text('Choose backup ZIP'),
          ),
        ],
      ),
      if (busy) const LinearProgressIndicator(),
      Semantics(liveRegion: true, child: Text(status)),
    ],
  );
}
