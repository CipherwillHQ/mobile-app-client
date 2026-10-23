// Translates Cipherwill web tokens into accessible Flutter themes
// Owns light and dark component styling.
// Does not choose account preferences.
import 'package:flutter/material.dart';

ThemeData cipherwillTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xff003ecb),
    brightness: brightness,
    surface: Color(dark ? 0xff1f1f1e : 0xfff8f8f6),
  );
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Gilroy',
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Color(dark ? 0xff2c2c2a : 0xffffffff),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.all(16),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        backgroundColor: const Color(0xff003ecb),
        foregroundColor: Colors.white,
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(height: 72),
  );
}
