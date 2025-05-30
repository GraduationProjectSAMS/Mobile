import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme/app_theme.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';

import '../core/config/routes/app_route.dart';
import '../core/utilities/services/size_config_service.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
static final  navigatorKey = GlobalKey<NavigatorState>();
  String get initialRoute {
    CacheService.token = CacheService.getData(key: AppConstants.token);
    CacheService.userId = CacheService.getData(key: AppConstants.userId);
    if(Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
   return AppRoutes.splash;
    }
    else if (CacheService.token != null) {
      return AppRoutes.homeLayout;
    } else {
      return AppRoutes.login;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigService.init(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
