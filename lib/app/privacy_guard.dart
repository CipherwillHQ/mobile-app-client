// Covers the application during system prompts and background transitions
// Owns lifecycle locking and account-switch cleanup.
// Does not preserve decrypted screens across a lock.

import 'app_icons.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/security/session_controller.dart';
import '../shared/ui/remote_panel.dart';
import 'providers.dart';
import 'account_gate.dart';

class PrivacyController extends Notifier<bool> {
  @override
  bool build() => false;
  void set(bool value) => state = value;
}

final privacyProvider = NotifierProvider<PrivacyController, bool>(
  PrivacyController.new,
);

class PrivacyGuard extends ConsumerStatefulWidget {
  final Widget child;
  const PrivacyGuard({super.key, required this.child});
  @override
  ConsumerState<PrivacyGuard> createState() => _PrivacyGuardState();
}

class _PrivacyGuardState extends ConsumerState<PrivacyGuard>
    with WidgetsBindingObserver {
  bool visible = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final resumed = state == AppLifecycleState.resumed;
    if (!resumed && !ref.read(privacyProvider)) {
      ref.read(sessionProvider.notifier).lock();
    }
    if (resumed && !ref.read(privacyProvider)) {
      ref.invalidate(accountProvider);
      ref.invalidate(factorsProvider);
    }
    setState(() => visible = resumed);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authStateProvider, (previous, next) {
      if (previous?.value?.uid == next.value?.uid) return;
      ref.read(sessionProvider.notifier).lock();
      ref.invalidate(accountProvider);
      ref.invalidate(preferencesProvider);
      ref.invalidate(factorsProvider);
      ref.invalidate(onboardingProvider);
      ref.invalidate(remoteProvider);
      if (previous?.value != null) {
        unawaited(ref.read(securityProvider).clear());
      }
    });
    return Stack(
      children: [
        widget.child,
        if (!visible || ref.watch(privacyProvider))
          Positioned.fill(
            child: ColoredBox(
              color: Color(0xff003ecb),
              child: Center(
                child: Semantics(
                  label: 'Cipherwill locked',
                  child: Icon(AppIcons.lock, color: Colors.white, size: 56),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
