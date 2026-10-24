// Opens live support with a fresh, account-bound backend identity.
// Owns account lookup, retry attempts and native Back navigation.
// Does not send chat messages or grant access to vault data.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app/providers.dart';
import '../../app/navigation_destinations.dart';
import '../../app/navigate_back.dart';
import '../../core/api/json_values.dart';
import '../../shared/ui/error_panel.dart';
import '../../shared/ui/page_back_scope.dart';
import '../../shared/ui/page_header.dart';
import 'support_chat_webview.dart';

class SupportChatScreen extends ConsumerStatefulWidget {
  const SupportChatScreen({super.key});
  @override
  ConsumerState<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends ConsumerState<SupportChatScreen> {
  Json? account;
  String? error;
  int attempt = 0;
  @override
  void initState() {
    super.initState();
    unawaited(load());
  }

  Future<void> load() async {
    setState(() {
      account = null;
      error = null;
      attempt++;
    });
    try {
      final uid = ref.read(firebaseProvider).currentUser?.uid;
      final current = await ref.read(apiProvider).account();
      if (!mounted) return;
      if (uid == null || uid != ref.read(firebaseProvider).currentUser?.uid) {
        throw StateError('Account changed.');
      }
      setState(() => account = current.toJson());
    } catch (_) {
      if (mounted) {
        setState(
          () => error =
              'Unable to open support. Check your connection and retry.',
        );
      }
    }
  }

  void close() {
    if (mounted) navigateBack(context, fallback: '/settings');
  }

  @override
  Widget build(BuildContext context) => PageBackScope(
    parent: '/settings',
    child: Scaffold(
      appBar: const PageHeader(
        title: supportChatTitle,
        parent: '/settings',
        focused: true,
      ),
      body: SafeArea(
        top: false,
        child: error != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(22),
                child: ErrorPanel(message: error!, retry: load),
              )
            : account == null
            ? const Center(child: CircularProgressIndicator())
            : SupportChatWebView(
                key: ValueKey(attempt),
                account: account!,
                onRetry: load,
                onClose: close,
              ),
      ),
    ),
  );
}
