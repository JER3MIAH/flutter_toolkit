import 'package:flutter/material.dart';
import 'package:toolkit_core/src/utils/utils.dart' show NoThumbScrollBehavior;

/// A column widget with built-in scroll support and customizable spacing.
///
/// Combines [Column] with optional scrolling, padding, and scroll behavior.
/// Automatically wraps content in [SafeArea] and applies [NoThumbScrollBehavior]
/// to hide scroll indicators.
///
/// Example:
/// ```dart
/// KitColumn(
///   padding: EdgeInsets.all(16),
///   spacing: 12,
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///     Text('Item 3'),
///   ],
/// )
/// ```
class KitColumn extends StatelessWidget {
  /// The child widgets to arrange vertically.
  final List<Widget> children;

  /// How to size the column (default: min).
  final MainAxisSize mainAxisSize;

  /// Vertical alignment of children (default: start).
  final MainAxisAlignment mainAxisAlignment;

  /// Horizontal alignment of children (default: center).
  final CrossAxisAlignment crossAxisAlignment;

  /// Padding around the column content.
  final EdgeInsetsGeometry? padding;

  /// If true, content is wrapped in a scrollable container (default: true).
  final bool shouldScroll;

  /// Space between children in logical pixels (default: 0).
  final double spacing;

  const KitColumn({
    super.key,
    required this.children,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
    this.shouldScroll = true,
    this.spacing = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    final body = Padding(
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      child: Column(
        spacing: spacing,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
    return SafeArea(
      child: ScrollConfiguration(
        behavior: NoThumbScrollBehavior(),
        child: shouldScroll
            ? SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: body,
              )
            : body,
      ),
    );
  }
}
