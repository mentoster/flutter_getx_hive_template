import 'package:flutter/material.dart';
import '../../routes/app_pages.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PagesButtons extends StatelessWidget {
  const PagesButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.INITIAL);
            },
            child: const Text('Counter page')),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.INFO);
            },
            child: const Text('Profile page')),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: const Text('Login page')),
      ],
    );
  }
}
