// Mounts real mobile screens with synthetic online metadata.
// Owns theme, viewport accessibility settings and routed preview navigation.
// Does not bypass the production account gate or alter app startup.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../app/providers.dart';
import '../core/api/json_values.dart';
import '../app/theme.dart';
import '../app/navigation_shell.dart';
import '../features/home/home_screen.dart';
import '../features/vault/vault_screen.dart';
import '../features/people/people_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/settings/platform_screen.dart';
import '../features/settings/appearance.dart';
import 'design_fixtures.dart';
import 'fake_api.dart';
import 'fake_auth.dart';

class PreviewAppearance extends AppearanceController {
  @override
  ThemeMode build() => ThemeMode.system;
}

class DesignHarness extends StatefulWidget {
  final Widget? screen;
  final String location;
  final Brightness brightness;
  final double textScale;
  final bool reducedMotion;
  final double keyboard;
  final Json? preferences;
  const DesignHarness({
    super.key,
    this.screen,
    this.location = '/home',
    this.brightness = Brightness.light,
    this.textScale = 1,
    this.reducedMotion = false,
    this.keyboard = 0,
    this.preferences,
  });
  @override
  State<DesignHarness> createState() => _DesignHarnessState();
}

class _DesignHarnessState extends State<DesignHarness> {
  late final api = FakeApi(designResponse);
  late final router = GoRouter(
    initialLocation: widget.location,
    routes: [
      for (final entry in {
        '/home': const HomeScreen(),
        '/vault': const VaultScreen(),
        '/people': const PeopleScreen(),
        '/settings': const SettingsScreen(),
        '/platform': const PlatformScreen(),
        if (widget.screen != null) widget.location: widget.screen!,
      }.entries)
        GoRoute(
          path: entry.key,
          builder: (_, _) =>
              ['/auth', '/lock', '/onboarding', '/upgrade'].contains(entry.key)
              ? entry.value
              : NavigationShell(location: entry.key, child: entry.value),
        ),
    ],
  );
  @override
  void dispose() {
    router.dispose();
    api.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [
      apiProvider.overrideWithValue(api),
      firebaseProvider.overrideWithValue(FakeAuth()),
      accountProvider.overrideWith((ref) async => previewAccount),
      preferencesProvider.overrideWith(
        (ref) async => widget.preferences ?? previewPreferences,
      ),
      factorsProvider.overrideWith((ref) async => [previewFactor]),
      appearanceProvider.overrideWith(PreviewAppearance.new),
    ],
    child: RepaintBoundary(
      key: const ValueKey('design-capture'),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: cipherwillTheme(widget.brightness),
        routerConfig: router,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FlutterQuillLocalizations.delegate,
        ],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
            padding: const EdgeInsets.only(top: 44, bottom: 24),
            textScaler: TextScaler.linear(widget.textScale),
            disableAnimations: widget.reducedMotion,
            viewInsets: EdgeInsets.only(bottom: widget.keyboard),
          ),
          child: child!,
        ),
      ),
    ),
  );
}
