import 'package:flutter_secure_storage/flutter_secure_storage.dart';

FlutterSecureStorage _storage = FlutterSecureStorage();

class SecureKey {
  static const appKey = 'appKey';
}

class SecureStorageService {
  static Future<void> encrypt(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String> decrypt(String key) async {
    final String value = await _storage.read(key: key);
    return value;
  }
}
