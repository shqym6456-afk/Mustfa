import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() => _build(
        brightness: Brightness.light,
        background: const Color(0xFFF7F7FC),
        surface: const Color(0xFFFFFFFF),
        onSurface: const Color(0xFF14152B),
        extra: VyoraColors.light,
      );

  static ThemeData dark() => _build(
        brightness: Brightness.dark,
        background: const Color(0xFF0E0F1A),
        surface: const Color(0xFF171829),
        onSurface: const Color(0xFFF3F4FB),
        extra: VyoraColors.dark,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color onSurface,
    required VyoraColors extra,
  }) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: Brand.violet,
      onPrimary: Colors.white,
      secondary: Brand.mint,
      onSecondary: const Color(0xFF06251C),
      error: extra.danger,
      onError: Colors.white,
      surface: surface,
      onSurface: onSurface,
    );

    final baseText = ThemeData(brightness: brightness).textTheme;
    // IBM Plex Sans Arabic covers both Arabic and Latin glyphs.
    final textTheme = GoogleFonts.ibmPlexSansArabicTextTheme(baseText)
        .apply(bodyColor: onSurface, displayColor: onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      extensions: [extra],
      dividerColor: extra.border,
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: extra.border),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: extra.surface2,
        height: 72,
        labelTextStyle: WidgetStatePropertyAll(
          textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? extra.accentText
                : extra.muted,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
