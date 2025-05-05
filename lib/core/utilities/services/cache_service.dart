import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes/app_route.dart';

class CacheService {
  static late SharedPreferences _sharedPreferences;
  static String? token;
  static int ? userId;

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

  static void cacheDataThenGoHome(BuildContext context, LoginEntity entity) {
    Future.wait([setData(key: AppConstants.token, value: entity.token),
      setData(key: AppConstants.userId, value: entity.id)

    ])
        .then((value) {
      if (value.every((element) => element == true) && context.mounted) {
        TextInput.finishAutofillContext();
        Logger().i('Token: ${entity.token}');
        Logger().i('id: ${entity.id}');
        context.navigateAndRemoveUntil(pageName: AppRoutes.homeLayout);
      }
    });
  }
}
