// ignore_for_file: public_member_api_docs

import 'package:encrypt/encrypt.dart';
import 'package:pizzeria_server/core/constants/password_constatns.dart';

abstract class PasswordUtils {
  static final key = Key.fromUtf8(PasswordConstants.secretKey);
  // static final iv = IV.fromLength(16);
  static final iv = IV.fromSecureRandom(16);

  static String encryptPassword(String password) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(password.trim(), iv: iv);

    print('encrypted.base64: ${encrypted.base64}');
    return encrypted.base64;
  }

  static String decryptPassword(String password) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt64(password, iv: iv);

    print('decrypted: $decrypted');
    return decrypted;
  }
}
