// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_server/core/utils/jwt_utils.dart';
import 'package:pizzeria_server/core/utils/password_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class LoginRepository {
  LoginRepository({required DatabaseClient databaseClient})
      : _databaseClient = databaseClient;

  final DatabaseClient _databaseClient;

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      if (_databaseClient.db != null && _databaseClient.db!.isConnected) {
        final usersCollection =
            _databaseClient.db!.collection(DBConstants.usersCollection);
        // final encryptedPassword =
        //     PasswordUtils.encryptPassword(request.password);
        // print('encryptedPassword: $encryptedPassword');
        // Check if the user credentials are valid or not.
        // final userResponse = await usersCollection.findOne(
        //   where
        //       .eq('email', request.email)
        //       .and(where.eq('password', encryptedPassword)),
        // );

        final userResponse = await usersCollection.findOne(
          where.eq('email', request.email),
        );

        final user = User.fromJson(userResponse!);

        final encryptedPassword = PasswordUtils.decryptPassword(
          user.password,
        );

        final isPasswordValid = request.password == encryptedPassword;

        print('userResponse: $userResponse');
        // If the credentials are correct generate access and then return LoginResponseModel

        print('user: $user');

        if (!isPasswordValid) {
          throw InvalidCredentialsException();
        }
        final accessToken = JWTUtils.generateAccessToken(
          userId: user.id as String,
        );
        print('accessToken: $accessToken');
        final refreshToken = JWTUtils.generateRefreshToken(
          userId: user.id as String,
        );
        print('refreshToken: $refreshToken');

        final loginResponseModel = LoginResponseModel(
          accessToken: accessToken,
          refreshToken: refreshToken,
          id: user.id as String,
          user: UserShort(
            id: user.id as String,
            firstName: user.firstName,
            lastName: user.lastName,
            photoUrl: user.photoUrl,
          ),
        );

        print('loginResponseModel: $loginResponseModel');

        return loginResponseModel;
      } else {
        throw DatabaseConnectionException();
      }
    } catch (e) {
      rethrow;
    }
  }
}
