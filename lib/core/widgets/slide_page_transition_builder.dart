import 'package:flutter/material.dart';

class SlidePageTransitionBuilder extends PageTransitionsBuilder {
  const SlidePageTransitionBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), // From right to left
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
