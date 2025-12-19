import 'package:flutter/material.dart';

/// A fixed-size horizontal spacing widget.
///
/// Adds empty space horizontally between widgets. Equivalent to
/// `SizedBox(width: width)`.
///
/// Example:
/// ```dart
/// Row(
///   children: [
///     Icon(Icons.favorite),
///     XGap(8),
///     Text('Like'),
///   ],
/// )
/// ```
class XGap extends StatelessWidget {
  /// The width of the gap in logical pixels.
  final double width;

  const XGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

/// A fixed-size vertical spacing widget.
///
/// Adds empty space vertically between widgets. Equivalent to
/// `SizedBox(height: height)`.
///
/// Example:
/// ```dart
/// Column(
///   children: [
///     Text('Title'),
///     YGap(16),
///     Text('Content'),
///   ],
/// )
/// ```
class YGap extends StatelessWidget {
  /// The height of the gap in logical pixels.
  final double height;

  const YGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
