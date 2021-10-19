import 'package:flutter_getx_hive_template/app/bindings/info_binding.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/info_page/info_page.dart';
import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../ui/pages/home_page/home_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.INFO,
        page: () => const InfoPage(),
        binding: InfoBinding()),
  ];
}
