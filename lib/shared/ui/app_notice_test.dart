// Checks notifications survive navigation and remain dismissible.
// Owns success/failure feedback across disappearing route contexts.
// Does not call backend APIs or display private account data.
import '../../app/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'app_notice.dart';
import 'actions.dart';

void main() {
  testWidgets('feedback stays visible after the source route closes', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (_, child) => AppNoticeHost(child: child!),
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => Builder(
                    builder: (route) => Scaffold(
                      body: TextButton(
                        onPressed: () => perform(route, () async {
                          Navigator.pop(route);
                          await Future<void>.delayed(Duration.zero);
                        }, success: 'Person added.'),
                        child: const Text('Complete'),
                      ),
                    ),
                  ),
                ),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Complete'));
    await tester.pumpAndSettle();
    expect(find.text('Person added.'), findsOneWidget);
    expect(find.text('Open'), findsOneWidget);
    await tester.tap(find.byIcon(AppIcons.close));
    await tester.pumpAndSettle();
    expect(find.text('Person added.'), findsNothing);
    await tester.pumpWidget(const SizedBox());
  });
  testWidgets('failed actions show an error popup and no success', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (_, child) => AppNoticeHost(child: child!),
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => perform(context, () async {
                throw StateError('Retry saving');
              }, success: 'Saved'),
              child: const Text('Run'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Run'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Retry saving'), findsOneWidget);
    expect(find.text('Saved'), findsNothing);
    expect(find.byIcon(AppIcons.error), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
  });
}
