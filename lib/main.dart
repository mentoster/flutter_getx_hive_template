import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'app/data/services/init_services.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  await initServices();

  var appSettinsBox = await Hive.openBox('appSettingsBox');
  bool? registred = appSettinsBox.get("userLogin");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appThemeDataLight,
    darkTheme: appThemeDataDark,
    themeMode: ThemeMode.system,
    locale: Get.deviceLocale,
    defaultTransition: Transition.rightToLeft,
    getPages: (registred != null && registred == false)
        ? AppPages.pages
        : GoToLogin.page,
    initialRoute: Routes.INITIAL,
  ));
}
