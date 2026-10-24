// Translates Cipherwill web tokens into accessible Flutter themes
// Owns light and dark component styling.
// Does not choose account preferences.
import 'package:flutter/material.dart';
import '../shared/ui/motion.dart';
import 'design_tokens.dart';
import 'typography.dart';

ThemeData cipherwillTheme(Brightness brightness) {
  final dark = brightness == Brightness.dark;
  final scheme =
      ColorScheme.fromSeed(
        seedColor: CipherwillColors.blue,
        brightness: brightness,
        surface: dark ? CipherwillColors.charcoal : CipherwillColors.canvas,
      ).copyWith(
        primary: dark ? const Color(0xff96b8ff) : CipherwillColors.blue,
        onPrimary: Colors.white,
        onSurface: dark ? CipherwillColors.cream : CipherwillColors.forest,
        onSurfaceVariant: Color(dark ? 0xffb5b5ad : 0xff6d7475),
        primaryContainer: Color(dark ? 0xff333330 : 0xffecf7ff),
        onPrimaryContainer: Color(dark ? 0xffb8ccff : 0xff003ecb),
        outlineVariant:
            (dark ? CipherwillColors.cream : CipherwillColors.forest)
                .withValues(alpha: .1),
        error: dark ? const Color(0xffffa098) : CipherwillColors.error,
      );
  final card = dark ? CipherwillColors.darkCard : Colors.white;
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
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 56,
      titleTextStyle: text.titleLarge,
    ),
    cardTheme: CardThemeData(
      color: card,
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: card,
      border: outline,
      enabledBorder: outline,
      focusedBorder: outline.copyWith(
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: TextStyle(color: scheme.onSurfaceVariant, fontSize: 14),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      iconColor: scheme.onSurfaceVariant,
      titleTextStyle: text.titleMedium,
      subtitleTextStyle: text.bodySmall,
      minVerticalPadding: 8,
    ),
    dividerTheme: DividerThemeData(
      color: scheme.outlineVariant,
      space: 24,
      thickness: 1,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: card,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: CipherwillColors.forest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
    chipTheme: ChipThemeData(
      side: BorderSide(color: scheme.outlineVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      selectedColor: scheme.primaryContainer,
      padding: const EdgeInsets.all(8),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CipherwillPageTransitions(),
        TargetPlatform.macOS: CipherwillPageTransitions(),
        TargetPlatform.linux: CipherwillPageTransitions(),
      },
    ),
  );
}
