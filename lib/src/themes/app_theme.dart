import 'package:flutter/material.dart';
import 'package:flutter_toolkit/src/themes/colors.dart';

/// Predefined Material 3 theme configurations for the application.
///
/// Provides light and dark theme variants with consistent styling
/// using Material Design 3 principles.
class BlueTheme {
  BlueTheme._(); // Private constructor to prevent instantiation

  /// Light theme configuration using Material 3 design system.
  ///
  /// Features:
  /// - Neutral 100 as scaffold background for a light appearance
  /// - Blue 500 as primary color for interactive elements
  /// - Proper contrast ratios for accessibility
  /// - Semantic colors for status indicators
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.neutral100,
    colorScheme: ColorScheme.light(
      surface: AppColors.white,
      onSurface: AppColors.black,
      onSurfaceVariant: AppColors.neutral600,
      surfaceContainer: AppColors.neutral600,
      surfaceBright: AppColors.neutral700,
      primary: AppColors.blue500,
      primaryContainer: AppColors.white,
      secondaryContainer: AppColors.neutral100,
      surfaceContainerHigh: AppColors.white,
      primaryFixed: AppColors.neutral100,
      onPrimary: AppColors.neutral950,
      inversePrimary: AppColors.neutral200,
      inverseSurface: AppColors.neutral300,
      secondary: AppColors.blue50,
      tertiary: AppColors.blue700,
      error: AppColors.red500,
      errorContainer: AppColors.red100,
    ),
  );

  /// Dark theme configuration using Material 3 design system.
  ///
  /// Features:
  /// - Neutral 900 as scaffold background for a dark appearance
  /// - Blue 500 as primary color maintaining consistency with light theme
  /// - High contrast text on dark backgrounds
  /// - Proper semantic colors for error and status indicators
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.neutral900,
    colorScheme: ColorScheme.dark(
      surface: AppColors.black,
      onSurface: AppColors.white,
      onSurfaceVariant: AppColors.neutral400,
      surfaceContainer: AppColors.white,
      surfaceBright: AppColors.neutral300,
      primary: AppColors.blue500,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.neutral950,
      secondaryContainer: AppColors.neutral500,
      surfaceContainerHigh: AppColors.neutral700,
      primaryFixed: AppColors.neutral800,
      inversePrimary: AppColors.neutral700,
      inverseSurface: AppColors.neutral600,
      secondary: AppColors.blue50,
      tertiary: AppColors.blue700,
      error: AppColors.red500,
      errorContainer: AppColors.red100,
    ),
  );
}
