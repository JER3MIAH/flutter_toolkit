import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolkit_core/src/themes/themes.dart' show KitColors;

/// A customizable elevated button widget with icon support.
///
/// Provides a Material 3 compliant primary action button with optional icon,
/// haptic feedback, and flexible sizing options.
///
/// Features:
/// - Customizable colors and text styling
/// - Optional leading or icon-only display
/// - Haptic feedback on tap
/// - Support for expanded (full-width) or auto-sized button
/// - Configurable height and font size
///
/// Example:
/// ```dart
/// PrimaryButton(
///   title: 'Submit',
///   onTap: () => print('Submitted'),
///   expanded: true,
///   icon: Icons.check,
/// )
/// ```
class PrimaryButton extends StatelessWidget {
  /// The button label text.
  final String title;

  /// Callback triggered when the button is tapped.
  final VoidCallback? onTap;

  /// Font size of the button text (default: 14).
  final double fontSize;

  /// Height of the button (default: 36).
  final double bHeight;

  /// If true, the button takes full available width.
  final bool expanded;

  /// Background color of the button. Uses primary color if null.
  final Color? color;

  /// Text color of the button (default: white).
  final Color? textColor;

  /// Optional icon to display in the button.
  final IconData? icon;

  /// If true, displays only the icon without the title.
  final bool iconOnly;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.fontSize = 14,
    this.bHeight = 36,
    this.expanded = false,
    this.color,
    this.textColor,
    this.icon,
    this.iconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap?.call();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          color ?? Theme.of(context).colorScheme.primary,
        ),
        elevation: const WidgetStatePropertyAll(0),
        minimumSize: WidgetStatePropertyAll(
          expanded ? Size(double.infinity, bHeight) : null,
        ),
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(bHeight)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      child: iconOnly && icon != null
          ? Icon(icon, color: textColor ?? KitColors.white)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      icon,
                      color: textColor ?? KitColors.white,
                      size: fontSize + 2,
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor ?? KitColors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
