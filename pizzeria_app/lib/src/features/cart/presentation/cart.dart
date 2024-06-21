import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/common/common_widgets/address_bottom_sheet.dart';
import 'package:pizzeria_app/src/common/common_widgets/big_button.dart';
import 'package:pizzeria_app/src/common/common_widgets/select_button.dart';
import 'package:pizzeria_app/src/common/common_widgets/zigzag_clipper.dart';
import 'package:pizzeria_app/src/features/cart/data/services/cart_service.dart';
import 'package:pizzeria_app/src/features/cart/presentation/widgets/bill.dart';
import 'package:pizzeria_app/src/features/cart/presentation/widgets/cart_item.dart';
import 'package:pizzeria_app/src/features/cart/presentation/widgets/promo_bottom_sheet.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_app/src/utils/theme.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

enum PromoType { halfDiscount, firstOrder, secondOrder }

class Promo {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final PromoType type;
  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.imageUrl});
}

final promos = [
  Promo(
      id: '1',
      title: 'Get 20% off on your first order',
      type: PromoType.firstOrder,
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-long-banner-design-template-4c6d60464b0d6b6b27ca279e850cc68b_screen.jpg?ts=1621932699',
      description: 'Use code: FIRSTORDER'),
  Promo(
      id: '2',
      title: 'Get 10% off on your second order',
      type: PromoType.secondOrder,
      imageUrl:
          'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-facebook-advertisement-red-and-white-design-template-4dc11ca007ab51d3123225d4c49acf38_screen.jpg?ts=1596368320',
      description: 'Use code: SECONDOFFER'),
];

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartInfo = ref.watch(cartServiceProvider);
    final selectedPromo = ref.watch(selectedPromoProvider);

    final appState = ref.watch(appStateProvider);
    final user = (appState as Authorized).login;

    final cart = useState<List<OrderItem>>(cartInfo);
    final totalPrice = useState(cart.value.fold<double>(
        0, (previousValue, element) => previousValue + element.price));
    final isLoading = useState(false);

    double calcPrice(OrderItem item, int quantity) {
      final pricePerItem = item.price / item.quantity;
      return pricePerItem * quantity;
    }

    // useEffect(() {
    //   if (cart.value.isEmpty) {
    //     Future.delayed(const Duration(milliseconds: 2000), () {
    //       GoRouter.of(context).pop();
    //     });
    //   }

    //   return null;
    // }, [cart.value]);

    return Theme(
      data: AppTheme.themeData,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Text('Your Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSizes.s12,
                  fontWeight: FontWeight.bold)),
          actions: [
            if (cart.value.isNotEmpty)
              TextButton.icon(
                  onPressed: () {
                    ref.read(cartServiceProvider.notifier).clearCart();
                    ref.read(selectedPromoProvider.notifier).state = null;

                    cart.value = [];
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  label: const Text('Clear'),
                  icon: const Icon(Icons.delete, size: 18)),
            IconButton(
                onPressed: () {
                  // GoRouter.of(context).pop();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close)),
          ],
        ),
        body: cart.value.isNotEmpty
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              StatefulBuilder(
                                  builder: (context, setState) => CartItem(
                                        item: cart.value[index],
                                        onDecrease: () {
                                          if (cart.value[index].quantity > 1) {
                                            setState(() {
                                              cart.value[index] =
                                                  cart.value[index].copyWith(
                                                      quantity: cart
                                                              .value[index]
                                                              .quantity -
                                                          1,
                                                      price: calcPrice(
                                                          cart.value[index],
                                                          cart.value[index]
                                                                  .quantity -
                                                              1));
                                              cart.value[index] =
                                                  cart.value[index].copyWith(
                                                      price: calcPrice(
                                                          cart.value[index],
                                                          cart.value[index]
                                                              .quantity));
                                              totalPrice.value = cart.value
                                                  .fold(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          element.price);
                                            });
                                          } else {
                                            setState(() {
                                              ref
                                                  .read(cartServiceProvider
                                                      .notifier)
                                                  .removeFromCart(
                                                      cart.value[index].id);

                                              cart.value = [...cart.value]
                                                ..removeAt(index);
                                              totalPrice.value = cart.value
                                                  .fold(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          element.price);
                                            });
                                          }
                                        },
                                        onIncrease: () {
                                          if (cart.value[index].quantity < 10) {
                                            setState(() {
                                              cart.value[index] =
                                                  cart.value[index].copyWith(
                                                      quantity: cart
                                                              .value[index]
                                                              .quantity +
                                                          1,
                                                      price: calcPrice(
                                                          cart.value[index],
                                                          cart.value[index]
                                                                  .quantity +
                                                              1));
                                              totalPrice.value = cart.value
                                                  .fold(
                                                      0,
                                                      (previousValue,
                                                              element) =>
                                                          previousValue +
                                                          element.price);
                                            });
                                          }
                                        },
                                      )),
                              SizedBox(height: 2.h),
                            ],
                          );
                        },
                        itemCount: cart.value.length),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: Insets.lg, vertical: Insets.lg),
                      child: BigButton(
                          text: selectedPromo?.type != null
                              ? '${selectedPromo?.title}'
                              : 'Select Promo Code',
                          isGradient: true,
                          icon: FontAwesomeIcons.tag,
                          gradientColors: const [
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                          onTap: () {
                            openPromo(context, promos, ref);
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: Insets.lg),
                        child: SelectButton(
                            text: 'Select location',
                            onTap: () {
                              openAddress(context, ref);
                            })),
                    SizedBox(height: 2.h),
                    // Divider(
                    //   height: 1,
                    //   thickness: 1,
                    //   color: Colors.grey.shade400,
                    // ),
                    SizedBox(height: Insets.lg),
                    // const Divider(
                    //   height: 2,
                    //   thickness: 1,
                    //   color: Colors.white,
                    // ),
                    SizedBox(
                        width: double.infinity,
                        child: ClipPath(
                            clipper: ZigZagClipper(),
                            child: Bill(totalPrice.value))),
                    SizedBox(height: 2.h),
                  ],
                ),
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty-cart.png',
                      width: 50.w, height: 50.w),
                  Text('Your cart is empty',
                      style: TextStyle(fontSize: FontSizes.s10)),
                ],
              )),
        bottomNavigationBar: cart.value.isNotEmpty
            ? SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: Insets.med),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Text(
                              'Total: \$${totalPrice.value.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: FontSizes.s16,
                                  fontWeight: FontWeight.bold))),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(right: Insets.lgx),
                          child: BigButton(
                            isLoading: isLoading.value,
                            isGradient: true,
                            gradientColors: [
                              Colors.orange.shade500,
                              Colors.red.shade300,
                            ],
                            onTap: () {
                              ref
                                  .read(cartServiceProvider.notifier)
                                  .sendOrder(Order(
                                    createdAt: DateTime.now(),
                                    items: cart.value,
                                    clientInfo: ClientInfo(
                                        id: user.userId,
                                        firstName: user.firstName,
                                        lastName: user.lastName,
                                        phoneNumber: ''),
                                    totalCost: totalPrice.value,
                                  ));

                              Future.delayed(const Duration(milliseconds: 2000),
                                  () {
                                isLoading.value = true;
                                ref
                                    .read(cartServiceProvider.notifier)
                                    .clearCart();
                                ref.read(selectedPromoProvider.notifier).state =
                                    null;
                                cart.value = [];

                                // Move the pop inside the delayed callback
                                Navigator.of(context).pop();
                              });

                              isLoading.value = false;
                            },
                            text: 'Checkout ',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
