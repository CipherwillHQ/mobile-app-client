// Styles the retained native authentication forms.
// Owns brand colors, typography and authentication controls.
// Does not style the web application or load account preferences.
import 'package:flutter/material.dart';
import 'typography.dart';

ThemeData cipherwillTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme =
      ColorScheme.fromSeed(
        seedColor: const Color(0xff003ecb),
        brightness: brightness,
        surface: Color(dark ? 0xff1f1f1e : 0xfff8f8f6),
      ).copyWith(
        primary: Color(dark ? 0xff96b8ff : 0xff003ecb),
        onPrimary: Colors.white,
        onSurface: Color(dark ? 0xfffbf9f1 : 0xff2a363b),
        onSurfaceVariant: Color(dark ? 0xffb5b5ad : 0xff6d7475),
        outlineVariant: Color(
          dark ? 0xfffbf9f1 : 0xff2a363b,
        ).withValues(alpha: .1),
      );
  final card = dark ? const Color(0xff2c2c2a) : Colors.white;
  final outline = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: scheme.outlineVariant),
  );
  final text = cipherwillTypography(scheme);
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Gilroy',
    colorScheme: scheme,
    textTheme: text,
    scaffoldBackgroundColor: scheme.surface,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: card,
      border: outline,
      enabledBorder: outline,
      focusedBorder: outline.copyWith(
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        backgroundColor: const Color(0xff003ecb),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: text.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        foregroundColor: scheme.onSurface,
        side: BorderSide(color: scheme.outlineVariant),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: text.labelLarge,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(48, 48),
        textStyle: text.labelLarge,
      ),
    ),
  );
}
