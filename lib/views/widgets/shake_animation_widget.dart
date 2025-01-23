import 'package:flutter/material.dart';

class ShakeAnimationWidget extends StatefulWidget {
  const ShakeAnimationWidget(
      {super.key, required this.child, required this.duration});
  final Widget child;
  final Duration duration;

  @override
  State<ShakeAnimationWidget> createState() => _ShakeAnimationWidgetState();
}

class _ShakeAnimationWidgetState extends State<ShakeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animController; // handles ticks & duration
  late Animation
      animation; // handles type of animation (ex: curve, tween, physics)

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this, // see SingleTickerProviderStateMixin
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
    animation =
        CurvedAnimation(parent: animController, curve: Curves.easeInOutExpo);
    animation.addListener(() {
      if (mounted) setState(() {}); // Here you can setup listeners
    });
    animController.reset(); // Eventually reset the animation
    animController.repeat(reverse: true); // Start the animation
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // Builder == what objects do we animate and how
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        // To shake == translate
        return Transform.translate(
          // animation.value curving between 0 and 1
          offset: Offset(
              0,
              animation.value *
                  10), // drag the image along our rail axis based on our curve
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    animation.removeListener(() {}); // clean up listeners
    animController.dispose(); // dispose controller
    super.dispose(); // then let flutter cleanup
  }
}
