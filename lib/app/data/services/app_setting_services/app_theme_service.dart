import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

const saveThemeCode = "isDarkTheme";

class AppThemeService extends GetxService {
  final getBox = GetStorage();
  final log = Logger('AppSettingService');

  Future<AppThemeService> init() async {
    setTheme(getThemeNow());
    return this;
  }

  void setTheme(bool? isDarkTheme) {
    if (isDarkTheme == null) {
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      isDarkMode ? Get.changeTheme(Themes.dark) : Get.changeTheme(Themes.light);
      getBox.write(saveThemeCode, null);
      changeStatusBarColor(isDarkMode);
    } else if (isDarkTheme == true) {
      Get.changeTheme(Themes.dark);
      getBox.write(saveThemeCode, true);
      changeStatusBarColor(true);
    } else if (isDarkTheme == false) {
      Get.changeTheme(Themes.light);
      getBox.write(saveThemeCode, false);
      changeStatusBarColor(false);
    }
  }

  static bool? getThemeNow() {
    return GetStorage().read(saveThemeCode);
  }

  void changeStatusBarColor(bool toDark) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: toDark
            ? Themes.dark.appBarTheme.backgroundColor
            : Themes.light.appBarTheme.backgroundColor,
        statusBarIconBrightness: toDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: toDark
            ? Themes.dark.bottomNavigationBarTheme.backgroundColor
            : Themes.light.bottomNavigationBarTheme.backgroundColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            toDark ? Brightness.light : Brightness.dark));
  }
}
