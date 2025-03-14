import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme/app_theme.dart';

import '../core/config/routes/app_route.dart';
import '../core/utilities/services/size_config_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfigService.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
