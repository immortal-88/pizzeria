import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/common_widgets/big_button.dart';
import 'package:pizzeria_app/src/features/cart/data/services/cart_service.dart';
import 'package:pizzeria_app/src/features/pizzas/presentation/widgets/pizza_tile.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

class SizeButtonInfo {
  final String text;
  final bool isSelected;
  final SizeInfo? size;
  final CrustInfo? crust;

  SizeButtonInfo(
      {required this.text, required this.isSelected, this.crust, this.size});
}

class PizzaPage extends HookConsumerWidget {
  final PizzaInfo pizzaInfo;
  const PizzaPage(this.pizzaInfo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.read(cartServiceProvider.notifier);

    final sizeOptions = useState<List<SizeButtonInfo>>([
      SizeButtonInfo(text: 'M', size: SizeInfo.medium, isSelected: true),
      SizeButtonInfo(text: 'L', size: SizeInfo.large, isSelected: false),
      SizeButtonInfo(text: 'XL', size: SizeInfo.xlarge, isSelected: false),
      SizeButtonInfo(text: 'XXL', size: SizeInfo.xxlarge, isSelected: false)
    ]);
    final dough = useState<List<SizeButtonInfo>>([
      SizeButtonInfo(
          text: 'Thick crust', crust: CrustInfo.thick, isSelected: true),
      SizeButtonInfo(text: 'Thin', crust: CrustInfo.thin, isSelected: false),
      SizeButtonInfo(
          text: 'Philadelphia',
          crust: CrustInfo.philadelphia,
          isSelected: false),
      SizeButtonInfo(
          text: 'Hot Dog Crust', crust: CrustInfo.hotdog, isSelected: false),
    ]);
    final quantity = useState(1);
    final defaultIngredients = useState<List<OrderIngredient>>([]);
    final ingredients = useState<List<OrderIngredient>>([]);

    useEffect(() {
      defaultIngredients.value = pizzaInfo.ingredients
          .map((e) =>
              OrderIngredient(ingredient: e, quantity: 1, price: e.price))
          .toList();
      ingredients.value = defaultIngredients.value;

      return () {};
    }, const []);

    final item = useState<OrderItem?>(OrderItem(
        id: pizzaInfo.id,
        name: pizzaInfo.name,
        price: pizzaInfo.price,
        imageUrl: pizzaInfo.imageUrl,
        type: ProductType.pizza,
        size: SizeInfo.medium,
        crust: CrustInfo.thick,
        ingredients: ingredients.value,
        quantity: quantity.value));

    double calcPrice(double basePrice) {
      // If there's no specific item, calculate based on size, crust, and quantity
      double sizeMultiplier = 1.0;

      switch (item.value?.size) {
        case SizeInfo.medium:
          sizeMultiplier = 1.0;
          break;
        case SizeInfo.large:
          sizeMultiplier = 1.5;
          break;
        case SizeInfo.xlarge:
          sizeMultiplier = 2.0;
          break;
        case SizeInfo.xxlarge:
          sizeMultiplier = 2.5;
          break;
        default:
          sizeMultiplier = 1.0;
          break;
      }

      double crustMultiplier = 1.0;

      // Assuming you have a crust property in your item, adjust accordingly
      switch (item.value?.crust) {
        case CrustInfo.thin:
          crustMultiplier = 1.0;
          break;
        case CrustInfo.thick:
          crustMultiplier = 1.0;
          break;
        case CrustInfo.philadelphia:
          crustMultiplier = 1.5;
          break;
        case CrustInfo.hotdog:
          crustMultiplier = 1.5;
          break;
        default:
          crustMultiplier = 1.0;
          break;
      }

      if (item.value != null) {
        item.value = item.value!.copyWith(
            price:
                basePrice * sizeMultiplier * crustMultiplier * quantity.value);
        // If there's a specific item, calculate based on its quantity
        basePrice * item.value!.quantity;
      }

      // Calculate the final price
      log('🍕 Calculated price: ${basePrice * sizeMultiplier * crustMultiplier * quantity.value}');
      return (basePrice * sizeMultiplier * crustMultiplier * quantity.value);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Pizza details',
            style: TextStyle(
                fontSize: FontSizes.s12,
                fontWeight: FontWeight.bold,
                color: Colors.black54)),
        leading: MaterialButton(
            elevation: 0,
            padding: const EdgeInsets.all(5.0),
            shape: const CircleBorder(),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              // size: 20,
              color: Colors.black54,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 42.h,
                    child: Hero(
                      tag: pizzaInfo.id,
                      child: CachedNetworkImage(
                        imageUrl: pizzaInfo.imageUrl,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    pizzaInfo.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        fadeInDuration: Duration.zero,
                        fadeOutDuration: Duration.zero,
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     bottom: 10,
                  //     left: 10,
                  //     child: IconButton(
                  //       onPressed: () {
                  //         if (quantity.value > 1) {
                  //           quantity.value--;
                  //           item.value =
                  //               item.value?.copyWith(quantity: quantity.value);
                  //           calcPrice(pizzaInfo.price);
                  //           print('🍕 Item: ${item.value}');
                  //         }
                  //       },
                  //       icon: Icon(FontAwesomeIcons.caretLeft,
                  //           color: Colors.orange.withOpacity(.5), size: 30),
                  //     )),
                  // Positioned(
                  //     bottom: 10,
                  //     right: 10,
                  //     child: IconButton(
                  //       onPressed: () {
                  //         if (quantity.value > 1) {
                  //           quantity.value--;
                  //           item.value =
                  //               item.value?.copyWith(quantity: quantity.value);
                  //           calcPrice(pizzaInfo.price);
                  //           print('🍕 Item: ${item.value}');
                  //         }
                  //       },
                  //       icon: Icon(
                  //         FontAwesomeIcons.caretRight,
                  //         color: Colors.orange.withOpacity(.5),
                  //         size: 30,
                  //       ),
                  //     )),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Insets.lgx, vertical: Insets.lg),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(pizzaInfo.name,
                              style: TextStyle(
                                  fontSize: FontSizes.s16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 0.5.h),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.solidStar,
                                size: 14,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '${pizzaInfo.rating}',
                                style: TextStyle(fontSize: FontSizes.s9),
                              ),
                            ],
                          ),
                          SizedBox(width: 2.w),
                          const PizzaChip(
                              color: Colors.red,
                              text: 'Spicy',
                              icon: FontAwesomeIcons.pepperHot),
                          SizedBox(width: 2.w),
                          Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.weightScale,
                                size: 14,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 1.w),
                              Text(
                                '${pizzaInfo.weight} g',
                                style: TextStyle(
                                    fontSize: FontSizes.s9,
                                    color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ],
                      )
                      // SizedBox(height: 2.h),

