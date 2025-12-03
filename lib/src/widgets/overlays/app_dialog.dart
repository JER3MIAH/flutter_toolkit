import 'package:flutter/material.dart';

class AppDialog {
  static Future<T?> dialog<T>(
    BuildContext context,
    Widget content, {
    Color? bgColor,
    bool dismissible = true,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.inversePrimary),
                borderRadius: BorderRadius.circular(12),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 16),
              backgroundColor: bgColor ?? colorScheme.surfaceContainerHigh,
              shadowColor: bgColor ?? colorScheme.surfaceContainerHigh,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 540),
                child: content,
              ),
            );
          },
        );
      },
    );
  }
}
