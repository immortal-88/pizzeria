// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:pizzeria_server/api/v1/pizzas/repository.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class PizzasService {
  PizzasService({required PizzasRepository pizzasRepository})
      : _pizzasRepository = pizzasRepository;

  final PizzasRepository _pizzasRepository;

  Future<Either<FailureModel, List<PizzaInfo>>> getAllPizzas() async {
    try {
      final pizzas = await _pizzasRepository.getAllPizzas();
      return right(pizzas);
    } on NoPizzasFoundException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (e) {
      print('e: $e');
      return left(const FailureModel(message: UnknownException.message));
    }
  }

  Future<Either<FailureModel, PizzaInfo>> getPizza(
    String id,
  ) async {
    try {
      final pizza = await _pizzasRepository.getPizza(id: id);
      return right(pizza);
    } on NoPizzaFoundException catch (e) {
      return left(FailureModel(message: e.message));
    } catch (e) {
      return left(const FailureModel(message: UnknownException.message));
    }
  }
}
