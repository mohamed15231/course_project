import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;
  static Future init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static getData({
    required String key,
})async{
    return sharedPreferences!.get(key);
  }
  static Future<bool> postData({
    required String key,
    required dynamic value,
})async{
    if(value is bool) {
      return sharedPreferences!.setBool(key,value);

    // ignore: unnecessary_type_check
    }else if(value is String) {
      return sharedPreferences!.setString(key,value);
    }else if(value is int) {
      return sharedPreferences!.setInt(key,value);
    }else{
      return sharedPreferences!.setDouble(key,value);
    }
  }

  static Future<bool> removeData({
  required String key,
})async{
    return await sharedPreferences!.remove(key);
  }


}