import 'package:flutter/material.dart';

/// A radio button widget for single-selection from a group.
///
/// Wraps Flutter's [Radio] widget and integrates with [RadioGroup] for
/// managing selection state within a group of radio buttons.
///
/// Example:
/// ```dart
/// KitRadio<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   activeColor: Colors.blue,
///   onChanged: (value) => setState(() => selectedValue = value),
/// )
/// ```
class KitRadio<T> extends StatelessWidget {
  /// The value represented by this radio button.
  final T value;

  /// The currently selected value in the radio group.
  final T? groupValue;

  /// The color to use when the radio button is selected.
  final Color? activeColor;

  /// Callback triggered when the radio button is selected.
  final void Function(T?) onChanged;

  const KitRadio({
    super.key,
    required this.value,
    required this.onChanged,
    this.groupValue,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: groupValue,
      onChanged: onChanged,
      child: Radio<T>(value: value, activeColor: activeColor),
    );
  }
}
