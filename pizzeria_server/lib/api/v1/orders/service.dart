// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/orders/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart' as shared;
import 'package:pizzeria_shared/pizzeria_shared.dart';

class OrdersService {
  OrdersService({required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository;

  final OrdersRepository _ordersRepository;

  Future<Either<FailureModel, void>> createOrder(shared.Order order) async {
    try {
      await _ordersRepository.createOrder(order);
      return right(null);
    } on InvalidOrderException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (e) {
      print('e: $e');
      return left(const FailureModel(message: UnknownException.message));
    }
  }

  Future<Either<FailureModel, List<shared.Order>>> getOrders(
    String id,
  ) async {
    try {
      final orders = await _ordersRepository.getOrders(id: id);
      return right(orders);
    } on NoOrdersFoundException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (e) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
