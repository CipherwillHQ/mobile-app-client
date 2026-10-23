// Checks native handoff validation waits until the app is visible again.
// Owns foreground observation and resumed-state regression scenarios.
// Does not open another application or approve authentication.
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'foreground.dart';

void main() {
  testWidgets('a handoff stays pending while the destination app is active', (
    tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    var returned = false;
    final future = waitForForeground().then((_) => returned = true);
    await tester.pump(const Duration(milliseconds: 201));
    expect(returned, false);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await future;
    expect(returned, true);
  });
  testWidgets('an already visible app does not need another lifecycle event', (
    tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    var returned = false;
    final future = waitForForeground().then((_) => returned = true);
    await tester.pump(const Duration(milliseconds: 201));
    await future;
    expect(returned, true);
  });
}
