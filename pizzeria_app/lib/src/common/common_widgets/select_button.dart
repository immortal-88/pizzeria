import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

class SelectButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SelectButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.lg),
          decoration: BoxDecoration(
              color: CupertinoColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: FontSizes.s11,
                  )),
              const Icon(FontAwesomeIcons.chevronRight,
                  size: 14, color: Colors.grey)
            ],
          )),
    );
  }
}
