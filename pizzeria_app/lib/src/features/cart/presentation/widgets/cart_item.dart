import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

class CartItem extends HookConsumerWidget {
  final OrderItem item;
  final Function()? onIncrease;
  final Function()? onDecrease;
  final bool? withButtons;
  final bool? isOrder;
  const CartItem(
      {super.key,
      this.onIncrease,
      this.onDecrease,
      this.withButtons = true,
      this.isOrder = false,
      required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = item.ingredients?.map((e) => e).toList();
    final ingredientsString = ingredients != null && ingredients.isNotEmpty
        ? ingredients
            .map((e) =>
                '${e.quantity > 1 ? '${e.quantity} x ' : ''}${e.ingredient.name}')
            .join(', ')
        : null;
    return Row(children: [
      Expanded(
        flex: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.sm),
          child: CircleAvatar(
            radius: 60,
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              placeholder: (context, url) => const SizedBox(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name,
                    style: TextStyle(
                        fontSize: FontSizes.s11, fontWeight: FontWeight.bold)),
                if (isOrder! && item.quantity > 1)
                  Padding(
                    padding: EdgeInsets.only(right: Insets.medx),
                    child: Text(' x${item.quantity}',
                        style: TextStyle(
                            fontSize: FontSizes.s11,
                            fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            SizedBox(height: 1.h),
            RichText(
                text: TextSpan(
                    text: 'Size: ',
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                      text: item.size.value.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black))
                ])),
            RichText(
                text: TextSpan(
                    text: 'Crust: ',
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                    children: [
                  TextSpan(
                      text: item.crust?.value.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black))
                ])),
            if (item.ingredients?.isNotEmpty == true)
              RichText(
                  text: TextSpan(
                      text: 'Ingredients: ',
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                      children: [
                    TextSpan(
                        text: '$ingredientsString',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black))
                  ])),
            SizedBox(height: 1.h),
            if (withButtons!)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.filled(
                            focusColor: Colors.grey.shade400,
                            iconSize: 10,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    CupertinoColors.lightBackgroundGray)),
                            onPressed: onDecrease,
                            icon: const Icon(FontAwesomeIcons.minus,
                                color: Colors.black)),
                        SizedBox(
                            width: 5.w,
                            child: Text(
                              '${item.quantity}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: FontSizes.s12,
                                  fontWeight: FontWeight.bold),
                            )),
                        IconButton.filled(
                            iconSize: 10,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.withOpacity(.4))),
                            onPressed: onIncrease,
                            icon: const Icon(FontAwesomeIcons.plus,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: Insets.lgx),
                    child: Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: FontSizes.s14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    ]);
  }
}
