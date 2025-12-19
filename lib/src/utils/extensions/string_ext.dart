import 'package:flutter/material.dart';

/// Extension methods on nullable [String] for convenient string operations.
///
/// Provides utilities for:
/// - Null/empty checks
/// - String formatting (capitalize, title case)
/// - Type conversion (to int, double)
/// - Color parsing from hex strings
///
/// Example:
/// ```dart
/// String? text = 'hello world';
/// if (text.isNotNullOrEmpty) {
///   print(text.toTitleCase()); // 'Hello World'
/// }
///
/// Color color = '#FF5733'.asColor;
/// ```
extension StringExtensions on String? {
  /// Returns true if the string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns true if the string is not null and not empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Capitalize the first letter of the string.
  ///
  /// Returns empty string if null or empty.
  ///
  /// Example: 'hello' → 'Hello'
  String capitalize() {
    if (isNullOrEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  /// Convert the string to title case (each word capitalized).
  ///
  /// Returns empty string if null or empty.
  ///
  /// Example: 'hello world' → 'Hello World'
  String toTitleCase() {
    if (isNullOrEmpty) return '';
    return this!.split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Remove all whitespace from the string.
  ///
  /// Returns empty string if null.
  String removeSpaces() => this?.replaceAll(' ', '') ?? '';

  /// Convert the string to an integer, defaulting to 0 if parsing fails.
  int toIntOrZero() => int.tryParse(this ?? '') ?? 0;

  /// Convert the string to a double, defaulting to 0.0 if parsing fails.
  double toDoubleOrZero() => double.tryParse(this ?? '') ?? 0.0;

  /// Convert a hex color string to a Flutter [Color].
  ///
  /// Accepts formats like "#RRGGBB" or "RRGGBB".
  /// Returns black if the string is null or invalid.
  ///
  /// Example: '#FF5733'.asColor → Color(0xFFFF5733)
  Color get asColor {
    if (isNullOrEmpty) return const Color(0xFF000000);
    final hex = this!.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  /// Convert a hex color string to an integer representation.
  ///
  /// Useful for storing or comparing color values.
  /// Returns 0xFF000000 (black) if null or invalid.
  int get asInt {
    if (isNullOrEmpty) return 0xFF000000;
    final value = this!.replaceAll('#', '').toUpperCase();
    final hex = value.length == 6 ? 'FF$value' : value;
    return int.parse('0x$hex');
  }
}
