import 'package:flutter/material.dart';

/// Defines the available page transition animation types.
///
/// Supported transitions:
/// - [slide]: Slide from right to left (default)
/// - [fade]: Fade in/out transition
/// - [scale]: Scale up/down transition
/// - [bounce]: Bounce scale transition with elastic effect
enum TransitionType { slide, fade, scale, bounce }

/// Builds a [PageRouteBuilder] with the specified transition animation.
///
/// Creates smooth page transitions for named route navigation with customizable
/// animation types. All transitions have a duration of 700ms.
///
/// Parameters:
///   - [page]: The widget to display as the new page
///   - [settings]: Route settings including route name and arguments
///   - [transition]: The type of transition animation (default: bounce)
///
/// Returns: A [PageRouteBuilder] configured with the specified page and animation
///
/// Example:
/// ```dart
/// MaterialPageRoute(
///   builder: (context) => buildRoute(MyPage(), settings)
/// )
/// ```
PageRouteBuilder buildRoute(
  Widget page,
  RouteSettings settings, {
  TransitionType transition = TransitionType.bounce,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, _, _) => page,
    transitionDuration: Duration(milliseconds: 700),
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      CurvedAnimation curvedAnimation;

      switch (transition) {
        case TransitionType.bounce:
          // Elastic curve for bounce effect
          curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          );
          return ScaleTransition(scale: curvedAnimation, child: child);

        case TransitionType.fade:
          curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return FadeTransition(opacity: curvedAnimation, child: child);
        case TransitionType.scale:
          curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return ScaleTransition(scale: curvedAnimation, child: child);
        default:
          curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return SlideTransition(
            position: Tween(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );
      }
    },
  );
}
