import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/features/cart/data/services/cart_service.dart';
import 'package:pizzeria_app/src/features/cart/presentation/cart.dart';
import 'package:pizzeria_app/src/features/orders/presentation/orders.dart';
import 'package:pizzeria_app/src/routing/widgets/scaffold_navbar_item.dart';
import 'package:pizzeria_app/src/utils/order_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

import '../../features/orders/presentation/controllers/orders_controller.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar(
      {super.key, required this.child, required this.ref});
  final Widget child;
  final ProviderRef ref;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void openCartBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 200),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const CartPage();
      },
    );
  }

  void openOrdersBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 200),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return const OrdersPage();
      },
    );
  }

  // showBottomModalDialog({
  //   required BuildContext context,
  //   required List<Widget> children,
  // }) {
  //   showCupertinoModalPopup(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) => Container(
  //           height: 90.h,
  //           width: 100.w,
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
  //           ),
  //           child: Material(
  //               borderRadius:
  //                   const BorderRadius.vertical(top: Radius.circular(25.0)),
  //               color: Colors.white,
  //               child: Column(
  //                   mainAxisSize: MainAxisSize.max, children: children))));
  // }

  void onItemTapped(
      BuildContext context, int tabIndex, int currentIndex, ProviderRef ref) {
    final goRouter = GoRouter.of(context);
    final cartService = ref.watch(cartServiceProvider);

    if (tabIndex != currentIndex) {
      HapticFeedback.lightImpact();
      // if (tabIndex == 2 && cartService.isNotEmpty) {
      //   openCartBottomSheet(context);
      // } else if (tabIndex == 1) {
      //   openOrdersBottomSheet(context);
      // } else {
      goRouter.go(tabs[tabIndex].initialLocation);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex =
        locationToTabIndex(GoRouterState.of(context).matchedLocation);
    return Scaffold(
      extendBody: true,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        enableFeedback: true,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        items: tabs,
        onTap: (index) =>
            onItemTapped(context, index, currentIndex, widget.ref),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add the functionality you want for the central button
      //   }, // You can replace this with your desired icon
      //   elevation: 0, // Customize the elevation if needed
      //   backgroundColor: Colors.blue,
      //   shape: const CircleBorder(),
      //   child: const Icon(
      //     FontAwesomeIcons.basketShopping,
      //     size: 15,
      //   ), // Customize the background color if needed
      // ),
    );
  }
}

var tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: '/home',
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.house,
          size: 17,
          color: Colors.grey.withOpacity(.7),
        ),
      ),
    ),
    label: 'Home',
    activeIcon: const Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.house,
          size: 17,
          color: Colors.orange,
        ),
      ),
    ),
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/orders',
    icon: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Consumer(builder: (context, ref, _) {
          final appState = ref.watch(appStateProvider);
          final userId = appState is Authorized ? (appState).login.userId : '';
          final orders = ref.watch(ordersControllerProvider(userId));
          final actualOrders = orders.asData?.value
                  .where((e) =>
                      OrderUtils.mockDeliveryProgress(e.createdAt) !=
                      OrderStatus.completed)
                  .toList() ??
              [];

          print('actualOrders--: $actualOrders');
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                child: Icon(
                  FontAwesomeIcons.clipboardCheck,
                  size: 17,
                  color: Colors.grey.withOpacity(.7),
                ),
              ),
              actualOrders.isNotEmpty
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          width: 3.w,
                          height: 3.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffE33FA1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            actualOrders.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 6.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  : const SizedBox(),
            ],
          );
        })),
    label: 'Orders',
    activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        // child: Padding(
        //   padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        //   child: Icon(
        //     FontAwesomeIcons.clipboardCheck,
        //     size: 17,
        //     color: Colors.orange,
        //   ),
        // ),
        child: Consumer(builder: (context, ref, _) {
          final appState = ref.watch(appStateProvider);
          final userId = appState is Authorized ? (appState).login.userId : '';
          final orders = ref.watch(ordersControllerProvider(userId));
          final actualOrders = orders.asData?.value
                  .where((e) =>
                      OrderUtils.mockDeliveryProgress(e.createdAt) !=
                      OrderStatus.completed)
                  .toList() ??
              [];

          print('actualOrders--: $actualOrders');
          return Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                child: Icon(
                  FontAwesomeIcons.clipboardCheck,
                  size: 17,
                  color: Colors.orange,
                ),
              ),
              actualOrders.isNotEmpty
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                          width: 3.w,
                          height: 3.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffE33FA1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            actualOrders.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 6.5.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    )
                  : const SizedBox(),
            ],
          );
        })),
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/favorites',
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.solidHeart,
          size: 17,
          color: Colors.grey.withOpacity(.7),
        ),
      ),
    ),
    label: 'Favorites',
    activeIcon: const Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.solidHeart,
          size: 17,
          color: Colors.orange,
        ),
      ),
    ),
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/settings',
    icon: Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.gear,
          size: 17,
          color: Colors.grey.withOpacity(.7),
        ),
      ),
    ),
    label: 'Settings',
    activeIcon: const Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
        child: Icon(
          FontAwesomeIcons.gear,
          size: 17,
          color: Colors.orange,
        ),
      ),
    ),
  ),
];
