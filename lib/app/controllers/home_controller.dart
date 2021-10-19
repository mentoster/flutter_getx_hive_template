import 'package:flutter_getx_hive_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  toUserInfo() => Get.toNamed(Routes.INFO);
}
