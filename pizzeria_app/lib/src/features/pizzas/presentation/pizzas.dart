import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/features/home/presentation/controllers/pizzas_controller.dart';
import 'package:pizzeria_app/src/features/pizzas/presentation/widgets/pizza_tile.dart';
import 'package:pizzeria_app/src/utils/styles.dart';

class PizzasPage extends HookConsumerWidget {
  const PizzasPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pizzas = ref.watch(pizzasControllerProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Pizzas'),
        leading: MaterialButton(
            elevation: 0,
            padding: const EdgeInsets.all(5.0),
            shape: const CircleBorder(),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              // size: 20,
              color: Colors.black54,
            )),
      ),
      body: pizzas.when(
          data: (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 3,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return PizzaTile(
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
                    );
                  },
                ),
              ),
          error: (e, s) => Text(e.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
