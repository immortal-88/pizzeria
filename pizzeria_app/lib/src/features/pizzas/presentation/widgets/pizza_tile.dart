import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:sizer/sizer.dart';

class PizzaTile extends HookConsumerWidget {
  final PizzaInfo pizzaInfo;
  final Function() onTap;

  const PizzaTile({super.key, required this.pizzaInfo, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding:
          EdgeInsets.only(left: Insets.xs, right: Insets.xs, top: Insets.xs),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 25.h),
              child: Hero(
                tag: pizzaInfo.id,
                child: CachedNetworkImage(
                  imageUrl: pizzaInfo.imageUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(pizzaInfo.imageUrl),
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
            // Column(children: [],),
            Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(20),
              //   // color: Colors.orange.withOpacity(.1),
              // ),
              padding: EdgeInsets.all(Insets.med),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   pizzaInfo.name,
                  //   style: TextStyle(
                  //       fontSize: FontSizes.s8,
                  //       color: Colors.grey.shade600,
                  //       fontWeight: FontWeight.w300),
                  // ),

                  Text(
                    pizzaInfo.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  SizedBox(height: 1.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.solidStar,
                        size: 8,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '${pizzaInfo.rating}',
                        style: TextStyle(fontSize: FontSizes.s8),
                      ),
                      SizedBox(width: 1.w),
                      const PizzaChip(
                          color: Colors.red,
                          text: 'Spicy',
                          icon: FontAwesomeIcons.pepperHot),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     if (!pizzaInfo.provider.photoUrl.isNull)
                  //       CircleAvatar(
                  //         backgroundImage:
                  //             NetworkImage(pizzaInfo.provider.photoUrl!),
                  //         radius: 10,
                  //       ),
                  //     if (pizzaInfo.provider.photoUrl.isNull)
                  //       CircleAvatar(
                  //         radius: 10,
                  //         child: Text(
                  //             TextUtils.getInitials(
                  //                 '${pizzaInfo.provider.firstName!} ${pizzaInfo.provider.lastName!}'),
                  //             style: TextStyle(
                  //                 fontSize: FontSizes.s6,
                  //                 fontWeight: FontWeight.w700)),
                  //       ),
                  //     SizedBox(width: 1.w),
                  //     Text(
                  //         '${pizzaInfo.provider.firstName!} ${pizzaInfo.provider.lastName!}',
                  //         style: TextStyle(
                  //             fontSize: FontSizes.s9,
                  //             color: Colors.grey.shade800)),
                  //   ],
                  // ),
                  // Container(
                  //   width: 100.w,
                  //   height: 5.h,
                  //   color: Colors.red,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: sizeOptions.value.length,
                  //     itemBuilder: (context, index) {
                  //       return SizeButton(
                  //           text: sizeOptions.value[index].text,
                  //           isSelected: sizeOptions.value[index].isSelected,
                  //           onTap: () {
                  //             sizeOptions.value = List.generate(
                  //                 sizeOptions.value.length,
                  //                 (i) => SizeButtonInfo(
                  //                     text: sizeOptions.value[i].text,
                  //                     isSelected: i == index));
                  //           });
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 3.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('from ', style: TextStyle(fontSize: FontSizes.s9)),
                      Text('\$${pizzaInfo.price}',
                          style: TextStyle(
                              fontSize: FontSizes.s12,
                              color: Colors.black,
                              fontWeight: FontWeight.w800))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaChip extends StatelessWidget {
  final Color color;
  final String text;
  final IconData? icon;

  const PizzaChip(
      {super.key, this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: Insets.sm, vertical: Insets.xs / 2),
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
    );
  }
}
