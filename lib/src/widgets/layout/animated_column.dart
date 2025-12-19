import 'dart:async';

import 'package:flutter/material.dart';

/// A column widget with staggered entrance animations for each child.
///
/// Animates children in sequence with fade and slide effects, creating a
/// smooth entrance animation. Can use an external [AnimationController] or
/// create its own.
///
/// Example:
/// ```dart
/// AnimatedColumn(
///   duration: Duration(milliseconds: 800),
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///     Text('Item 3'),
///   ],
/// )
/// ```
class AnimatedColumn extends StatefulWidget {
  /// Optional external animation controller for manual control.
  final AnimationController? _animationController;

  /// The child widgets to animate.
  final List<Widget> children;

  /// Duration of the complete animation sequence.
  final Duration? duration;

  /// Delay before animation starts.
  final Duration? delay;

  /// Space between children in logical pixels.
  final double? spacing;

  /// Vertical alignment of children.
  final MainAxisAlignment? mainAxisAlignment;

  /// Axis direction (default: vertical).
  final Axis direction;

  /// Horizontal alignment of children.
  final CrossAxisAlignment? crossAxisAlignment;

  /// How to size the column.
  final MainAxisSize? mainAxisSize;

  const AnimatedColumn({
    AnimationController? animationController,
    required this.children,
    super.key,
    this.mainAxisAlignment,
    this.duration,
    this.delay,
    this.crossAxisAlignment,
    this.direction = Axis.vertical,
    this.spacing,
    this.mainAxisSize,
  }) : _animationController = animationController;

  @override
  State<AnimatedColumn> createState() => _AnimatedColumnState();
}

class _AnimatedColumnState extends State<AnimatedColumn>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Timer? delay;

  @override
  void initState() {
    super.initState();
    _animationController =
        widget._animationController ??
        AnimationController(
          vsync: this,
          duration:
              widget.duration ??
              Duration(milliseconds: widget.children.length * 150),
        );
    if (widget._animationController == null) {
      delay = Timer(widget.delay ?? Duration.zero, () {
        _animationController?.forward();
      });
    }
  }

  @override
  void dispose() {
    delay?.cancel();
    if (widget._animationController == null) {
      _animationController?.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (BuildContext context, Widget? child) {
        return Column(
          spacing: widget.spacing ?? 0.0,
          mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.start,
          children: <Widget>[
            ...List<Widget>.generate(widget.children.length, (int index) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    curve: Interval(
                      1 / widget.children.length * index * 0.5,
                      1 / widget.children.length * index,
                      curve: Curves.easeInOut,
                    ),
                    parent: _animationController!,
                  ),
                ),
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: widget.direction == Axis.vertical
                            ? const Offset(0.0, 4)
                            : const Offset(.9, 0.0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          curve: Interval(
                            1 /
                                widget.children.length *
                                (index + index == 0 ? 2 : 1) *
                                0.25,
                            1 / widget.children.length * (index + 1),
                            curve: Curves.linearToEaseOut,
                          ),
                          parent: _animationController!,
                        ),
                      ),
                  child: widget.children[index],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
