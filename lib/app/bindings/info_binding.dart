
import 'package:get/get.dart';
import '../controllers/info_controller.dart';


class InfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoController>(() => InfoController());
  }
}