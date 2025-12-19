import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Direction of the shimmer animation effect.
enum ShimmerDirection {
  /// Left to right animation
  ltr,

  /// Right to left animation
  rtl,

  /// Top to bottom animation
  ttb,

  /// Bottom to top animation
  btt,
}

/// A custom shimmer loading animation widget.
///
/// Creates a smooth loading placeholder effect with customizable direction,
/// colors, and animation duration. Can either mask a child widget or render
/// a rectangular placeholder.
///
/// Example:
/// ```dart
/// // As a placeholder
/// CustomShimmer(
///   width: 100,
///   height: 20,
///   borderRadius: BorderRadius.circular(4),
/// )
///
/// // As a mask for content
/// CustomShimmer(
///   child: MyContentWidget(),
/// )
/// ```
class CustomShimmer extends StatefulWidget {
  /// The widget to apply the shimmer effect to.
  /// If null, a rectangular placeholder is rendered.
  final Widget? child;

  /// Width of the placeholder (only used if [child] is null).
  final double? width;

  /// Height of the placeholder (only used if [child] is null).
  final double? height;

  /// Border radius for the placeholder shape.
  final BorderRadius? borderRadius;

  /// Base color of the shimmer effect (default: light gray).
  final Color baseColor;

  /// Highlight color of the shimmer effect (default: lighter gray).
  final Color highlightColor;

  /// Duration of one complete shimmer animation cycle (default: 1200ms).
  final Duration period;

  /// Direction of the shimmer animation (default: left to right).
  final ShimmerDirection direction;

  /// Width of the shimmer highlight as a fraction (0-1, default: 0.25).
  final double shimmerWidthFraction;

  /// Animation curve for smooth motion (default: easeInOut).
  final Curve curve;

  const CustomShimmer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.period = const Duration(milliseconds: 1200),
    this.direction = ShimmerDirection.ltr,
    this.shimmerWidthFraction = 0.25,
    this.curve = Curves.easeInOut,
  }) : assert(shimmerWidthFraction > 0 && shimmerWidthFraction < 1);

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  Alignment _alignmentFor(double t, {required bool begin}) {
    switch (widget.direction) {
      case ShimmerDirection.ltr:
        return Alignment(lerpDouble(-1.5, 1.5, t)! + (begin ? 0 : 0), 0);
      case ShimmerDirection.rtl:
        return Alignment(lerpDouble(1.5, -1.5, t)! + (begin ? 0 : 0), 0);
      case ShimmerDirection.ttb:
        return Alignment(0, lerpDouble(-1.5, 1.5, t)!);
      case ShimmerDirection.btt:
        return Alignment(0, lerpDouble(1.5, -1.5, t)!);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.period, vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.repeat();
  }

  @override
  void didUpdateWidget(covariant CustomShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.period != widget.period) {
      _controller.duration = widget.period;
      _controller.reset();
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 12,
      decoration: BoxDecoration(
        color: widget.baseColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.child ?? _buildPlaceholder(context);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final t = _animation.value;

        final highlight = widget.shimmerWidthFraction.clamp(0.05, 0.9);

        final leftStop = (1.0 - highlight) / 2;
        final rightStop = leftStop + highlight;

        final beginAlign = _alignmentFor(t, begin: true);
        final endAlign = _alignmentFor(t, begin: false);

        final gradient = LinearGradient(
          begin: beginAlign,
          end: endAlign,
          colors: [widget.baseColor, widget.highlightColor, widget.baseColor],
          stops: [leftStop.clamp(0.0, 1.0), 0.5, rightStop.clamp(0.0, 1.0)],
          tileMode: TileMode.clamp,
        );

        return ShaderMask(
          shaderCallback: (rect) {
            return gradient.createShader(rect);
          },
          blendMode: BlendMode.srcATop,
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            child: child,
          ),
        );
      },
    );
  }
}
