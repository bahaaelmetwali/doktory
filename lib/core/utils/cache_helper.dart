import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;
  CacheHelper(this._prefs);

  Future<void> saveRole({required String role}) async {
    await _prefs.setString('role', role);
  }

  String? getRole() {
    return _prefs.getString('role');
  }

  Future<void> clearUserData() async {
    await _prefs.clear();
  }
}
