import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/common/common_widgets/zigzag_clipper.dart';
import 'package:pizzeria_app/src/features/cart/presentation/widgets/bill.dart';
import 'package:pizzeria_app/src/features/cart/presentation/widgets/cart_item.dart';
import 'package:pizzeria_app/src/features/orders/presentation/controllers/orders_controller.dart';
import 'package:pizzeria_app/src/features/orders/presentation/widgets/pizza_delivery_stepper.dart';
import 'package:pizzeria_app/src/utils/order_utils.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

class OrdersHistoryPage extends HookConsumerWidget {
  const OrdersHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final userId = (appState as Authorized).login.userId;
    final orders = ref.watch(ordersControllerProvider(userId));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Text(
          'Orders History',
          style: TextStyle(
            color: Colors.black,
            fontSize: FontSizes.s12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: orders.when(
        data: (data) {
          final actualOrders = data.where((order) {
            return OrderUtils.mockDeliveryProgress(order.createdAt) ==
                OrderStatus.completed;
          }).toList();

          final widget = (actualOrders.isNotEmpty)
              ? ListView.builder(
                  itemCount: actualOrders.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final status =
                        OrderUtils.mockDeliveryProgress(data[index].createdAt);

                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Insets.med, vertical: 0),
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.5),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            border:
                                Border.all(color: Colors.grey.withOpacity(.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Insets.med,
                                      horizontal: Insets.lg,
                                    ),
                                    child: Text(
                                      'Order Number: ${actualOrders[index].orderNumber}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: FontSizes.s10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Insets.med,
                                      horizontal: Insets.lg,
                                    ),
                                    child: const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        FontAwesomeIcons.check,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: Insets.lg),
                                      child: Text(
                                        DateFormat('MMM d, y HH:mm').format(
                                            actualOrders[index].createdAt),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: FontSizes.s8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))),
                              if (status != OrderStatus.completed)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Insets.med,
                                    horizontal: Insets.sm,
                                  ),
                                  child: Container(
                                    width: 100.w,
                                    height: 6,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Insets.sm,
                                    ),
                                    child: const PizzaDeliveryStepper(
                                        steps: 5, currentStep: 0),
                                  ),
                                ),
                              SizedBox(height: Insets.med),
                              Column(
                                children: actualOrders[index].items.map((item) {
                                  return Column(
                                    children: [
                                      CartItem(
                                          item: item,
                                          withButtons: false,
                                          isOrder: true),
                                      SizedBox(height: Insets.med),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Insets.med),
                          width: double.infinity,
                          child: ClipPath(
                            clipper: ZigZagClipper(),
                            child:
                                Bill(actualOrders[index].totalCost.toDouble()),
                          ),
                        ),
                        SizedBox(height: Insets.lgx),
                      ],
                    );
                  })
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/out-of-stock.png',
                        width: 50.w,
                        height: 50.w,
                      ),
                      Text('Your orders are empty',
                          style: TextStyle(fontSize: FontSizes.s10)),
                    ],
                  ),
                );

          return widget;
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
