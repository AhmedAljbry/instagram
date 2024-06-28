import 'package:shared_preferences/shared_preferences.dart';

class Cach_Halper {
  static late SharedPreferences sharedpreferences;

  static init() async
  {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> save({
    required String key,
    required dynamic value,
  })async{
    if (value is String) return await sharedpreferences.setString(key, value);
    if (value is int) return await sharedpreferences.setInt(key, value);
    if (value is double) return await sharedpreferences.setDouble(key, value);
    return await sharedpreferences.setBool(key, value);
  }
 static dynamic getdata({required String key})
  {
    return sharedpreferences.get(key);
  }
}