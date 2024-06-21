import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pizzeria_app/src/database/storage_keys.dart';
import 'package:pizzeria_app/src/features/auth/data/token_info_response.dart';

const String hiveKey = 'hive_key';
const String defaultBoxName = 'default_box';
const String secureBoxName = 'secure_box';

final hiveProvider =
    AsyncNotifierProvider.autoDispose<HiveNotifier, HiveStorage>(
        () => HiveNotifier());

class HiveNotifier extends AutoDisposeAsyncNotifier<HiveStorage> {
  @override
  FutureOr<HiveStorage> build() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(TokenInfoResponseAdapter()); // TypeId 0
    }

    const secureStorage = FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.read(key: hiveKey);
    if (containsEncryptionKey == null) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: hiveKey, value: base64UrlEncode(key));
    }
    var encryptionKey =
        base64Url.decode((await secureStorage.read(key: hiveKey))!);

    var defaultBox = await Hive.openBox(defaultBoxName);
    var secureBox = await Hive.openBox(secureBoxName,
        encryptionCipher: HiveAesCipher(encryptionKey));

    return HiveStorage(defaultBox, secureBox);
  }
}

class HiveStorage {
  final Box _secureBox;
  final Box _defaultBox;

  HiveStorage(this._secureBox, this._defaultBox);

  Future<void> putEncrypted<E>(String key, E value) async {
    await _secureBox.put(key, value);
  }

  E getEncrypted<E>(String key) {
    return _secureBox.get(key);
  }

  Future<void> delete(String key) async {
    await _defaultBox.delete(key);
  }

  Future<void> deleteEncrypted(String key) async {
    await _secureBox.delete(key);
  }

  Future<void> put<E>(String key, E value) async {
    await _defaultBox.put(key, value);
  }

  E? get<E>(String key) {
    return _defaultBox.get(key);
  }

  Future<void> deleteCredentials() async {
    await _secureBox
        .deleteAll([StorageKeys.authToken, StorageKeys.authRefreshToken]);
    await _defaultBox.deleteAll([StorageKeys.tokenInfoKey]);
  }
}
