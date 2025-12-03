extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  String capitalize() {
    if (this == null || this!.isEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  String toTitleCase() {
    if (this == null || this!.isEmpty) return '';
    return this!
        .split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }

  String removeSpaces() => this?.replaceAll(' ', '') ?? '';

  int toIntOrZero() => int.tryParse(this ?? '') ?? 0;
  double toDoubleOrZero() => double.tryParse(this ?? '') ?? 0.0;
}
