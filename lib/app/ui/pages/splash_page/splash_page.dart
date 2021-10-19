import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(child: Image.asset("assets/images/cat_avatar.jpg"))),
    );
  }
}
