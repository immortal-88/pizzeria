// ignore_for_file: public_member_api_docs

import 'package:uuid/uuid.dart';

abstract class UserIDUtils {
  static String generateUserID() {
    return const Uuid().v4();
  }
}
