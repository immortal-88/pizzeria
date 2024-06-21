import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/routing/router.dart';
import 'package:pizzeria_app/src/utils/theme.dart';
import 'package:sizer/sizer.dart';

class PizzeriaApp extends HookConsumerWidget {
  const PizzeriaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          title: 'Pizzeria App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MaterialApp.router(
              routerConfig: ref.watch(goRouterProvider),
              theme: AppTheme.themeData));
    });
  }
}
