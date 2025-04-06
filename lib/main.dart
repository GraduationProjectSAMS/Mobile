import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';

import 'app/my_app.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}