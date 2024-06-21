import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/utils/styles.dart';
import 'package:sizer/sizer.dart';

class FavouritesPage extends HookConsumerWidget {
  const FavouritesPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Favourites',
          style: TextStyle(
            color: Colors.black,
            fontSize: FontSizes.s12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wishlist.png',
              width: 50.w,
              height: 50.w,
            ),
            Text('No favourites yet!',
                style: TextStyle(fontSize: FontSizes.s10)),
          ],
        ),
      ),
    );
  }
}
