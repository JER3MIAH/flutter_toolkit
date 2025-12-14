import 'package:flutter/material.dart';
import 'package:flutter_toolkit/flutter_toolkit.dart';
import 'package:flutter_toolkit/src/widgets/buttons/outlined_button.dart' as tk;

/// A reusable dialog body with header, content, and action row.
class DialogActionColumn extends StatelessWidget {
  /// Title shown at the top-left of the dialog.
  final String title;

  /// Callback for the primary (confirm) button.
  final VoidCallback onTap;

  /// Widgets displayed between the header and the action row.
  final List<Widget> children;

  /// Label for the primary (confirm) button.
  final String primaryButtonTitle;

  /// Color for the primary (confirm) button background.
  final Color? primaryButtonColor;

  /// Optional label for the cancel button (defaults to "Cancel").
  final String cancelButtonTitle;

  const DialogActionColumn({
    super.key,
    required this.title,
    required this.onTap,
    required this.children,
    this.primaryButtonTitle = 'Confirm',
    this.cancelButtonTitle = 'Cancel',
    this.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Close',
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ],
          ),
        ),
        Divider(height: .5, color: AppColors.neutral200,),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              Expanded(
                child: tk.AppOutlinedButton(
                  title: cancelButtonTitle,
                  onTap: () => Navigator.of(context).maybePop(),
                  expanded: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  title: primaryButtonTitle,
                  onTap: onTap,
                  color: primaryButtonColor,
                  expanded: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
