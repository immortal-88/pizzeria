import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/common/app_state.dart';
import 'package:pizzeria_app/src/features/auth/presentation/login.dart';
import 'package:pizzeria_app/src/features/auth/presentation/signup.dart';
import 'package:pizzeria_app/src/features/cart/presentation/cart.dart';
import 'package:pizzeria_app/src/features/favourites/presentation/favourites.dart';
import 'package:pizzeria_app/src/features/home/presentation/home.dart';
import 'package:pizzeria_app/src/features/orders/presentation/orders.dart';
import 'package:pizzeria_app/src/features/orders/presentation/orders_history.dart';
import 'package:pizzeria_app/src/features/pizzas/presentation/pizza_page.dart';
import 'package:pizzeria_app/src/features/pizzas/presentation/pizzas.dart';
import 'package:pizzeria_app/src/features/profile/presentation/settings.dart';
import 'package:pizzeria_app/src/routing/widgets/scaffold_bottom_navbar.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter? _previousRouter;

void appStateDesc(AppState state) {
  if (state is Authorized) {
    log('🟢x🟢x🟢 AppState: Authorized (UserId: ${state.login.userId})');
  } else if (state is Unauthorized) {
    log('🟠x🟠x🟠 AppState: Unauthorized');
  } else if (state is Error) {
    log('🔴x🔴x🔴 AppState: Error: ${state.message}');
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final appState = ValueNotifier<AppState>(const AppState.unauthorized());

  ref
    ..onDispose(appState.dispose) // don't forget to clean after yourselves (:
    // update the listenable, when some provider value changes
    // here, we are just interested in wheter the user's logged in
    ..listen(
      appStateProvider,
      (_, next) {
        appStateDesc(next);
        appState.value = next;
      },
    );
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: appState,
    routes: [
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        path: '/pizzas',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PizzasPage(),
        ),
      ),
      // GoRoute(
      //   path: '/pizzaPage',
      //   parentNavigatorKey: _rootNavigatorKey,
      //   pageBuilder: (context, state) =>
      //       NoTransitionPage(child: PizzaPage(state.extra as PizzaInfo)),
      // ),
      GoRoute(
        path: '/pizzaPage',
        pageBuilder: (_, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: PizzaPage(state.extra as PizzaInfo),
          );
          // return NoTransitionPage(
          //   key: state.pageKey,
          //   child: PizzaPage(state.extra as PizzaInfo),
          // );
        },
      ),
      GoRoute(
        path: '/orders_history',
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: const OrdersHistoryPage(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
              child: ScaffoldWithBottomNavBar(
            ref: ref,
            child: child,
          ));
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
            // routes: [
            //   GoRoute(
            //     path: 'dishes/:id',
            //     builder: (context, state) => DishPage(dish: ,),
            //   ),
            // ],
          ),
          GoRoute(
            path: '/orders',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: OrdersPage(),
            ),
          ),
          GoRoute(
            path: '/cart',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CartPage(),
            ),
            // routes: [
            //   GoRoute(
            //     path: 'details',
            //     builder: (context, state) => const DetailsScreen(label: 'B'),
            //   ),
            // ],
          ),
          GoRoute(
            path: '/favorites',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FavouritesPage()),
            // routes: [
            //   GoRoute(
            //     path: 'details',
            //     builder: (context, state) => const DetailsScreen(label: 'B'),
            //   ),
            // ],
          ),
          GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SettingsPage(),
                  )),
          GoRoute(
              path: '/profile',
              redirect: (context, state) {
                var state = appState.value;
                print('state: $state');
                return state is Authorized ? '/profile' : '/login';
              },
              pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const SettingsPage(),
                  )),
        ],
      ),
    ],
  );
});

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({Key? key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Slide from bottom
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
