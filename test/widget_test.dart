// Verifies the native navigation remains usable at large text sizes.
// Owns a lightweight accessible shell smoke test.
// Does not require Firebase or native authentication plugins.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:cipherwill/app/navigation_shell.dart';
import 'package:cipherwill/app/theme.dart';

void main() {
  testWidgets('four accessible tabs render with large text in both themes', (
    tester,
  ) async {
    for (final brightness in Brightness.values) {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => const NavigationShell(
              location: '/home',
              child: Center(child: Text('Welcome')),
            ),
          ),
        ],
      );
      await tester.pumpWidget(
        MaterialApp.router(
          theme: cipherwillTheme(brightness),
          routerConfig: router,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(2)),
            child: child!,
          ),
        ),
      );
      await tester.pumpAndSettle();
      for (final label in ['Home', 'Vault', 'People', 'Settings']) {
        expect(find.text(label), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      router.dispose();
    }
  });
}
