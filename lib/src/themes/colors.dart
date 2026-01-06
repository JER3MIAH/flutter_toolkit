import 'package:flutter/material.dart';

/// Application color palette for use throughout the app.
///
/// This class defines all colors used in the application including:
/// - Base colors (white, black)
/// - Brand colors (blue shades)
/// - Semantic colors (success, error, warning)
/// - Neutral shades (grayscale for text, backgrounds, dividers)
///
/// All colors are defined as static const values for optimal performance.
class KitColors {
  KitColors._(); // Private constructor to prevent instantiation

  // Base Colors
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF0E121B);

  // Primary Brand Colors
  static const blue = Color.fromRGBO(18, 97, 160, 1);
  static const blue50 = Color(0xFFEBF1FF);
  static const blue500 = Color(0xFF335CFF);
  static const blue700 = Color(0xFF2547D0);

  // Semantic Colors - Success
  static const green100 = Color(0xFFD1FBE9);
  static const green500 = Color(0xFF21C16B);

  // Semantic Colors - Error
  static const red100 = Color(0xFFFFD5D8);
  static const red500 = Color(0xFFFB3748);

  // Neutral Colors - Grayscale for backgrounds, text, and borders
  static const neutral50 = Color(0xFFF5F7FA);
  static const neutral100 = Color(0xFFF3F5F8);
  static const neutral200 = Color(0xFFE0E4EA);
  static const neutral300 = Color(0xFFCACFD8);
  static const neutral400 = Color(0xFF99A0AE);
  static const neutral500 = Color(0xFF717784);
  static const neutral600 = Color(0xFF525866);
  static const neutral700 = Color(0xFF2B303B);
  static const neutral800 = Color(0xFF232530);
  static const neutral900 = Color(0xFF191B25);
  static const neutral950 = Color(0xFF0E121B);
}
