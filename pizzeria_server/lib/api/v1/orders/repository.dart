// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_server/core/utils/number_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class OrdersRepository {
  const OrdersRepository({
    required DatabaseClient databaseClient,
  }) : _databaseClient = databaseClient;

  final DatabaseClient _databaseClient;

  Future<void> createOrder(Order order) async {
    try {
      if (_databaseClient.db == null || !_databaseClient.db!.isConnected) {
        throw DatabaseConnectionException();
      }

      final ordersCollection =
          _databaseClient.db!.collection(DBConstants.ordersCollection);

      final count = await ordersCollection.count();
      var latestOrder = <String, dynamic>{};
      var lastorderNumber = '0';

      if (count > 0) {
        latestOrder = await ordersCollection
            .find(where.sortBy('orderNumber', descending: true).limit(1))
            .first;
        lastorderNumber = latestOrder['orderNumber'] as String;
      } else {
        latestOrder = {};
        lastorderNumber = '0';
      }

      final createdOrder = Order(
        orderNumber: NumberUtils.generateOrderNumber(lastorderNumber),
        createdAt: order.createdAt,
        items: order.items,
        clientInfo: order.clientInfo,
        totalCost: order.totalCost,
      );

      final response = await ordersCollection.insertOne(createdOrder.toJson());

      if (!response.isSuccess) {
        throw DataInsertException();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Order>> getOrders({required String id}) async {
    try {
      if (_databaseClient.db == null || !_databaseClient.db!.isConnected) {
        throw DatabaseConnectionException();
      }

      final ordersCollection =
          _databaseClient.db!.collection(DBConstants.ordersCollection);

      final ordersResponse = await ordersCollection
          .find(
            where
                .eq('clientInfo._id', id)
                .sortBy('createdAt', descending: true),
          )
          .toList();

      if (ordersResponse.isEmpty) {
        return [];
      }
      return ordersResponse.map(Order.fromJson).toList();
    } catch (e) {
      rethrow;
    }
  }
}
