import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  static final _storage = FlutterSecureStorage();
  static const _keyAccessToken = 'naver_access_token';

  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  static Future<void> clearAccessToken() async {
    await _storage.delete(key: _keyAccessToken);
  }
}
