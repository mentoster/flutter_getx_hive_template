import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/services/init_services.dart';
import 'app/routes/app_pages.dart';
import 'app/translation/localization.g.dart';
import 'app/ui/theme/app_theme.dart';

void main() async {
  await initServices();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Themes.light,
    darkTheme: Themes.dark,
    themeMode: ThemeMode.system,
    translations: Localization(),
    defaultTransition: Transition.rightToLeft,
    getPages: AppPages.pages,
    initialRoute: Routes.INITIAL,
  ));
}
