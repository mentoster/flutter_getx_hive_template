import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeService {
  static void setStartTheme(bool? isDarkTheme) {
    final getBox = GetStorage();
    if (isDarkTheme == null) {
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      isDarkMode ? Get.changeTheme(Themes.dark) : Get.changeTheme(Themes.light);
      getBox.write("isDarkTheme", null);
      changeStatusBarColor(isDarkMode);
    } else if (isDarkTheme == true) {
      Get.changeTheme(Themes.dark);
      getBox.write("isDarkTheme", true);
      changeStatusBarColor(true);
    } else if (isDarkTheme == false) {
      Get.changeTheme(Themes.light);
      getBox.write("isDarkTheme", false);
      changeStatusBarColor(false);
    }
  }

  static bool? getThemeNow() {
    return GetStorage().read("isDarkTheme");
  }

  static void changeStatusBarColor(bool toDark) {
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
