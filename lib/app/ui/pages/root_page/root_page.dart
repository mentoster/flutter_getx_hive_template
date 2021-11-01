import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/bottomnavbar_page/bottomnavbar_page.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/login_page/login_page.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../../../controllers/root_controller.dart';

class RootPage extends GetView<RootController> {
  RootPage({Key? key}) : super(key: key);
  final log = Logger('RootPage');
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.registred.value == false &&
          controller.nullRegistred != null) {
        return const LoginPage();
      } else if (controller.registred.value == true) {
        return const BottomnavbarPage();
      } else {
        return Container();
      }
    }));
  }
}
