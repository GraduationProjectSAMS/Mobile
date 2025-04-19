

import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';

import 'package:window_manager/window_manager.dart';

class DesktopWindowService {
static Future<void>  init() async{
  if(!SizeConfigService.isDesktop) return;
  await windowManager.ensureInitialized();

  const  windowOptions = WindowOptions(
    center: true,
    minimumSize: Size(800, 600),

  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}
}