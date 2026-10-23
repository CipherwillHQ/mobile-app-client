// Displays freshly authorized decrypted items in a read-only screen
// Owns masked fields and native rich notes.
// Does not edit or restore donor assets.
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/page_frame.dart';
import '../../shared/ui/asset_fields.dart';
import '../security/session_controller.dart';
import '../vault/categories.dart';
import '../notes/rich_note_editor.dart';
import 'executor_repository.dart';
import '../../shared/ui/status_pill.dart';
import '../../shared/ui/loading_panel.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/panel_section.dart';

class GrantedItemScreen extends ConsumerStatefulWidget {
  final String access;
  final String id;
  const GrantedItemScreen({super.key, required this.access, required this.id});
  @override
  ConsumerState<GrantedItemScreen> createState() => _GrantedItemScreenState();
}

class _GrantedItemScreenState extends ConsumerState<GrantedItemScreen> {
  (Json, Json)? item;
  String? error;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    setState(() {
      item = null;
      error = null;
    });
    try {
      final result = await ExecutorRepository(
        ref.read(apiProvider),
        ref.read(sessionProvider.notifier).lease(),
      ).read(widget.access, widget.id);
      if (mounted) setState(() => item = result);
    } catch (_) {
      if (mounted) {
        setState(
          () => error = 'This item cannot be opened. Access may have changed.',
        );
      }
    }
  }

  @override
  void dispose() {
    item = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageFrame(
    title: 'Granted item',
    children: [
      const StatusPill('Read-only access', icon: Icons.visibility_outlined),
      const SizedBox(height: 16),
      if (error != null) ...[
        ErrorPanel(message: error!, retry: load),
      ] else if (item == null)
        const LoadingPanel()
      else ...[
        Text(
          label(asJson(jsonDecode(item!.$1['metadata']))),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 20),
        if (item!.$1['type'] == 'NOTE')
          RichNoteEditor(
            content: item!.$2['content'] ?? '',
            onChanged: (_) {},
            readOnly: true,
          )
        else
          PanelSection(
            title: 'Vault contents',
            children: [
              AssetFields(
                fields: categoryFor(item!.$1['type']).fields,
                initial: item!.$2,
                onChanged: (_) {},
                readOnly: true,
              ),
            ],
          ),
      ],
    ],
  );
}
