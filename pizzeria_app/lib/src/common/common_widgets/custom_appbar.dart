import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLogin;

  const CustomAppBar({super.key, required this.title, this.isLogin = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black54, fontSize: FontSizes.s12),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        onPressed: () => isLogin
            ? GoRouter.of(context).go('/home')
            : GoRouter.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
