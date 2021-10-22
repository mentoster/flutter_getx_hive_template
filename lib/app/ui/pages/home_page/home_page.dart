import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/app_text_theme.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Counter page'),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Obx(() => Text(
                      'You have pressed the button ${controller.count.value} times.')),
                ),
                CupertinoButton(
                  onPressed: controller.increment,
                  child: const Icon(CupertinoIcons.add),
                ),
              ],
            ),
          ),
        ));
  }
}
