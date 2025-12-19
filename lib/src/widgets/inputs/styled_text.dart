import 'package:flutter/material.dart';

/// A flexible text widget with extensive style customization options.
///
/// Provides convenient parameters for styling text without manually creating
/// [TextStyle] objects. Useful for maintaining consistent typography throughout
/// the application.
///
/// Example:
/// ```dart
/// StyledText(
///   'Hello World',
///   fontSize: 16,
///   fontWeight: FontWeight.bold,
///   color: Colors.blue,
/// )
/// ```
class StyledText extends StatelessWidget {
  /// The text content to display.
  final String text;

  /// Custom [TextStyle] to use. Overrides individual style parameters.
  final TextStyle? style;

  /// Text color.
  final Color? color;

  /// Text decoration (underline, strikethrough, etc.).
  final TextDecoration? decoration;

  /// Style of the decoration.
  final TextDecorationStyle? decorationStyle;

  /// Font size in logical pixels.
  final double? fontSize;

  /// Font weight (normal, bold, etc.). Default: normal.
  final FontWeight fontWeight;

  /// Font style (normal or italic).
  final FontStyle? fontStyle;

  /// Custom font family name.
  final String? fontFamily;

  /// Letter spacing in logical pixels.
  final double? letterSpacing;

  /// Word spacing in logical pixels.
  final double? wordSpacing;

  /// Text baseline alignment.
  final TextBaseline? textBaseline;

  /// Line height multiplier.
  final double? height;

  /// How to align the text horizontally.
  final TextAlign? textAlign;

  /// How to handle text overflow.
  final TextOverflow? overflow;

  /// Semantic label for accessibility.
  final String? semanticsLabel;

  const StyledText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.textAlign,
    this.overflow,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          TextStyle(
            color: color,
            decoration: decoration,
            decorationStyle: decorationStyle,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            textBaseline: textBaseline,
            height: height,
            fontFamily: fontFamily,
          ),
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      textAlign: textAlign,
    );
  }
}
