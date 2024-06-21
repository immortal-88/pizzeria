import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/features/cart/presentation/cart.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

final selectedPromoProvider = StateProvider<Promo?>((ref) => null);

openPromo(BuildContext context, List<Promo> promos, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled:
        true, // Set to true for adjusting height according to content
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(Insets.med),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Insets.lg),
                          child: Text(
                            'Select promo',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSizes.s12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  StatefulBuilder(
                    builder: (context, setModalState) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                          dialogBackgroundColor: Colors.black,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: promos.length,
                          itemBuilder: (context, index) => Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(
                                      'promo selected: ${promos[index].type}');
                                  setModalState(() {
                                    ref
                                        .read(selectedPromoProvider.notifier)
                                        .state = promos[index];
                                    GoRouter.of(context).pop();
                                  });
                                },
                                child: Container(
                                  height: 10.h,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Insets.lg,
                                      vertical: Insets.med),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ]),
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            promos[index].imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.5,
                                right: 0.5,
                                child: Container(
                                  height: 4.h,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: Insets.lg,
                                      vertical: Insets.med),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    color: Colors.white,
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF0D47A1),
                                      Color(0xFF1976D2),
                                      Color(0xFF42A5F5),
                                    ]),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Insets.sm,
                                            vertical: Insets.sm),
                                        child: Text(
                                          promos[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: FontSizes.s10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Insets.medx),
                ],
              ),
              SizedBox(height: Insets.medx),
            ],
          ),
        ),
      );
    },
  );
}
