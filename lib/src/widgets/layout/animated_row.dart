import 'package:flutter/material.dart';

class AnimatedRow extends StatefulWidget {
  const AnimatedRow({
    AnimationController? animationController,
    required this.children,
    super.key,
    this.mainAxisAlignment,
    this.duration,
    this.delay,
    this.crossAxisAlignment,
    this.direction = Axis.vertical,
    this.mainAxisSize,
  }) : _animationController = animationController;

  final AnimationController? _animationController;
  final List<Widget> children;
  final Duration? duration;
  final Duration? delay;
  final MainAxisAlignment? mainAxisAlignment;
  final Axis direction;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;

  @override
  State<AnimatedRow> createState() => _AnimatedRowState();
}

class _AnimatedRowState extends State<AnimatedRow>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        widget._animationController ??
        AnimationController(
          vsync: this,
          duration:
              widget.duration ??
              Duration(milliseconds: widget.children.length * 200),
        );

    if (widget._animationController == null) {
      if (mounted) {
        Future<void>.delayed(
          widget.delay ?? const Duration(milliseconds: 100),
        ).then((_) => _animationController.forward());
      }
    }
  }

  @override
  void dispose() {
    if (widget._animationController == null) {
      Future<void>.delayed(
        widget.delay ?? const Duration(milliseconds: 200),
      ).then((_) => _animationController.forward());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.start,
          children: <Widget>[
            ...List<Widget>.generate(widget.children.length, (int index) {
              return FadeTransition(
                key: ValueKey<int>(index),
                opacity: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    curve: Interval(
                      1 / widget.children.length * index * 0.1,
                      1 / widget.children.length * index,
                      curve: Curves.easeInOut,
                    ),
                    parent: _animationController,
                  ),
                ),
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: widget.direction == Axis.vertical
                            ? const Offset(0.0, 1.0)
                            : const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          curve: Interval(
                            1 / widget.children.length * index * 0.1,
                            1 / widget.children.length * index,
                            curve: Curves.ease,
                          ),
                          parent: _animationController,
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
