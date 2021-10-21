import 'package:flutter_getx_hive_template/app/bindings/root_binding.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/root_page/root_page.dart';
import 'package:get/get.dart';

import '../bindings/info_binding.dart';
import '../bindings/login_binding.dart';
import '../ui/pages/info_page/info_page.dart';
import '../ui/pages/login_page/login_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => RootPage(), binding: RootBinding()),
  ];
}
