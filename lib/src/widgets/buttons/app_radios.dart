import 'package:flutter/material.dart';

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final Color? activeColor;
  final void Function(T?) onChanged;
  const AppRadio({
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
