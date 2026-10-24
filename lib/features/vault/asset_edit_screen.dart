// Edits encrypted text assets and serializes note autosaves
// Owns draft state, queued saves and commit feedback.
// Does not persist plaintext drafts or report failed saves as saved.
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../shared/ui/app_notice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/navigate_back.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/actions.dart';
import 'asset_editor_view.dart';
import 'asset_item_actions.dart';
import '../security/session_controller.dart';
import 'categories.dart';
import 'vault_repository.dart';
import 'upload_service.dart';

class AssetEditScreen extends ConsumerStatefulWidget {
  final String id;
  final String type;
  final bool newItem;
  const AssetEditScreen({
    super.key,
    required this.id,
    required this.type,
    this.newItem = false,
  });
  @override
  ConsumerState<AssetEditScreen> createState() => _AssetEditScreenState();
}

class _AssetEditScreenState extends ConsumerState<AssetEditScreen> {
  final form = GlobalKey<FormState>();
  final title = TextEditingController();
  Json? initial;
  Json draft = {};
  String? error;
  String status = 'Saved';
  Timer? timer;
  bool saving = false;
  bool pending = false;
  bool discard = false;
  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> leave() async {
    if (!await confirm(
          context,
          'This item has unsaved changes. Leave without saving?',
        ) ||
        !mounted) {
      return;
    }
    close();
  }

  Future<void> options() async {
    if (await assetItemOptions(context, ref, widget.id, widget.type) &&
        mounted) {
      close();
    }
  }

  void close() {
    setState(() => discard = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) navigateBack(context, fallback: '/vault/${widget.type}');
    });
  }

  Future<void> checkPending() => perform(context, () async {
    await UploadService(
      ref.read(apiProvider),
    ).resume(widget.id, ref.read(sessionProvider.notifier).lease());
    await load();
  });

  @override
  void dispose() {
    timer?.cancel();
    title.dispose();
    initial = null;
    draft.clear();
    super.dispose();
  }

  VaultRepository repository() => VaultRepository(
    ref.read(apiProvider),
    ref.read(sessionProvider.notifier).lease(),
  );
  Future<void> load() async {
    try {
      final repo = repository();
      final metadata = await repo.metadata(widget.id);
      final content = widget.newItem
          ? <String, dynamic>{}
          : await repo.read(widget.id, categoryFor(widget.type));
      if (!mounted) return;
      setState(() {
        title.text = label(asJson(jsonDecode(metadata['metadata'])));
        initial = content;
        draft = {...content};
        error = null;
        status = widget.newItem ? 'Not saved' : 'Saved';
      });
    } catch (e) {
      if (mounted) setState(() => error = e.toString());
    }
  }

  void changed(Json value) {
    draft = value;
    if (saving) pending = true;
    setState(() => status = 'Not saved');
    if (widget.type == 'NOTE') {
      timer?.cancel();
      timer = Timer(const Duration(seconds: 3), save);
    }
  }

  Future<void> save() async {
    if (!form.currentState!.validate()) return;
    if (saving) {
      pending = true;
      return;
    }
    saving = true;
    try {
      do {
        pending = false;
        final value = {...draft};
        final currentTitle = title.text;
        setState(() => status = 'Saving…');
        await repository().save(
          widget.id,
          categoryFor(widget.type),
          value,
          currentTitle,
        );
        if (!mounted) return;
        setState(() => status = pending ? 'Not saved' : 'Saved');
      } while (pending);
    } catch (e) {
      if (mounted) setState(() => status = 'Save failed. Retry.');
      if (mounted) {
        showNotice(context, e.toString(), error: true);
      }
    } finally {
      if (mounted) setState(() => saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => AssetEditorView(
    category: categoryFor(widget.type),
    form: form,
    title: title,
    initial: initial,
    draft: draft,
    error: error,
    status: status,
    saving: saving,
    canLeave: discard || status == 'Saved' || initial == null,
    leave: leave,
    save: save,
    options: options,
    retry: load,
    checkPending: checkPending,
    changed: changed,
  );
}
