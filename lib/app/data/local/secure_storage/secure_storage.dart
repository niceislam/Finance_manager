import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  FlutterSecureStorage storage = FlutterSecureStorage();

  writeData({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  readData({required String key}) async {
    String? data = await storage.read(key: key);
    return data;
  }

  deleteData({required String key}) async {
    await storage.delete(key: key);
  }

  deleteAll() async {
    await storage.deleteAll();
  }
}
