import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<bool> clearToken();
}

@LazySingleton(as: LocalDataStorage)
class LocalDataStorageImpl implements LocalDataStorage {
  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  Future<bool> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }
}
