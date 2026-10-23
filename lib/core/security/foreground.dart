// Waits for native handoffs to return control to the visible app.
// Owns lifecycle observation and observer cleanup.
// Does not authenticate the account or expose vault contents.
import 'dart:async';
import 'package:flutter/widgets.dart';

class ForegroundWait extends WidgetsBindingObserver {
  final completed = Completer<void>();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !completed.isCompleted) {
      completed.complete();
    }
  }
}

Future<void> waitForForeground() async {
  // Chooser selection can complete before the destination app pauses Flutter.
  await Future<void>.delayed(const Duration(milliseconds: 200));
  final binding = WidgetsBinding.instance;
  if (binding.lifecycleState == null ||
      binding.lifecycleState == AppLifecycleState.resumed) {
    return;
  }
  final observer = ForegroundWait();
  binding.addObserver(observer);
  try {
    await observer.completed.future;
  } finally {
    binding.removeObserver(observer);
  }
}
