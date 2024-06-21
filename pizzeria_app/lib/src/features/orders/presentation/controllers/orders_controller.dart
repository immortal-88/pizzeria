import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pizzeria_app/src/network/repository.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_controller.g.dart';

@Riverpod()
class OrdersController extends _$OrdersController {
  @override
  FutureOr<List<Order>> build(args) {
    return getOrders(args as String);
  }

  Future<List<Order>> getOrders(String id) async {
    state = const AsyncValue.loading();
    try {
      final orders = await ref.read(repositoryProvider).ordersApi.getAll(id);
      state = AsyncData(orders);
      return orders;
    } on DioException catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      throw Exception('Error');
    }
  }
}
