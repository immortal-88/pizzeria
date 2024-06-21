import 'package:flutter/material.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const SocialLoginButton(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(width: 3.w),
          Text(text,
              style: TextStyle(
                  fontSize: FontSizes.s10, fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
