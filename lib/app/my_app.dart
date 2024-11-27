import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/theme/app_theme.dart';

import '../core/config/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.splashRoute,
   onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightTheme,

    );
  }
}
