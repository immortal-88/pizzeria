import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

class Bill extends StatelessWidget {
  final double totalPrice;
  const Bill(this.totalPrice, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Insets.lg,
          right: Insets.lg,
          top: Insets.lg,
          bottom: Insets.lgx),
      color: CupertinoColors.lightBackgroundGray,
      child: Column(
        children: [
          Row(
            // mainAxisAlignment:
            //     MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal',
                  style: TextStyle(
                      fontSize: FontSizes.s11,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w300)),
              Expanded(
                  child: Text(
                ' . ' * 100,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey),
              )),
              Text('\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: FontSizes.s11,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w300)),
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            // mainAxisAlignment:
            //     MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery ',
                  style: TextStyle(
                      fontSize: FontSizes.s11,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w300)),
              Expanded(
                  child: Text(
                ' . ' * 100,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey),
              )),
              Text('Free',
                  style: TextStyle(
                      fontSize: FontSizes.s11,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w300)),
            ],
          ),
        ],
      ),
    );
  }
}
