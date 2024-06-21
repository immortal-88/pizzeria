// ignore_for_file: public_member_api_docs

import 'package:pizzeria_server/core/constants/db_constants.dart';
import 'package:pizzeria_server/core/database/database.dart';
import 'package:pizzeria_server/core/exceptions/exceptions.dart';
import 'package:pizzeria_server/core/utils/password_utils.dart';
import 'package:pizzeria_server/core/utils/user_id_utils.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

class RegisterRepository {
  RegisterRepository({required DatabaseClient databaseClient})
      : _databaseClient = databaseClient;
  final DatabaseClient _databaseClient;

  Future<void> register(RegisterRequestModel request) async {
    try {
      final userCollection =
          _databaseClient.db!.collection(DBConstants.usersCollection);

      final userExist = await userCollection.findOne({'email': request.email});

      // Set User role by default for first time user
      final role = userCollection.findOne({'role': 'User'}).toString();

      if (userExist != null) {
        throw UserExistsException();
      } else {
        final user = User(
          id: UserIDUtils.generateUserID(),
          email: request.email,
          password: PasswordUtils.encryptPassword(request.password),
          firstName: request.firstName,
          lastName: request.lastName,
          roles: [role],
        );

        final response = await userCollection.insertOne(user.toJson());

        if (!response.isSuccess) {
          throw DataInsertException();
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