                      // SizedBox(height: 2.h),
                      // Text(pizzaInfo.description,
                      //     style:
                      //         TextStyle(fontSize: 9.sp, color: Colors.grey.shade700)),
                    ]),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: Insets.lgx, vertical: Insets.sm),
              //   child: Text(pizzaInfo.description,
              //       style: TextStyle(fontSize: FontSizes.s10)),
              // ),

              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.lgx, vertical: Insets.sm),
                      child: Text('Size',
                          style: TextStyle(
                              fontSize: FontSizes.s11,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      // width: 100.w,
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeOptions.value.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index != 0 ? Insets.med : 0,
                                    right: index != sizeOptions.value.length - 1
                                        ? Insets.med
                                        : 0),
                                child: SizeButton(
                                    text: sizeOptions.value[index].text,
                                    isSelected:
                                        sizeOptions.value[index].isSelected,
                                    onTap: () {
                                      sizeOptions.value = List.generate(
                                          sizeOptions.value.length,
                                          (i) => SizeButtonInfo(
                                              text: sizeOptions.value[i].text,
                                              size: sizeOptions.value[i].size,
                                              isSelected: i == index));
                                      item.value = item.value?.copyWith(
                                        size: sizeOptions.value[index].size!,
                                      );
                                      calcPrice(pizzaInfo.price);
                                      print(
                                          'size: ${sizeOptions.value[index].size}');
                                      print('🍕 Item: ${item.value}');
                                    }),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //   flex: 2,
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: Insets.lgx, vertical: Insets.sm),
                  //     child: Text('Dough',
                  //         style: TextStyle(
                  //             fontSize: FontSizes.s10,
                  //             fontWeight: FontWeight.bold)),
                  //   ),
                  // ),
                  Center(
                    child: CustomSlidingSegmentedControl<int>(
                      initialValue: 1,
                      children: {
                        1: Text(dough.value[0].text),
                        2: Text(dough.value[1].text),
                        3: Text(dough.value[2].text),
                        4: Text(dough.value[3].text),
                      },
                      decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInToLinear,
                      onValueChanged: (v) {
                        dough.value = List.generate(
                            dough.value.length,
                            (i) => SizeButtonInfo(
                                text: dough.value[i].text,
                                crust: dough.value[i].crust,
                                isSelected: i == v));
                        item.value = item.value
                            ?.copyWith(crust: dough.value[v - 1].crust);
                        calcPrice(pizzaInfo.price);
                        print('crust: ${dough.value[v - 1].crust}');
                        print('🍕 Item: ${item.value}');
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Insets.lgx, vertical: Insets.sm),
                    child: Text('Ingredients',
                        style: TextStyle(
                            fontSize: FontSizes.s11,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Insets.lg),
                    child: ElevatedButton(
                      onPressed: () {
                        ingredients.value = defaultIngredients.value;
                        log('🍕 Ingredients: ${ingredients.value}');
                      },
                      style: ElevatedButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          elevation: 0,
                          backgroundColor: Colors.orange.shade300,
                          foregroundColor: Colors.white),
                      child: Text('Reset',
                          style: TextStyle(
                              fontSize: FontSizes.s10,
                              fontWeight: FontWeight.w800)),
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Flexible(
                    // height: 10.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.medx),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ingredients.value.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: Insets.medx),
                          child: IngredientRow(
                            ingredient: ingredients.value[index].ingredient,
                            quantity: ingredients.value[index].quantity,
                            onDecrement: () {
                              final updatedIngredients =
                                  List<OrderIngredient>.from(ingredients.value);

                              if (updatedIngredients[index].quantity > 1) {
                                updatedIngredients[index] =
                                    updatedIngredients[index].copyWith(
                                        quantity:
                                            updatedIngredients[index].quantity -
                                                1);
                              } else {
                                updatedIngredients.removeAt(index);
                              }

                              ingredients.value = updatedIngredients;
                              item.value = item.value
                                  ?.copyWith(ingredients: ingredients.value);
                              log('🍕 Ingredients: ${ingredients.value}');
                            },
                            onIncrement: () {
                              final updatedIngredients =
                                  List<OrderIngredient>.from(ingredients.value);

                              if (updatedIngredients[index].quantity < 3) {
                                updatedIngredients[index] =
                                    updatedIngredients[index].copyWith(
                                        quantity:
                                            updatedIngredients[index].quantity +
                                                1);
                              }

                              ingredients.value = updatedIngredients;
                              item.value = item.value
                                  ?.copyWith(ingredients: ingredients.value);
                              log('🍕 Ingredients: ${ingredients.value}');
                            },
                          ),
                        ),
                      ),

                      // ListView(children: [
                      //   for (final ingredient in pizzaInfo.ingredients)
                      //     // PizzaChip(
                      //     //   text: ingredient.name,
                      //     //   color: CupertinoColors.systemRed,
                      //     // )
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: Insets.xs),
                      //       child: Chip(
                      //         // avatar: const Icon(FontAwesomeIcons.pepperHot,
                      //         //     size: 12, color: CupertinoColors.systemRed),
                      //         label: Text(ingredient.name),
                      //         // labelPadding: EdgeInsets.only(left: 0, right: Insets.xs),
                      //         side: const BorderSide(
                      //             color: CupertinoColors.lightBackgroundGray),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20),
                      //         ),
                      //         visualDensity: VisualDensity.compact,
                      //         padding: EdgeInsets.all(Insets.xs),
                      //       ),
                      //     )
                      // ]),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       flex: 2,
                      //       child: Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             horizontal: Insets.lgx, vertical: Insets.sm),
                      //         child: Text('Crust',
                      //             style: TextStyle(
                      //                 fontSize: FontSizes.s10,
                      //                 fontWeight: FontWeight.bold)),
                      //       ),
                      //     ),
                      //     Expanded(
                      //         flex: 5,
                      //         child: CustomSlidingSegmentedControl<int>(
                      //           initialValue: 1,
                      //           children: {
                      //             1: Text(crust.value[0].text),
                      //             2: Text(crust.value[1].text),
                      //           },
                      //           decoration: BoxDecoration(
                      //             color: CupertinoColors.lightBackgroundGray,
                      //             borderRadius: BorderRadius.circular(8),
                      //           ),
                      //           thumbDecoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(6),
                      //           ),
                      //           duration: const Duration(milliseconds: 100),
                      //           curve: Curves.easeInToLinear,
                      //           onValueChanged: (v) {
                      //             print(v);
                      //           },
                      //         )),
                      //   ],
                      // ),

                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: Insets.lgx, vertical: Insets.sm),
                      //   child: Text('Our works',
                      //       style: TextStyle(
                      //           fontSize: FontSizes.s12, fontWeight: FontWeight.bold)),
                      // ),
                      // SizedBox(
                      //   height: 20.h,
                      //   child: ListView(
                      //     scrollDirection: Axis.horizontal,
                      //     children: [
                      //       Container(
                      //         width: 40.w,
                      //         padding: EdgeInsets.only(left: Insets.lgx, right: Insets.sm),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: const Image(
                      //             image: NetworkImage(
                      //                 'https://i.pinimg.com/564x/9b/fd/9c/9bfd9c3f280b3b69444207f0b8f5224e.jpg'),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width: 40.w,
                      //         padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: const Image(
                      //             image: NetworkImage(
                      //                 'https://i.pinimg.com/564x/0e/f5/59/0ef559ce80b0f132251f8343311335c4.jpg'),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //       Container(
                      //         width: 40.w,
                      //         padding: EdgeInsets.only(right: Insets.lgx, left: Insets.sm),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: const Image(
                      //             image: NetworkImage(
                      //                 'https://i.pinimg.com/736x/8b/b9/30/8bb930e88179afaac80ea86866241447.jpg'),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: Insets.lgx, vertical: Insets.sm),
              //   child: Text('Reviews',
              //       style: TextStyle(
              //           fontSize: FontSizes.s12, fontWeight: FontWeight.bold)),
              // ),
              // if (data.reviews.isNotEmpty)
              //   SizedBox(
              //     // width: 100.w,
              //     height: 20.h,
              //     child: PageView.builder(
              //       // shrinkWrap: true,
              //       padEnds: false,
              //       scrollDirection: Axis.horizontal,
              //       controller: PageController(
              //         viewportFraction: 0.8,
              //         initialPage: 0,
              //       ),
              //       itemBuilder: (context, index) {
              //         print(data.reviews);
              //         print(data.reviews.length);

              //         return ReviewBox(review: data.reviews[index]);
              //       },
              //       itemCount: data.reviews.length,
              //     ),
              //   )
            ]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: Insets.lg, top: Insets.med),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                        focusColor: Colors.grey.shade400,
                        iconSize: 15,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                CupertinoColors.lightBackgroundGray)),
                        onPressed: () {
                          if (quantity.value > 1) {
                            quantity.value--;
                            item.value =
                                item.value?.copyWith(quantity: quantity.value);
                            calcPrice(pizzaInfo.price);
                            print('🍕 Item: ${item.value}');
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.minus,
                            color: Colors.black)),
                    SizedBox(
                        width: 5.w,
                        child: Text(
                          '${quantity.value}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: FontSizes.s12,
                              fontWeight: FontWeight.bold),
                        )),
                    IconButton.filled(
                        iconSize: 15,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.orange.withOpacity(.4))),
                        onPressed: () {
                          if (quantity.value < 10) {
                            quantity.value++;
                            item.value =
                                item.value?.copyWith(quantity: quantity.value);
                            calcPrice(pizzaInfo.price);

                            print('🍕 Item: ${item.value}');
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.plus,
                            color: Colors.black)),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Insets.lg),
                    height: 60,
                    child: BigButton(
                        isGradient: true,
                        gradientColors: [
                          Colors.orange.shade500,
                          Colors.red.shade300,
                        ],
                        text:
                            'Order for \$${calcPrice(pizzaInfo.price).toStringAsFixed(2)}',
                        onTap: quantity.value > 0
                            ? () {
                                log('🍕 Item: ${item.value}');
                                calcPrice(pizzaInfo.price);

                                cart.addToCart(item.value!);
                                GoRouter.of(context).pop();
                              }
                            : null)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;
  final double? width;
  const SizeButton(
      {super.key,
      required this.text,
      this.width,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 10.w,
        height: 10.w,
        padding:
            EdgeInsets.symmetric(horizontal: Insets.xs, vertical: Insets.xs),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.white : CupertinoColors.lightBackgroundGray,
          border: Border.all(
              color: CupertinoColors.lightBackgroundGray,
              width: isSelected ? 2 : 1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: FontSizes.s11,
                color: isSelected ? Colors.black : Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

class IngredientChip extends StatelessWidget {
  final Color color;
  final String text;
  final IconData? icon;

  const IngredientChip(
      {super.key, this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 0, maxWidth: 30.w),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.sm, vertical: Insets.xs / 2),
        decoration: BoxDecoration(
            color: color.withOpacity(.2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 5),
            Text(text,
                style: TextStyle(
                    fontSize: FontSizes.s7,
                    fontWeight: FontWeight.w600,
                    color: color))
          ],
        ),
      ),
    );
  }
}

class IngredientRow extends StatelessWidget {
  final Ingredient ingredient;
  final int quantity;
  final Function() onIncrement;
  final Function() onDecrement;

  const IngredientRow(
      {super.key,
      required this.ingredient,
      required this.quantity,
      required this.onDecrement,
      required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // const Icon(FontAwesomeIcons.pepperHot,
            //     size: 12, color: CupertinoColors.systemRed),
            // SizedBox(width: 5.w),
            Text(
              ingredient.name,
              style: TextStyle(
                  fontSize: FontSizes.s10, color: Colors.black.withOpacity(.6)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton.filled(
                focusColor: Colors.grey.shade400,
                iconSize: 15,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        CupertinoColors.lightBackgroundGray)),
                onPressed: onDecrement,
                icon: const Icon(FontAwesomeIcons.minus, color: Colors.black)),
            SizedBox(
                width: 5.w,
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: FontSizes.s12, fontWeight: FontWeight.bold),
                )),
            IconButton.filled(
                iconSize: 15,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.orange.withOpacity(.4))),
                onPressed: onIncrement,
                icon: const Icon(FontAwesomeIcons.plus, color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
