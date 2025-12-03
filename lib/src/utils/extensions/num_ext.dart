import 'dart:math';

extension NumExtensions on num? {
  bool get isNullOrZero => this == null || this == 0;
  bool get isNotNullOrZero => !isNullOrZero;

  String toCurrencyString({String locale = 'en_US', String symbol = '\$'}) {
    if (this == null) return '${symbol}0.00';
    return '$symbol${this!.toStringAsFixed(2)}';
  }

  String toPercentageString({int fractionDigits = 2}) {
    if (this == null) return '0%';
    return '${(this! * 100).toStringAsFixed(fractionDigits)}%';
  }

  bool isBetween(num min, num max) {
    if (this == null) return false;
    return this! >= min && this! <= max;
  }

  double roundTo(int decimals) {
    if (this == null) return 0.0;
    double mod = pow(10.0, decimals).toDouble();
    return ((this! * mod).round().toDouble() / mod);
  }

  double percent(double percent) {
    if (this == null) return 0.0;
    return this! * percent / 100;
  }

  String toCurrency({String symbol = '₦', int decimals = 2}) {
    if (this == null) return '${symbol}0.00';
    return '$symbol${this!.toStringAsFixed(decimals)}';
  }

  bool get isEvenNumber {
    if (this == null) return false;
    return this! % 2 == 0;
  }

  bool get isOddNumber {
    if (this == null) return false;
    return this! % 2 != 0;
  }
}
