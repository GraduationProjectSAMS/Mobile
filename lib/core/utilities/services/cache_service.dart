import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes/app_route.dart';

class CacheService {
  static late SharedPreferences _sharedPreferences;
  static String? token;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  static Future<bool?> setData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return _sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return _sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return _sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return _sharedPreferences.setDouble(key, value);
    }
    return null;
  }

  static Future<bool?> removeData({required String key}) async {
    return _sharedPreferences.remove(key);
  }

  static Future<bool?> clear() async {
    return _sharedPreferences.clear();
  }

  static void saveTokenThenGoHome(BuildContext context, LoginEntity entity) {
    setData(key: AppConstants.token, value: entity.token).then((value) {
      if (value == true && context.mounted) {
        context.navigateAndRemoveUntil(pageName: AppRoutes.homeLayout);
      }
    });
  }
}
