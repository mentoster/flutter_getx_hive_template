import 'package:flutter/material.dart';
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
            child: Obx(() => Text("${controller.count.value}",
                style: Theme.of(context).textTheme.headline1)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: controller.increment));
  }
}
