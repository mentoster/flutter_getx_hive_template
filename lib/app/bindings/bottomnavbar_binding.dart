import 'package:flutter_getx_hive_template/app/controllers/home_controller.dart';
import 'package:flutter_getx_hive_template/app/controllers/info_controller.dart';
import 'package:flutter_getx_hive_template/app/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../controllers/bottomnavbar_controller.dart';

class BottomnavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavbarController>(() => BottomnavbarController());
  }
}
