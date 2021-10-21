import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppSettingService extends GetxService {
  final getBox = GetStorage();
  Future<AppSettingService> init() async {
    setStartTheme(getBox.read("isDarkTheme"));
    return this;
  }

  void setStartTheme(bool? isDarkTheme) {
    if (isDarkTheme == null) {
      var brightness = SchedulerBinding.instance!.window.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      isDarkMode
          ? Get.changeTheme(ThemeData.dark())
          : Get.changeTheme(ThemeData.light());
      getBox.write("isDarkTheme", null);
    } else if (isDarkTheme == true) {
      Get.changeTheme(ThemeData.dark());
      getBox.write("isDarkTheme", true);
    } else if (isDarkTheme == false) {
      Get.changeTheme(ThemeData.light());
      getBox.write("isDarkTheme", false);
    }
  }
}
