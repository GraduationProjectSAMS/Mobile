import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme/app_theme.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';

import '../core/config/routes/app_route.dart';
import '../core/widgets/hghg.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get initialRoute {
    CacheService.token = CacheService.getData(key: AppConstants.token);
    CacheService.userId = CacheService.getData(key: AppConstants.userId);
    if (CacheService.token != null) {
      return AppRoutes.homeLayout;
    } else {
      return AppRoutes.login;
    }
  }

  @override
  Widget build(BuildContext context) {

    return AppSizConfig(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
