import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget(
      {super.key, required this.child, required this.duration});
  final Widget child;
  final Duration duration;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // see SingleTickerProviderStateMixin
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
    animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    animation.addListener(() {
      if (mounted) setState(() {});
    });
    controller.reset();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        // To shake == translate
        return Transform.translate(
          // animation.value between 0 and 1
          offset: Offset(0, animation.value * 10),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    animation.removeListener(() {});
    controller.dispose();
    super.dispose();
  }
}
