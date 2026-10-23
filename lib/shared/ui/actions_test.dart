// Checks action feedback reflects cancellation and actual persistence failures.
// Owns snackbar behavior for the shared action runner.
// Does not simulate backend or biometric success.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'actions.dart';

void main() {
  testWidgets('cancelled actions do not display a success message', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => perform(context, () async {
                throw const ActionCancelled();
              }, success: 'Saved'),
              child: const Text('Run'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Run'));
    await tester.pump();
    expect(find.text('Saved'), findsNothing);
  });
  testWidgets('failed actions display failure and no success message', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => perform(context, () async {
                throw StateError('Save failed');
              }, success: 'Saved'),
              child: const Text('Run'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Run'));
    await tester.pump();
    expect(find.textContaining('Save failed'), findsOneWidget);
    expect(find.text('Saved'), findsNothing);
  });
}
