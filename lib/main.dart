import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/splash_binding.dart';
import 'app/data/services/init_services.dart';
import 'app/routes/app_pages.dart';
import 'app/ui/pages/splash_page/splash_page.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  await initServices();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appThemeDataLight,
    darkTheme: appThemeDataDark,
    themeMode: ThemeMode.system,
    locale: Get.deviceLocale,
    defaultTransition: Transition.cupertino,
    getPages: AppPages.pages,
    initialRoute: Routes.SPLASH,
    initialBinding: SplashBinding(),
    home: const SplashPage(),
  ));
}
