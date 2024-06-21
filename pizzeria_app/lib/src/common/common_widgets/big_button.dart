import 'package:flutter/material.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

class BigButton extends StatelessWidget {
  final String text;
  final bool isGradient;
  final IconData? icon;
  final IconData? suffixIcon;
  final List<Color>? gradientColors;
  final bool? isLoading;
  final Function()? onTap;

  const BigButton({
    super.key,
    this.icon,
    this.suffixIcon,
    this.isGradient = false,
    this.gradientColors,
    this.isLoading = false,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: isGradient
              ? LinearGradient(
                  colors: gradientColors ?? [],
                )
              : null,
          borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isGradient ? Colors.transparent : Colors.orange.withOpacity(.8),
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: Insets.lg),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onTap,
        label: isLoading ?? false
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSizes.s12,
                    fontWeight: FontWeight.bold),
              ),
        icon: icon != null
            ? Icon(
                icon,
                color: Colors.white,
              )
            : const SizedBox(),
      ),
    );
  }
}
