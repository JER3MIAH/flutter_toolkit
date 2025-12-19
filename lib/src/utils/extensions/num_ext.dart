import 'dart:math';

/// Extension methods on nullable numeric types ([num]) for convenient numeric operations.
///
/// Provides utilities for:
/// - Null/zero checks
/// - Currency and percentage formatting
/// - Number properties (even/odd, ranges)
/// - Precision rounding
/// - Percentage calculations
///
/// Example:
/// ```dart
/// num? price = 99.99;
/// print(price.toCurrency()); // '₦99.99'
/// print(price.percent(10)); // 9.999
/// ```
extension NumExtensions on num? {
  /// Returns true if the value is null or zero.
  bool get isNullOrZero => this == null || this == 0;

  /// Returns true if the value is not null and not zero.
  bool get isNotNullOrZero => !isNullOrZero;

  /// Format as a currency string with symbol.
  ///
  /// Parameters:
  ///   - [locale]: The locale for formatting (default: 'en_US')
  ///   - [symbol]: The currency symbol to use (default: '$')
  ///
  /// Returns: Formatted currency string like "$99.00"
  String toCurrencyString({String locale = 'en_US', String symbol = '\$'}) {
    if (this == null) return '${symbol}0.00';
    return '$symbol${this!.toStringAsFixed(2)}';
  }

  /// Format as a percentage string.
  ///
  /// Parameters:
  ///   - [fractionDigits]: Number of decimal places (default: 2)
  ///
  /// Returns: Formatted percentage like "50.00%"
  String toPercentageString({int fractionDigits = 2}) {
    if (this == null) return '0%';
    return '${(this! * 100).toStringAsFixed(fractionDigits)}%';
  }

  /// Check if the value falls within a range (inclusive).
  ///
  /// Parameters:
  ///   - [min]: The minimum value
  ///   - [max]: The maximum value
  ///
  /// Returns: true if min <= value <= max
  bool isBetween(num min, num max) {
    if (this == null) return false;
    return this! >= min && this! <= max;
  }

  /// Round the number to a specific number of decimal places.
  ///
  /// Parameters:
  ///   - [decimals]: Number of decimal places to round to
  ///
  /// Returns: The rounded value as a double
  ///
  /// Example: 3.14159.roundTo(2) → 3.14
  double roundTo(int decimals) {
    if (this == null) return 0.0;
    double mod = pow(10.0, decimals).toDouble();
    return ((this! * mod).round().toDouble() / mod);
  }

  /// Calculate a percentage of the value.
  ///
  /// Parameters:
  ///   - [percent]: The percentage to calculate (0-100)
  ///
  /// Returns: The calculated percentage value
  ///
  /// Example: 100.percent(10) → 10.0
  double percent(double percent) {
    if (this == null) return 0.0;
    return this! * percent / 100;
  }

  /// Format as a currency string with custom symbol and decimal places.
  ///
  /// Parameters:
  ///   - [symbol]: The currency symbol (default: '₦')
  ///   - [decimals]: Number of decimal places (default: 2)
  ///
  /// Returns: Formatted currency string
  ///
  /// Example: 99.9.toCurrency(symbol: '₦') → '₦99.90'
  String toCurrency({String symbol = '₦', int decimals = 2}) {
    if (this == null) return '${symbol}0.00';
    return '$symbol${this!.toStringAsFixed(decimals)}';
  }

  /// Check if the number is even.
  ///
  /// Returns false if null or not an integer.
  bool get isEvenNumber {
    if (this == null) return false;
    return this! % 2 == 0;
  }

  /// Check if the number is odd.
  ///
  /// Returns false if null or not an integer.
  bool get isOddNumber {
    if (this == null) return false;
    return this! % 2 != 0;
  }
}
