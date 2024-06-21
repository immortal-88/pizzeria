import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pizzas_controller.g.dart';

@Riverpod(keepAlive: true)
class PizzasController extends _$PizzasController {
  @override
  FutureOr<List<PizzaInfo>> build() {
    return getPizzas();
  }

  Future<List<PizzaInfo>> getPizzas() async {
    state = const AsyncValue.loading();
    try {
      final pizzas = await ref.read(repositoryProvider).pizzasApi.getPizzas();
      state = AsyncValue.data(pizzas);
      return pizzas;
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw Exception('Error');
    }
  }
}

// class ServicesByCategoryController
//     extends AutoDisposeFamilyAsyncNotifier<List<ServiceShort>, String> {
//   Future<List<ServiceShort>> getServicesByCategory({String? categoryId}) async {
//     state = const AsyncValue.loading();
//     try {
//       final services = await ref
//           .read(repositoryProvider)
//           .servicesApi
//           .getServicesByCategory(categoryId!);
//       state = AsyncValue.data(services);
//       return services;
//     } on DioException catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//       throw Exception('Error');
//     }
//   }

//   @override
//   FutureOr<List<ServiceShort>> build(String arg) {
//     return getServicesByCategory(categoryId: arg);
//   }
// }

// final servicesControllerProvider =
//     AsyncNotifierProvider.autoDispose<ServicesController, List<ServiceShort>>(
//         ServicesController.new);

// final servicesByCategoryControllerProvider = AsyncNotifierProvider.autoDispose
//     .family<ServicesByCategoryController, List<ServiceShort>, String>(
//         ServicesByCategoryController.new);
