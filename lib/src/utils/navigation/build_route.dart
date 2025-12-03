import 'package:flutter/material.dart';

enum TransitionType { slide, fade, scale }

PageRouteBuilder buildRoute(
  Widget page,
  RouteSettings settings, {
  TransitionType transition = TransitionType.slide,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, _, _) => page,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      switch (transition) {
        case TransitionType.fade:
          return FadeTransition(opacity: curvedAnimation, child: child);
        case TransitionType.scale:
          return ScaleTransition(scale: curvedAnimation, child: child);
        default:
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
