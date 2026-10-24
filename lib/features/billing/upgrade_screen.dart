// Opens checkout for the current, freshly verified backend account.
// Owns account attribution, route closing and terminal result delivery.
// Does not accept account IDs from links or implement payment processing.
import '../../app/app_icons.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../app/providers.dart';
import '../../shared/ui/error_panel.dart';
import 'billing_refresh.dart';
import 'upgrade_contract.dart';
import 'upgrade_webview.dart';

class UpgradeScreen extends ConsumerStatefulWidget {
  const UpgradeScreen({super.key});
  @override
  ConsumerState<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends ConsumerState<UpgradeScreen> {
  Uri? uri;
  String? error;
  int attempt = 0;
  @override
  void initState() {
    super.initState();
    unawaited(load());
  }

  Future<void> load() async {
    setState(() {
      error = null;
      uri = null;
      attempt++;
    });
    try {
      final uid = ref.read(firebaseProvider).currentUser?.uid;
      final account = await ref.read(apiProvider).account();
      if (!mounted) return;
      if (uid == null || uid != ref.read(firebaseProvider).currentUser?.uid) {
        throw StateError('Account changed.');
      }
      setState(() => uri = upgradeUri(account.toJson()));
    } catch (_) {
      if (mounted) {
        setState(
          () => error =
              'Unable to open checkout. Check your connection and retry.',
        );
      }
    }
  }

  void finish(UpgradeResult result) {
    if (!mounted) return;
    if (context.canPop()) {
      context.pop(result);
    } else {
      showUpgradeResult(context, ref, result);
      context.go('/billing');
    }
  }

  void close() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/billing');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Upgrade to Premium'),
      leading: IconButton(
        tooltip: 'Close checkout',
        onPressed: close,
        icon: const Icon(AppIcons.close),
      ),
    ),
    body: SafeArea(
      child: error != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: ErrorPanel(message: error!, retry: load),
            )
          : uri == null
          ? const Center(child: CircularProgressIndicator())
          : UpgradeWebView(
              key: ValueKey(attempt),
              uri: uri!,
              onResult: finish,
              onRetry: load,
            ),
    ),
  );
}
