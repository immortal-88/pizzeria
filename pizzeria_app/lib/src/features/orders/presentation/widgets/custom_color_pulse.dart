import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomColorPulse extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool isCurrentStep;

  const CustomColorPulse({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.isCurrentStep = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomColorPulseState createState() => _CustomColorPulseState();
}

class _CustomColorPulseState extends State<CustomColorPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: widget.isCurrentStep ? Colors.orange : Colors.transparent,
      end: widget.isCurrentStep
          ? Colors.orange.withOpacity(0.3)
          : Colors.transparent,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: widget.isCurrentStep
              ? BorderRadius.circular(10.0)
              : BorderRadius.circular(0.0), // Apply border radius conditionally
          child: Container(
            width: 100.w / 5, // Adjust as needed
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
