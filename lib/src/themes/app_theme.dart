import 'package:flutter/material.dart';
import 'package:toolkit_core/src/themes/colors.dart';

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
    scaffoldBackgroundColor: KitColors.neutral100,
    colorScheme: ColorScheme.light(
      surface: KitColors.white,
      onSurface: KitColors.black,
      onSurfaceVariant: KitColors.neutral600,
      surfaceContainer: KitColors.neutral600,
      surfaceBright: KitColors.neutral700,
      primary: KitColors.blue500,
      primaryContainer: KitColors.white,
      secondaryContainer: KitColors.neutral100,
      surfaceContainerHigh: KitColors.white,
      primaryFixed: KitColors.neutral100,
      onPrimary: KitColors.neutral950,
      inversePrimary: KitColors.neutral200,
      inverseSurface: KitColors.neutral300,
      secondary: KitColors.blue50,
      tertiary: KitColors.blue700,
      error: KitColors.red500,
      errorContainer: KitColors.red100,
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
    scaffoldBackgroundColor: KitColors.neutral900,
    colorScheme: ColorScheme.dark(
      surface: KitColors.black,
      onSurface: KitColors.white,
      onSurfaceVariant: KitColors.neutral400,
      surfaceContainer: KitColors.white,
      surfaceBright: KitColors.neutral300,
      primary: KitColors.blue500,
      onPrimary: KitColors.white,
      primaryContainer: KitColors.neutral950,
      secondaryContainer: KitColors.neutral500,
      surfaceContainerHigh: KitColors.neutral700,
      primaryFixed: KitColors.neutral800,
      inversePrimary: KitColors.neutral700,
      inverseSurface: KitColors.neutral600,
      secondary: KitColors.blue50,
      tertiary: KitColors.blue700,
      error: KitColors.red500,
      errorContainer: KitColors.red100,
    ),
  );
}
