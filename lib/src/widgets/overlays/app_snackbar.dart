import 'package:flutter/material.dart';
import 'package:flutter_toolkit/src/themes/themes.dart';
import 'package:flutter_toolkit/src/utils/extensions/context_ext.dart';
import 'package:flutter_toolkit/src/widgets/layout/gap.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String title,
    Duration duration = const Duration(seconds: 4),
    bool isWarning = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    final snackBar = SnackBar(
      width: context.isMobile ? null : 440,
      backgroundColor: colorScheme.surfaceContainerHigh,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(8),
      margin: context.isMobile ? EdgeInsets.symmetric(horizontal: 10) : null,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isWarning ? AppColors.red500 : colorScheme.inversePrimary,
        ),
      ),
      content: Row(
        children: [
          Icon(
            isWarning ? Icons.info : Icons.check_circle,
            color: isWarning ? AppColors.red500 : AppColors.green500,
          ),
          XGap(12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Icon(
              Icons.clear,
              color: isWarning
                  ? AppColors.red500
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() // Ensures only one snack bar is shown at a time
      ..showSnackBar(snackBar);
  }
}
