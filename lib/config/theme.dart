import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColors {
  static const secondary = Color(0xFF6842FF);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF212121);
  static const textLight = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFFAFAFA);
  static const cardDark = Color(0xFF1F222A);
  static const progressIndicatorDark = Color(0xFFF9FAFE);
  static const progressIndicatorLight = Color(0xFF212121);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF181A20);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

// box-shadow: 4px 8px 24px rgba(104, 66, 255, 0.25);

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.urbanistTextTheme()
            .apply(bodyColor: AppColors.textDark),
        backgroundColor: _LightColors.background,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.progressIndicatorLight,
        ),
        scaffoldBackgroundColor: _LightColors.background,
        cardColor: _LightColors.card,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: _LightColors.background,
          foregroundColor: AppColors.textDark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: AppColors.textLight,
            shadowColor: const Color.fromARGB(200, 104, 66, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textDark),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconDark),
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.secondary,
        ),
      );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.urbanistTextTheme()
            .apply(bodyColor: AppColors.textLight),
        backgroundColor: _DarkColors.background,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.progressIndicatorDark,
        ),
        scaffoldBackgroundColor: _DarkColors.background,
        cardColor: _DarkColors.card,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: _DarkColors.background,
          foregroundColor: AppColors.textLight,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: const Color.fromARGB(200, 104, 66, 255),
            onPrimary: AppColors.textLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
        ),
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(color: AppColors.textLight),
        ),
        iconTheme: const IconThemeData(color: AppColors.iconLight),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.secondary,
        ),
      );
}
