/// Extension methods on [double] for convenient numeric operations.
///
/// Provides utilities for:
/// - Clean string representation (removes unnecessary decimals)
///
/// Example:
/// ```dart
/// print(10.0.clean()); // '10'
/// print(10.5.clean()); // '10.5'
/// ```
extension DoubeExtensions on double {
  /// Convert the double to a clean string representation.
  ///
  /// Removes trailing zeros and decimal point if the number is a whole number.
  ///
  /// Returns:
  ///   - '10' for 10.0
  ///   - '10.50' for 10.5 (rounded to 2 decimal places)
  String clean() {
    if (this % 1 == 0) {
      return toInt().toString();
    }
    return toStringAsFixed(2);
  }
}
