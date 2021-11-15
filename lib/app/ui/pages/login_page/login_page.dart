import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login_controller.dart';
import 'widgets/sign_in_form.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'.tr),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => controller.registered.value == true
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You are already registered in the app!".tr),
                        Text(
                            "${"Email".tr}: ${controller.loginModel.value.email}"),
                        Text(
                            "${"Password".tr}: ${controller.loginModel.value.password}"),
                      ],
                    )
                  : Container()),
              SignInForm(),
            ],
          ),
        ));
  }
}
