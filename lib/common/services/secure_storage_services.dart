import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageServices extends GetxService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> readSecureData(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }
}
