import 'package:flutter/material.dart';

/// App-wide animation configurations and helpers
class AppAnimations {
  // Duration constants
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 350);
  static const Duration verySlow = Duration(milliseconds: 500);
  
  // Curves
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve bounceCurve = Curves.easeOutBack;
  static const Curve smoothCurve = Curves.easeInOutCubic;
  
  // Fade transition
  static Widget fadeIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = defaultCurve,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: child,
      ),
      child: child,
    );
  }
  
  // Slide transition
  static Widget slideIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = defaultCurve,
    Offset begin = const Offset(0, 0.1),
    Offset end = Offset.zero,
  }) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(value.dx * 100, value.dy * 100),
        child: child,
      ),
      child: child,
    );
  }
  
  // Scale transition
  static Widget scaleIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = defaultCurve,
    double begin = 0.9,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
      child: child,
    );
  }
  
  // Combined fade and slide
  static Widget fadeSlideIn({
    required Widget child,
    Duration duration = normal,
    Curve curve = defaultCurve,
    Offset slideBegin = const Offset(0, 0.05),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(
            slideBegin.dx * (1 - value) * 100,
            slideBegin.dy * (1 - value) * 100,
          ),
          child: child,
        ),
      ),
      child: child,
    );
  }
  
  // Staggered list animation
  static Widget staggeredList({
    required Widget child,
    required int index,
    Duration duration = normal,
    Duration delay = const Duration(milliseconds: 50),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration + (delay * index),
      curve: defaultCurve,
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: Transform.translate(
          offset: Offset(0, (1 - value) * 20),
          child: child,
        ),
      ),
      child: child,
    );
  }
}

/// Animated container with hover effect
class AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;
  final double elevation;
  final double hoverElevation;
  final double scale;
  final BorderRadius? borderRadius;
  
  const AnimatedCard({
    super.key,
    required this.child,
    this.onTap,
    this.duration = AppAnimations.fast,
    this.elevation = 0,
    this.hoverElevation = 4,
    this.scale = 0.98,
    this.borderRadius,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: AppAnimations.defaultCurve,
          transform: Matrix4.identity()
            ..scale(_isPressed ? widget.scale : 1.0),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Shimmer loading effect
class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;
  
  const ShimmerLoading({
    super.key,
    required this.child,
    this.isLoading = true,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    final baseColor = widget.baseColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]!
            : Colors.grey[300]!);
    final highlightColor = widget.highlightColor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[700]!
            : Colors.grey[100]!);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ].map((e) => e.clamp(0.0, 1.0)).toList(),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

/// Page transition helper
class AppPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final PageTransitionType type;

  AppPageRoute({
    required this.child,
    this.type = PageTransitionType.fade,
    Duration duration = AppAnimations.normal,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case PageTransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
              case PageTransitionType.slide:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: AppAnimations.smoothCurve,
                  )),
                  child: child,
                );
              case PageTransitionType.scale:
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: AppAnimations.smoothCurve,
                    ),
                  ),
                  child: FadeTransition(opacity: animation, child: child),
                );
            }
          },
        );
}

enum PageTransitionType { fade, slide, scale }

/// Pulsing animation for live indicators
class PulsingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double minScale;
  final double maxScale;

  const PulsingWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.minScale = 0.9,
    this.maxScale = 1.1,
  });

  @override
  State<PulsingWidget> createState() => _PulsingWidgetState();
}

class _PulsingWidgetState extends State<PulsingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(
      begin: widget.minScale,
      end: widget.maxScale,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
