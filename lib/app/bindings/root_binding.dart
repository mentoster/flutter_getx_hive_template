import 'package:flutter_getx_hive_template/app/controllers/home_controller.dart';
import 'package:flutter_getx_hive_template/app/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../controllers/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
