import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';

import 'app/my_app.dart';
import 'core/utilities/services/desktop_window_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Future.wait([
    CacheService.init(),

    DesktopWindowService.init(),
  ]);
  setupDependencies();


  runApp( const MyApp());
}


