import 'package:flutter/material.dart';

/// Dark luxury palette: charcoal base, warm gold accents.
abstract final class LuxuryDarkTheme {
  static const Color charcoal = Color(0xFF0B0C0E);
  static const Color charcoalElevated = Color(0xFF13151A);
  static const Color charcoalCard = Color(0xFF1A1D24);
  static const Color gold = Color(0xFFD4AF37);
  static const Color goldMuted = Color(0xFF9A8A5A);
  static const Color ivory = Color(0xFFF4F1EA);
  static const Color ivoryDim = Color(0xFFB8B3A8);

  static ThemeData build() {
    final scheme = ColorScheme.fromSeed(
      seedColor: gold,
      brightness: Brightness.dark,
      surface: charcoalElevated,
      onSurface: ivory,
      primary: gold,
      onPrimary: charcoal,
      secondary: goldMuted,
      onSecondary: charcoal,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: charcoal,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: ivory,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: charcoalCard,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: gold.withValues(alpha: 0.12)),
        ),
      ),
      dividerTheme: DividerThemeData(color: ivory.withValues(alpha: 0.08)),
      listTileTheme: ListTileThemeData(
        iconColor: gold,
        textColor: ivory,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ivory,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 13,
          color: ivoryDim.withValues(alpha: 0.95),
        ),
      ),
    );
  }
}
