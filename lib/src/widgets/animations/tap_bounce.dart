import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that adds a scale animation (bounce effect) on tap.
///
/// Animates the child widget with a scaling effect when the user presses down,
/// and reverses the animation on release or cancel. Includes haptic feedback
/// for tactile response.
///
/// Example:
/// ```dart
/// TapBounce(
///   onTap: () => print('Tapped!'),
///   child: Container(
///     color: Colors.blue,
///     child: Text('Tap me'),
///   ),
/// )
/// ```
class TapBounce extends StatefulWidget {
  /// The widget to apply the bounce animation to.
  final Widget child;

  /// Callback triggered when the widget is tapped.
  final VoidCallback? onTap;

  const TapBounce({super.key, required this.child, this.onTap});

  @override
  State<TapBounce> createState() => _TapBounceState();
}

class _TapBounceState extends State<TapBounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handlePointerDown(PointerDownEvent event) {
    HapticFeedback.lightImpact();
    _controller.forward();
  }

  void _handlePointerUp(PointerUpEvent event) => _controller.reverse();
  void _handlePointerCancel(PointerEvent event) => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Listener(
        onPointerDown: _handlePointerDown,
        onPointerUp: _handlePointerUp,
        onPointerCancel: _handlePointerCancel,
        child: ScaleTransition(scale: _scale, child: widget.child),
      ),
    );
  }
}
