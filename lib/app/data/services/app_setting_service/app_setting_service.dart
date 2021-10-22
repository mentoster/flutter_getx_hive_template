import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

class AppSettingService extends GetxService {
  final getBox = GetStorage();
  final log = Logger('AppSettingService');
  Future<AppSettingService> init() async {
    changeStatusBarColor();
    return this;
  }

  void changeStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Themes.theme.barBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Themes.theme.barBackgroundColor,
      systemNavigationBarDividerColor: Themes.theme.barBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
