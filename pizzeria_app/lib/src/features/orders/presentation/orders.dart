import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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

class OrdersPage extends HookConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final userId = appState is Authorized ? (appState).login.userId : '';
    final orders = ref.watch(ordersControllerProvider(userId));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Your Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: FontSizes.s12,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: Insets.medx),
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/orders_history');
              },
              style: ElevatedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  elevation: 0,
                  backgroundColor: Colors.orange.shade300,
                  foregroundColor: Colors.white),
              child: Text('History',
                  style: TextStyle(
                      fontSize: FontSizes.s10, fontWeight: FontWeight.w800)),
            ),
          )
        ],
      ),
      body: orders.when(
        data: (data) {
          final actualOrders = data.where((order) {
            return OrderUtils.mockDeliveryProgress(order.createdAt) !=
                OrderStatus.completed;
          }).toList();

          print('Actual Orders: $actualOrders');

          // final widget = (actualOrders.isNotEmpty)
          //     ? ListView.builder(
          //         itemCount: actualOrders.length,
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           final status = OrderUtils.mockDeliveryProgress(
          //               actualOrders[index].createdAt);
          //           final statusInfo =
          //               OrderUtils.getOrderStatusTitleAndDescription(status);

          //           print('Status: $status');

          //           return Column(
          //             children: [
          //               Container(
          //                 margin: EdgeInsets.symmetric(
          //                     horizontal: Insets.med, vertical: 0),
          //                 padding: EdgeInsets.symmetric(
          //                     vertical: 1.h, horizontal: 0),
          //                 decoration: BoxDecoration(
          //                   color: Colors.white.withOpacity(.5),
          //                   borderRadius: const BorderRadius.only(
          //                     topLeft: Radius.circular(20.0),
          //                     topRight: Radius.circular(20.0),
          //                   ),
          //                   border:
          //                       Border.all(color: Colors.grey.withOpacity(.3)),
          //                 ),
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.center,
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Padding(
          //                             padding: EdgeInsets.symmetric(
          //                               vertical: Insets.med,
          //                               horizontal: Insets.lg,
          //                             ),
          //                             child: Text(
          //                               'Order Number: ${actualOrders[index].orderNumber}',
          //                               style: TextStyle(
          //                                 color: Colors.black,
          //                                 fontSize: FontSizes.s10,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                         Align(
          //                           alignment: Alignment.topRight,
          //                           child: Container(
          //                             margin: EdgeInsets.only(
          //                                 right: Insets.lg,
          //                                 top: Insets.sm,
          //                                 bottom: Insets.sm),
          //                             padding: EdgeInsets.symmetric(
          //                               vertical: Insets.xs,
          //                               horizontal: Insets.sm,
          //                             ),
          //                             decoration: BoxDecoration(
          //                               color: Colors.orange,
          //                               borderRadius:
          //                                   BorderRadius.circular(20.0),
          //                             ),
          //                             child: Text(
          //                               statusInfo['title'] as String,
          //                               style: TextStyle(
          //                                 fontWeight: FontWeight.bold,
          //                                 color: Colors.white,
          //                                 fontSize: FontSizes.s10,
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),

          //                     Padding(
          //                       padding: EdgeInsets.symmetric(
          //                         vertical: Insets.med,
          //                         horizontal: Insets.sm,
          //                       ),
          //                       child: Container(
          //                         width: 100.w,
          //                         height: 6,
          //                         padding: EdgeInsets.symmetric(
          //                           horizontal: Insets.sm,
          //                         ),
          //                         child: PizzaDeliveryStepper(
          //                             steps: 5,
          //                             currentStep:
          //                                 OrderUtils.setOrderStep(status)),
          //                       ),
          //                     ),
          //                     // SizedBox(height: Insets.med),
          //                     // if (status != OrderStatus.completed)
          //                     Row(
          //                       children: [
          //                         Container(
          //                           margin: EdgeInsets.symmetric(
          //                             vertical: Insets.med,
          //                             horizontal: Insets.med,
          //                           ),
          //                           width: 150,
          //                           height: 150,
          //                           child: status != OrderStatus.completed
          //                               ? Lottie.asset(
          //                                   OrderUtils.setStatusIcon(status),
          //                                   width: 120,
          //                                   height: 120,
          //                                   fit: BoxFit.fill,
          //                                 )
          //                               : Padding(
          //                                   padding: EdgeInsets.all(Insets.lg),
          //                                   child: Image.asset(
          //                                       OrderUtils.setStatusIcon(
          //                                           status)),
          //                                 ),
          //                         ),
          //                         Expanded(
          //                           flex: 3,
          //                           child: Column(
          //                             children: [
          //                               // Container(
          //                               //   padding: EdgeInsets.symmetric(
          //                               //     vertical: Insets.xs,
          //                               //     horizontal: Insets.sm,
          //                               //   ),
          //                               //   decoration: BoxDecoration(
          //                               //     color: Colors.orange,
          //                               //     borderRadius:
          //                               //         BorderRadius.circular(20.0),
          //                               //   ),
          //                               //   child: Text(
          //                               //     statusInfo['title'] as String,
          //                               //     style: TextStyle(
          //                               //       fontWeight: FontWeight.bold,
          //                               //       color: Colors.white,
          //                               //       fontSize: FontSizes.s10,
          //                               //     ),
          //                               //   ),
          //                               // ),
          //                               SizedBox(height: Insets.lg),
          //                               Padding(
          //                                 padding: EdgeInsets.symmetric(
          //                                   horizontal: Insets.medx,
          //                                 ),
          //                                 child: Text(
          //                                   statusInfo['description'] as String,
          //                                   style: TextStyle(
          //                                     color:
          //                                         Colors.black.withOpacity(.6),
          //                                     fontSize: FontSizes.s9,
          //                                   ),
          //                                 ),
          //                               ),
          //                               SizedBox(height: Insets.sm),
          //                               Padding(
          //                                 padding: EdgeInsets.symmetric(
          //                                     vertical: Insets.med),
          //                                 child: Column(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.center,
          //                                   children: [
          //                                     Text(
          //                                       'Estimated delivery time',
          //                                       style: TextStyle(
          //                                         color: Colors.black
          //                                             .withOpacity(.7),
          //                                         fontSize: FontSizes.s9,
          //                                         fontWeight: FontWeight.bold,
          //                                       ),
          //                                     ),
          //                                     SizedBox(height: Insets.xs),
          //                                     Row(
          //                                       mainAxisAlignment:
          //                                           MainAxisAlignment.center,
          //                                       children: [
          //                                         const Icon(
          //                                             FontAwesomeIcons.clock,
          //                                             color: Colors.orange,
          //                                             size: 20),
          //                                         SizedBox(width: Insets.sm),
          //                                         Text(
          //                                           DateFormat.Hm().format(OrderUtils
          //                                               .mockEstimatedDeliveryTime(
          //                                                   actualOrders[index]
          //                                                       .createdAt)),
          //                                           style: TextStyle(
          //                                             color: Colors.black
          //                                                 .withOpacity(.8),
          //                                             fontSize: FontSizes.s13,
          //                                             fontWeight:
          //                                                 FontWeight.bold,
          //                                           ),
          //                                         ),
          //                                       ],
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     // Padding(
          //                     //   padding:
          //                     //       EdgeInsets.symmetric(vertical: Insets.med),
          //                     //   child: Column(
          //                     //     crossAxisAlignment: CrossAxisAlignment.center,
          //                     //     children: [
          //                     //       Text(
          //                     //         'Estimated delivery time',
          //                     //         style: TextStyle(
          //                     //           color: Colors.black.withOpacity(.7),
          //                     //           fontSize: FontSizes.s9,
          //                     //           fontWeight: FontWeight.bold,
          //                     //         ),
          //                     //       ),
          //                     //       SizedBox(height: Insets.xs),
          //                     //       Row(
          //                     //         mainAxisAlignment:
          //                     //             MainAxisAlignment.center,
          //                     //         children: [
          //                     //           const Icon(FontAwesomeIcons.clock,
          //                     //               color: Colors.orange, size: 20),
          //                     //           SizedBox(width: Insets.sm),
          //                     //           Text(
          //                     //             DateFormat.Hm().format(
          //                     //                 mockEstimatedDeliveryTime(
          //                     //                     actualOrders[index]
          //                     //                         .createdAt)),
          //                     //             style: TextStyle(
          //                     //               color: Colors.black.withOpacity(.8),
          //                     //               fontSize: FontSizes.s13,
          //                     //               fontWeight: FontWeight.bold,
          //                     //             ),
          //                     //           ),
          //                     //         ],
          //                     //       ),
          //                     //     ],
          //                     //   ),
          //                     // ),
          //                     SizedBox(height: Insets.med),
          //                     Column(
          //                       children: actualOrders[index].items.map((item) {
          //                         return Column(
          //                           children: [
          //                             CartItem(
          //                               item: item,
          //                               withButtons: false,
          //                               isOrder: true,
          //                             ),
          //                             SizedBox(height: Insets.med),
          //                           ],
          //                         );
          //                       }).toList(),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 padding: EdgeInsets.symmetric(horizontal: Insets.med),
          //                 width: double.infinity,
          //                 child: ClipPath(
          //                   clipper: ZigZagClipper(),
          //                   child:
          //                       Bill(actualOrders[index].totalCost.toDouble()),
          //                 ),
          //               ),
          //               SizedBox(height: Insets.lgx),
          //             ],
          //           );
          //         })
          //     : Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Image.asset(
          //               'assets/images/out-of-stock.png',
          //               width: 50.w,
          //               height: 50.w,
          //             ),
          //             Text('Your orders are empty',
          //                 style: TextStyle(fontSize: FontSizes.s10)),
          //           ],
          //         ),
          //       );

          // return widget;
          return OrderInfoWidget(actualOrders);
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

class OrderInfoWidget extends ConsumerWidget {
  final List<Order> actualOrders;
  const OrderInfoWidget(this.actualOrders, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return (actualOrders.isNotEmpty)
        ? ListView.builder(
            itemCount: actualOrders.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final status = OrderUtils.mockDeliveryProgress(
                  actualOrders[index].createdAt);
              final statusInfo =
                  OrderUtils.getOrderStatusTitleAndDescription(status);

              print('Status: $status');

              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Insets.med, vertical: 0),
                    padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
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
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: Insets.lg,
                                    top: Insets.sm,
                                    bottom: Insets.sm),
                                padding: EdgeInsets.symmetric(
                                  vertical: Insets.xs,
                                  horizontal: Insets.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  statusInfo['title'] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: FontSizes.s10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

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
                            child: PizzaDeliveryStepper(
                                steps: 5,
                                currentStep: OrderUtils.setOrderStep(status)),
                          ),
                        ),
                        // SizedBox(height: Insets.med),
                        // if (status != OrderStatus.completed)
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: Insets.med,
                                horizontal: Insets.med,
                              ),
                              width: 150,
                              height: 150,
                              child: status != OrderStatus.completed
                                  ? Lottie.asset(
                                      OrderUtils.setStatusIcon(status),
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.fill,
                                    )
                                  : Padding(
                                      padding: EdgeInsets.all(Insets.lg),
                                      child: Image.asset(
                                          OrderUtils.setStatusIcon(status)),
                                    ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  // Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //     vertical: Insets.xs,
                                  //     horizontal: Insets.sm,
                                  //   ),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.orange,
                                  //     borderRadius:
                                  //         BorderRadius.circular(20.0),
                                  //   ),
                                  //   child: Text(
                                  //     statusInfo['title'] as String,
                                  //     style: TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       color: Colors.white,
                                  //       fontSize: FontSizes.s10,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(height: Insets.lg),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Insets.medx,
                                    ),
                                    child: Text(
                                      statusInfo['description'] as String,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.6),
                                        fontSize: FontSizes.s9,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Insets.sm),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Insets.med),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Estimated delivery time',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(.7),
                                            fontSize: FontSizes.s9,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: Insets.xs),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(FontAwesomeIcons.clock,
                                                color: Colors.orange, size: 20),
                                            SizedBox(width: Insets.sm),
                                            Text(
                                              DateFormat.Hm().format(OrderUtils
                                                  .mockEstimatedDeliveryTime(
                                                      actualOrders[index]
                                                          .createdAt)),
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.8),
                                                fontSize: FontSizes.s13,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(vertical: Insets.med),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         'Estimated delivery time',
                        //         style: TextStyle(
                        //           color: Colors.black.withOpacity(.7),
                        //           fontSize: FontSizes.s9,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       SizedBox(height: Insets.xs),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.center,
                        //         children: [
                        //           const Icon(FontAwesomeIcons.clock,
                        //               color: Colors.orange, size: 20),
                        //           SizedBox(width: Insets.sm),
                        //           Text(
                        //             DateFormat.Hm().format(
                        //                 mockEstimatedDeliveryTime(
                        //                     actualOrders[index]
                        //                         .createdAt)),
                        //             style: TextStyle(
                        //               color: Colors.black.withOpacity(.8),
                        //               fontSize: FontSizes.s13,
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: Insets.med),
                        Column(
                          children: actualOrders[index].items.map((item) {
                            return Column(
                              children: [
                                CartItem(
                                  item: item,
                                  withButtons: false,
                                  isOrder: true,
                                ),
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
                      child: Bill(actualOrders[index].totalCost.toDouble()),
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
  }
}
