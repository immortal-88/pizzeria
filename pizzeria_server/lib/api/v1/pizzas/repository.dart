// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class PizzasRepository {
  const PizzasRepository({
    required DatabaseClient databaseClient,
  }) : _databaseClient = databaseClient;

  final DatabaseClient _databaseClient;

  Future<List<PizzaInfo>> getAllPizzas() async {
    try {
      if (_databaseClient.db == null || !_databaseClient.db!.isConnected) {
        throw DatabaseConnectionException();
      }

      final pizzasCollection =
          _databaseClient.db!.collection(DBConstants.pizzasCollection);

      final pizzasResponse = await pizzasCollection.find().toList();
      print('pizzasResponse: $pizzasResponse');

      if (pizzasResponse.isEmpty) {
        throw NoPizzasFoundException();
      }
      return pizzasResponse.map(PizzaInfo.fromJson).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<PizzaInfo> getPizza({required String id}) async {
    try {
      if (_databaseClient.db == null || !_databaseClient.db!.isConnected) {
        throw DatabaseConnectionException();
      }

      final pizzasCollection =
          _databaseClient.db!.collection(DBConstants.pizzasCollection);

      final pizzasResponse = await pizzasCollection
          .find(where.eq('_id', ObjectId.parse(id)).map[r'$query'])
          .toList();

      if (pizzasResponse.isEmpty) {
        throw NoPizzaFoundException();
      }
      return PizzaInfo.fromJson(pizzasResponse.first);
    } catch (e) {
      rethrow;
    }
  }
}
