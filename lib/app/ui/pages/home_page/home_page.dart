import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/global_widgets/pages_buttons.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Counter page",
                ),
                IconButton(
                    onPressed: controller.toUserInfo,
                    icon: const Icon(Icons.account_circle_outlined))
              ],
            ),
            automaticallyImplyLeading: false),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => Text("${controller.count.value}", style: headline1)),
                const PagesButtons()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: controller.increment));
  }
}
