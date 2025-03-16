import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setString({required String key, required String value}) async {
    await sharedPreferences?.setString(key, value);
  }

  static setBool({required String key, required bool value}) async {
    await sharedPreferences?.setBool(key, value);
  }

  static getData({required String key}) {
    return sharedPreferences?.get(key);
  }

  static clearData() {
    sharedPreferences?.clear();
  }
}
