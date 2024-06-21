import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/features/cart/data/services/cart_service.dart';
import 'package:pizzeria_app/src/features/cart/presentation/cart.dart';
import 'package:pizzeria_app/src/features/home/presentation/controllers/pizzas_controller.dart';
import 'package:pizzeria_app/src/features/pizzas/presentation/widgets/pizza_tile.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_app/src/utils/text_utils.dart';
import 'package:sizer/sizer.dart';

final ads = <Widget>[
  ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: CachedNetworkImage(
      width: 100.w,
      height: 20.h,
      fit: BoxFit.cover,
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/533b465ce4b0079da41528eb/1603375161453-KRRZ0I10U7CIHW2VM4IZ/slice+digital+ad+.gif',
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  'https://images.squarespace-cdn.com/content/v1/533b465ce4b0079da41528eb/1603375161453-KRRZ0I10U7CIHW2VM4IZ/slice+digital+ad+.gif'),
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
  ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: CachedNetworkImage(
      width: 100.w,
      height: 20.h,
      fit: BoxFit.cover,
      imageUrl:
          'https://i.pinimg.com/originals/8e/95/42/8e9542634c5768e2ad6e912b410b04cd.gif',
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  'https://i.pinimg.com/originals/8e/95/42/8e9542634c5768e2ad6e912b410b04cd.gif'),
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
];

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pizzas = ref.watch(pizzasControllerProvider);
    final appState = ref.watch(appStateProvider);
    final cartService = ref.watch(cartServiceProvider);

    final currentAd = useState(0);

    final controller = usePageController(
      viewportFraction: 0.5,
      initialPage: 999,
    );

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        currentAd.value = currentAd.value == 0 ? 1 : 0;
      });
      return timer.cancel;
    }, []);

    void openCartBottomSheet() {
      showCupertinoModalBottomSheet(
        context: context,
        useRootNavigator: true,
        duration: const Duration(milliseconds: 200),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return const CartPage();
        },
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 4,
        animationDuration: const Duration(milliseconds: 0),
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Insets.lg,
                  top: Insets.lg,
                  bottom: Insets.med,
                  right: Insets.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  appState is Authorized
                      ? Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green.shade300,
                              radius: 25,
                              backgroundImage: appState.login.photoUrl != null
                                  ? NetworkImage(appState.login.photoUrl!)
                                  : null,
                              child: appState.login.photoUrl == null
                                  ? Text(
                                      TextUtils.getInitials(
                                          '${appState.login.firstName} ${appState.login.lastName}'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: FontSizes.s16),
                                    )
                                  : null,
                            ),
                            SizedBox(width: 3.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome!',
                                    style: TextStyle(
                                        fontSize: FontSizes.s11,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey)),
                                Text(appState.login.firstName ?? '',
                                    style: TextStyle(
                                        fontSize: FontSizes.s11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800)),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/images/pizza_logo.jpg',
                                  fit: BoxFit.contain),
                            ),
                            SizedBox(width: 3.w),
                            Text('My Pizzeria',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: FontSizes.s16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.locationDot,
                              size: 18, color: Colors.grey.shade700),
                          style: TextButton.styleFrom(
                            // backgroundColor: Colors.grey.shade100,
                            splashFactory: NoSplash.splashFactory,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          label: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kyiv',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: FontSizes.s10,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      SizedBox(width: 2.w),
                      Stack(
                        children: [
                          IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onPressed: () {
                                openCartBottomSheet();
                              },
                              icon: Icon(
                                FontAwesomeIcons.cartShopping,
                                color: cartService.isNotEmpty
                                    ? Colors.green
                                    : Colors.grey.shade400,
                              )),
                          if (cartService.isNotEmpty)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                  width: 4.w,
                                  height: 4.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE33FA1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    cartService.length.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: Insets.med),
            //   child: Row(
            //     children: [
            // SizedBox(
            //   width: 90.w,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: InkWell(
            //       highlightColor: Colors.transparent,
            //       splashColor: Colors.transparent,
            //       onTap: () => GoRouter.of(context).push('/search'),
            //       child: Hero(
            //         tag: 'search',
            //         child: Material(
            //           borderRadius: BorderRadius.circular(15),
            //           child: CustomTextField(
            //             enabled: false,
            //             withBorder: true,
            //             prefixIcon: const Icon(
            //               Icons.search_outlined,
            //               size: 30,
            //             ),
            //             hintText: 'Search services',
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 0),
            //   child: InkWell(
            //     onTap: () {},
            //     child: Icon(
            //       FontAwesomeIcons.solidBell,
            //       size: 18,
            //       color: Colors.grey.shade400,
            //     ),
            //   ),
            // ),
            //     ],
            //   ),
            // ),
            Container(
              width: 100.w,
              height: 22.h,
              padding: EdgeInsets.symmetric(horizontal: Insets.medx),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 3000),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: ads[currentAd.value],
              ),
            ),

            // SizedBox(
            //   height: 8.h,
            //   child: categories.when(
            //       data: (data) => Padding(
            //             padding: EdgeInsets.only(top: 1.h),
            //             child: ListView.builder(
            //               scrollDirection: Axis.horizontal,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: 2.w),
            //                   child: CategoryButton(
            //                     text: data[index].name,
            //                     onTap: () {
            //                       GoRouter.of(context).push(
            //                           '/category/${data[index].id}',
            //                           extra: data[index].subcategories);
            //                     },
            //                   ),
            //                 );
            //               },
            //               itemCount: data.length,
            //             ),
            //           ),
            //       error: (e, s) => Center(child: Text('$e')),
            //       loading: () => const Center(
            //             child: CircularProgressIndicator(),
            //           )),
            // ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.med),
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey.shade400,
                  labelColor: Colors.black,
                  enableFeedback: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  // indicator: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   gradient: LinearGradient(
                  //     colors: [
                  //       Colors.red.shade200,
                  //       Colors.orange.shade400,
                  //     ],
                  //   ),
                  // ),
                  tabAlignment: TabAlignment.center,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.pizzaSlice, size: 15),
                          SizedBox(width: 2.w),
                          Text('Pizza',
                              style: TextStyle(
                                fontSize: FontSizes.s10,
                                fontWeight: FontWeight.w800,
                              )),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.mugHot,
                            size: 15,
                          ),
                          SizedBox(width: 2.w),
                          Text('Drinks',
                              style: TextStyle(
                                fontSize: FontSizes.s10,
                                fontWeight: FontWeight.w800,
                              )),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.breadSlice, size: 15),
                          SizedBox(width: 2.w),
                          Text('Sides',
                              style: TextStyle(
                                fontSize: FontSizes.s10,
                                fontWeight: FontWeight.w800,
                              )),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          const Icon(FontAwesomeIcons.iceCream, size: 15),
                          SizedBox(width: 2.w),
                          Text('Desserts',
                              style: TextStyle(
                                  fontSize: FontSizes.s10,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                    // MenuButton(
                    //   icon: FontAwesomeIcons.pizzaSlice,
                    //   text: 'Pizza',
                    //   onTap: () =>
                    //       tabController.animateTo(0, duration: Duration.zero),
                    // ),
                    // MenuButton(
                    //   icon: FontAwesomeIcons.mugSaucer,
                    //   text: 'Drinks',
                    //   onTap: () =>
                    //       tabController.animateTo(1, duration: Duration.zero),
                    // ),
                    // MenuButton(
                    //   icon: FontAwesomeIcons.bowlFood,
                    //   text: 'Sides',
                    //   onTap: () =>
                    //       tabController.animateTo(2, duration: Duration.zero),
                    // ),
                    // MenuButton(
                    //   icon: FontAwesomeIcons.iceCream,
                    //   text: 'Desserts',
                    //   onTap: () =>
                    //       tabController.animateTo(3, duration: Duration.zero),
                    // ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                // controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Insets.lg, vertical: Insets.med),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Bestsellers',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800)),
                            // Text('View all'),
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).push('/pizzas');
                              },
                              style: ElevatedButton.styleFrom(
                                  visualDensity: VisualDensity.compact,
                                  elevation: 0,
                                  backgroundColor: Colors.orange.shade300,
                                  foregroundColor: Colors.white),
                              child: Text('View all',
                                  style: TextStyle(
                                      fontSize: FontSizes.s10,
                                      fontWeight: FontWeight.w800)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: pizzas.when(
                        data: (data) => data.isNotEmpty
                            ? PageView.builder(
                                controller: controller,
                                // itemCount: data.length,
                                padEnds: true,
                                itemBuilder: (context, index) => PizzaTile(
                                      pizzaInfo: data[index % data.length],
                                      onTap: () {
                                        GoRouter.of(context).push(
                                          '/pizzaPage',
                                          extra: data[index % data.length],
                                        );
                                        // Navigator.of(context, rootNavigator: true).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             PizzaPage(data[index % data.length])));
                                      },
                                    ))
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/pizza.png',
                                      width: 30.w,
                                      height: 30.w,
                                    ),
                                    Text('Pizzas',
                                        style:
                                            TextStyle(fontSize: FontSizes.s10)),
                                  ],
                                ),
                              ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (e, s) => Text(e.toString()),
                      )),
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/juice.png',
                          width: 30.w,
                          height: 30.w,
                        ),
                        Text('Drinks',
                            style: TextStyle(fontSize: FontSizes.s10)),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/burger.png',
                          width: 30.w,
                          height: 30.w,
                        ),
                        Text('Sides',
                            style: TextStyle(fontSize: FontSizes.s10)),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dessert.png',
                          width: 30.w,
                          height: 30.w,
                        ),
                        Text('Desserts',
                            style: TextStyle(fontSize: FontSizes.s10)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  const MenuButton(
      {super.key, required this.icon, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Insets.sm),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.grey),
            SizedBox(width: 3.w),
            Text(text, style: TextStyle(fontSize: FontSizes.s9)),
          ],
        ),
      ),
    );
  }
}
