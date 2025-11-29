import 'package:flutter/material.dart';
import '../animations/app_animations.dart';

/// Wrapper widget to add page transition animations
class AnimatedPageTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  
  const AnimatedPageTransition({
    super.key,
    required this.child,
    this.duration = AppAnimations.normal,
  });

  @override
  Widget build(BuildContext context) {
    return AppAnimations.fadeSlideIn(
      duration: duration,
      child: child,
    );
  }
}
