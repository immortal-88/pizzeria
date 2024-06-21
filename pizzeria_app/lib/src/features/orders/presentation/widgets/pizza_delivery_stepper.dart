import 'package:flutter/material.dart';
import 'package:pizzeria_app/src/features/orders/presentation/widgets/custom_color_pulse.dart';
import 'package:sizer/sizer.dart';

class PizzaDeliveryStepper extends StatelessWidget {
  final int steps;
  final int currentStep;

  const PizzaDeliveryStepper({
    required this.steps,
    required this.currentStep,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: steps,
        itemBuilder: (context, index) {
          Color stepColor = Colors.grey.withOpacity(0.2);

          if (index < currentStep) {
            // Set color for steps before currentStep
            stepColor = Colors.green;
          } else if (index == currentStep) {
            // Set color for currentStep
            stepColor = Colors.red;
          }

          return index == currentStep
              ? CustomColorPulse(
                  isCurrentStep: index == currentStep,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    width: 60.w / steps,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      color: stepColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              : Container(
                  width: 78.w / steps,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: stepColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
        },
      ),
    );
  }
}
