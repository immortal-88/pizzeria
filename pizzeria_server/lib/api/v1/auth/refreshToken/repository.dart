// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_server/core/utils/jwt_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class RefreshTokenRepository {
  RefreshTokenRepository({required DatabaseClient databaseClient})
      : _databaseClient = databaseClient;

  final DatabaseClient _databaseClient;

  Future<RefreshTokenResponseModel> refreshToken(
    RefreshTokenRequestModel request,
  ) async {
    try {
      if (_databaseClient.db != null && _databaseClient.db!.isConnected) {
        final userCollection =
            _databaseClient.db!.collection(DBConstants.usersCollection);
        // Check if the user credentials are valid or not.
        final userResponse = await userCollection.findOne(
          where.eq('_id', request.userId),
        );
        if (userResponse == null) {
          throw NoUserProfileFoundException();
        } else {
          // // If the credentials are correct generate access and then return LoginResponseModel
          final user = UserLoginModel.fromJson(userResponse);

          final accessToken = JWTUtils.generateAccessToken(
            userId: user.id as String,
          );
          final refreshToken = JWTUtils.generateRefreshToken(
            userId: user.id as String,
          );

          final refreshResponseModel = RefreshTokenResponseModel(
            id: user.id as String,
            accessToken: accessToken,
            refreshToken: refreshToken,
            resendTime: DateTime.now(),
          );

          return refreshResponseModel;
        }
      } else {
        throw DatabaseConnectionException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
