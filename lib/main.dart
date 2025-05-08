import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:logger/logger.dart';
import 'app/my_app.dart';
import 'core/utilities/services/desktop_window_service.dart';
import 'core/utilities/services/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupDependencies();
 await Future.wait([
    CacheService.init(),
    DesktopWindowService.init(),
    dotenv.load(),
  ]);


  runApp( const MyApp());
}


