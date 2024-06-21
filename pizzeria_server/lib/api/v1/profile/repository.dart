// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class ProfileRepository {
  const ProfileRepository({
    required DatabaseClient databaseClient,
  }) : _databaseClient = databaseClient;

  final DatabaseClient _databaseClient;

  Future<UserLoginModel> getProfile(String id) async {
    try {
      if (_databaseClient.db == null || !_databaseClient.db!.isConnected) {
        throw DatabaseConnectionException();
      }

      final usersCollection =
          _databaseClient.db!.collection(DBConstants.usersCollection);

      final userResponse = await usersCollection.findOne(where.eq('_id', id));

      if (userResponse == null) {
        throw NoUserProfileFoundException();
      }
      return UserLoginModel.fromJson(userResponse);
    } catch (e) {
      rethrow;
    }
  }
}
