import 'package:get/get.dart';
import '../controllers/bottomnavbar_controller.dart';

class BottomnavbarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavbarController>(() => BottomnavbarController());
  }
}
