import 'package:flutter_getx_hive_template/app/bindings/root_binding.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/root_page/root_page.dart';
import 'package:get/get.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => RootPage(), binding: RootBinding()),
  ];
}
